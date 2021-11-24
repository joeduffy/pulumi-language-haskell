module Pulumi.Runtime
where
import qualified Data.Map as Map
import Pulumi.ResourceOptions
import Pulumi.Types

-- |Registers a new resource with the Pulumi runtime, and returns the resulting URN, ID, and output properties.
registerResource :: String -> String -> StringMap -> ResourceOptions -> (Output String, Output String, Output StringMap)
registerResource t name props opts =
    (return "URN", return "ID", return Map.empty)
