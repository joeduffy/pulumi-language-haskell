module Pulumi.Resource where
import qualified Pulumi.Runtime as Runtime
import Pulumi.ResourceOptions
import Pulumi.Types

data Resource = Resource {
    urn :: IO String,
    rid :: IO String,
    t :: String,
    name :: String,
    inputs :: StringMap,
    outputs :: IO StringMap,
    opts :: ResourceOptions
}

decl :: String -> String -> StringMap -> ResourceOptions -> Resource
decl t name props opts = Resource {
    urn = urn,
    rid = rid,
    t = t,
    name = name,
    inputs = props,
    outputs = outputs,
    opts = opts
} where (urn, rid, outputs) = Runtime.registerResource t name props opts
