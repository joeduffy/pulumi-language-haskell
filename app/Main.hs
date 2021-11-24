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
