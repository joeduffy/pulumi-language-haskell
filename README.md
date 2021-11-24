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

## Notes

At the moment you need to define the `PULUMI_HASKELL_PATH` environment variable, since the SDK isn't yet published
as a library. This just points at the `lib/` directory in this repo. So, for instance, if you've cloned it to
`/path/to/pulumi-language-haskell`, you would set `PULUMI_HASKELL_PATH=/path/to/pulumi-language-haskell/lib`.
