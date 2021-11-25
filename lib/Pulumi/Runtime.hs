{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE GADTs             #-}
{-# LANGUAGE LambdaCase        #-}
{-# LANGUAGE OverloadedLists   #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeOperators     #-}

module Pulumi.Runtime
where
import qualified Data.ByteString.Char8 as C
import Data.List.Split
import qualified Data.Map as Map
import Data.Text.Lazy
import Network.GRPC.HighLevel.Generated
import Pulumi.ResourceOptions
import Pulumi.Types
import Pulumi.Proto.Resource
import System.IO
import System.Environment
import Text.Printf

-- |Fetches the client config to use for gRPC calls to the Pulumi engine resource monitor.
resourceMonitorClientConfig :: IO ClientConfig
resourceMonitorClientConfig = do
    -- Look up the address, passed to us in an environment variable.
    addr <- getEnv("PULUMI_HASKELL_MONITOR_ADDR")
    let addrParts = Data.List.Split.splitOn ":" addr
    return ClientConfig { clientServerHost = Host (C.pack (addrParts!!0))
                        , clientServerPort = Port (read (addrParts!!1))
                        , clientArgs = []
                        , clientSSLConfig = Nothing
                        , clientAuthority = Nothing
                        }

-- |Registers a new resource with the Pulumi runtime, and returns the resulting URN, ID, and output properties.
registerResource :: String -> String -> StringMap -> ResourceOptions -> Output (String, String, StringMap)
registerResource t name props opts = do
    cfg <- resourceMonitorClientConfig
    let req = RegisterResourceRequest
              (pack t) (pack name) "" True Nothing False [] "" [] False "" [] False [] [] "" Nothing False False False False Map.empty []

    withGRPCClient cfg $ \client -> do
        ResourceMonitor{..} <- resourceMonitorClient client
        resourceMonitorRegisterResource (ClientNormalRequest req 360 mempty) >>= \case
            ClientNormalResponse
                (RegisterResourceResponse urn id object stable stables propertyDependencies)
                _ _ StatusOk _              -> return (show urn, show id, Map.empty)
            ClientNormalResponse _ _ _ st _ -> fail $ "Got unexpected status " ++ show st ++ " from call, expecting StatusOk"
            ClientErrorResponse e           -> fail $ "Got client error: " ++ show e
