module Pulumi.Resource where
import qualified Pulumi.Runtime as Runtime
import Pulumi.ResourceOptions
import Pulumi.Types

data Resource = Resource {
    t :: String,
    name :: String,
    inputs :: StringMap,
    state :: Output ResourceState,
    opts :: ResourceOptions
}

data ResourceState = ResourceState {
    urn :: String,
    uid :: String,
    outputs :: StringMap
}

decl :: String -> String -> StringMap -> ResourceOptions -> Resource
decl t name props opts = Resource {
    t = t,
    name = name,
    inputs = props,
    opts = opts,
    state = do
        (urn, uid, outputs) <- Runtime.registerResource t name props opts
        return (ResourceState urn uid outputs)
}
