module Pulumi.ResourceOptions
where

data ResourceOptions = ResourceOptions {
    dependsOn :: [IO String]
}

empty = ResourceOptions{
    dependsOn = []
}
