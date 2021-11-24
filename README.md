# Pulumi Haskell

This repo contains basic support for Pulumi infrastructure as code using the general purpose language Haskell.

For example, this program declares an AWS S3 Bucket:

```haskell
-- Cons me up an AWS S3 bucket, please! --

import qualified Data.Map as Map
import Pulumi.Resource
import qualified Pulumi.Resource as Resource
import qualified Pulumi.ResourceOptions as ResourceOptions

main = do
    bucketName <- rid $ bucket
    putStrLn bucketName
        where bucket = Resource.decl
                       "aws:s3:Bucket"
                       "my-bucket"
                       Map.empty
                       ResourceOptions.empty
```

The Pulumi engine understands how to produce a desired state for our infrastructure from this program, and a
preview of changes it would make in order to converge towards that state. And then, if we choose to do so, we
can apply that preview in order to bring our infrastructure reality into being.
