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
