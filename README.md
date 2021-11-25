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
    bucketState <- state $ bucket
    let bucketName = uid $ bucketState
    putStrLn bucketName
        where bucket = Resource.decl
                       "aws:s3/bucket:Bucket"
                       "my-bucket"
                       Map.empty
                       ResourceOptions.empty
```

The Pulumi engine understands how to produce a desired state for our infrastructure from this program, and a
preview of changes it would make in order to converge towards that state. And then, if we choose to do so, we
can apply that preview in order to bring our infrastructure reality into being.

## How to Use It

First, [install Pulumi](https://www.pulumi.com/docs/get-started/install/).

Next, ensure [you have Haskell installed](https://www.haskell.org/ghcup/). In particular, you will need at least
`ghc`, `cabal`, and `runhaskell`. The GHCup framework makes it easy to manage these installations.

Now that you've got that, simply run `cabal build` from the root of this repo to build the client library and server
binary. The server binary is named `pulumi-language-haskell` and is how Pulumi knows how to run and host Haskell
programs. It needs to be on your `PATH` for the `pulumi` CLI to find it.

Once you've done all of that, you can `cd` into `app/` and run `pulumi up` and magic should occur.
