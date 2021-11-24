{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Main
where
import Data.Text.Lazy
import GHC.IO.Exception
import Pulumi.Proto.Empty
import Pulumi.Proto.Language
import Pulumi.Proto.Plugin
import Network.GRPC.HighLevel.Generated
import System.Directory
import System.Environment
import System.IO
import System.Process
import Text.Printf

-- Define the gRPC handlers for the language host.
handlers :: LanguageRuntime ServerRequest ServerResponse
handlers = LanguageRuntime { languageRuntimeGetPluginInfo = getPluginInfoHandler
                           , languageRuntimeGetRequiredPlugins = getRequiredPluginsHandler
                           , languageRuntimeRun = runHandler
                           }

getPluginInfoHandler :: ServerRequest 'Normal Empty PluginInfo
                        -> IO (ServerResponse 'Normal PluginInfo)
getPluginInfoHandler (ServerNormalRequest _metadata Empty) = do
    return (ServerNormalResponse (PluginInfo ("0.1"))
                                 []
                                 StatusOk
                                 "")

getRequiredPluginsHandler :: ServerRequest 'Normal GetRequiredPluginsRequest GetRequiredPluginsResponse
                             -> IO (ServerResponse 'Normal GetRequiredPluginsResponse)
getRequiredPluginsHandler (ServerNormalRequest _metadata (GetRequiredPluginsRequest project pwd program)) = do
    return (ServerNormalResponse (GetRequiredPluginsResponse ([]))
                                 []
                                 StatusOk
                                 "")

runHandler :: ServerRequest 'Normal RunRequest RunResponse
              -> IO (ServerResponse 'Normal RunResponse)
runHandler (ServerNormalRequest _metadata (RunRequest project stack pwd program args config dryRun parallel monitor_address queryMode configSecretKeys)) = do
    -- Find the "runhaskell" binary.
    runBin <- findExecutable "runhaskell"
    case runBin of
        Nothing -> error "'runhaskell' missing from your PATH"
        Just _  -> do
            -- Stuff the arguments into an environment bag.
            let env = Just([
                              ("PULUMI_HASKELL_PROJECT"     , show project)
                            , ("PULUMI_HASKELL_STACK"       , show stack)
                            , ("PULUMI_HASKELL_DRY_RUN"     , show dryRun)
                            , ("PULUMI_HASKELL_PARALLEL"    , show parallel)
                            , ("PULUMI_HASKELL_MONITOR_ADDR", show monitor_address)
                           ])

            -- HACK: for now we need to direct runhaskell where to find the Pulumi
            -- Haskell SDK modules (it's not distributed as a real library yet).
            plib <- getEnv "PULUMI_HASKELL_PATH"

            -- Execute the program and let it speak directly to the engine.
            (_, _, _, ph) <- createProcess (proc "runhaskell" ["-i" ++ plib, "Main.hs"]){
                env = env,
                std_out = Inherit,
                std_err = Inherit
            }
            exitCode <- waitForProcess ph
            _ <- hFlush stdout
            _ <- hFlush stderr

            -- If the process had an error code, translate that into a textual message.
            let errorMsg :: String = case exitCode of ExitSuccess -> ""
                                                      ExitFailure n -> printf "Program exited with non-zero exit code: %d" n

            -- Finally, return the response.
            let answer = RunResponse (pack errorMsg) False
            return (ServerNormalResponse answer [] StatusOk "")

-- Configure the options for our gRPC server.
options :: ServiceOptions
options = defaultServiceOptions { serverHost = "127.0.0.1" }

-- Spawn the main function which does some set up and then runs our server.
main :: IO ()
main = do
    -- Print the gRPC server port so that Pulumi knows how to dial us.
    print (unPort $ serverPort $ options)
    hFlush stdout

    -- Now run the language server until the end of time.
    languageRuntimeServer handlers options
