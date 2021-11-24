{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE BangPatterns #-}

module Main
where
import Pulumi.Proto.Empty
import Pulumi.Proto.Language
import Pulumi.Proto.Plugin
import Network.GRPC.HighLevel.Generated

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
    let answer = RunResponse "" False
    return (ServerNormalResponse answer
                                 []
                                 StatusOk
                                 "")

options :: ServiceOptions
options = defaultServiceOptions

main :: IO ()
main = languageRuntimeServer handlers options
