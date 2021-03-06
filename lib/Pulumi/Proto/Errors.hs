{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE DeriveAnyClass    #-}
{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE GADTs             #-}
{-# LANGUAGE TypeApplications  #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- | Generated by Haskell protocol buffer compiler. DO NOT EDIT!
module Pulumi.Proto.Errors where
import qualified Prelude as Hs
import qualified Proto3.Suite.Class as HsProtobuf
import qualified Proto3.Suite.DotProto as HsProtobuf
import qualified Proto3.Suite.JSONPB as HsJSONPB
import Proto3.Suite.JSONPB ((.=), (.:))
import qualified Proto3.Suite.Types as HsProtobuf
import qualified Proto3.Wire as HsProtobuf
import qualified Control.Applicative as Hs
import Control.Applicative ((<*>), (<|>), (<$>))
import qualified Control.DeepSeq as Hs
import qualified Control.Monad as Hs
import qualified Data.ByteString as Hs
import qualified Data.Coerce as Hs
import qualified Data.Int as Hs (Int16, Int32, Int64)
import qualified Data.List.NonEmpty as Hs (NonEmpty(..))
import qualified Data.Map as Hs (Map, mapKeysMonotonic)
import qualified Data.Proxy as Proxy
import qualified Data.String as Hs (fromString)
import qualified Data.Text.Lazy as Hs (Text)
import qualified Data.Vector as Hs (Vector)
import qualified Data.Word as Hs (Word16, Word32, Word64)
import qualified GHC.Enum as Hs
import qualified GHC.Generics as Hs
import qualified Unsafe.Coerce as Hs
 
data ErrorCause = ErrorCause{errorCauseMessage :: Hs.Text,
                             errorCauseStackTrace :: Hs.Text}
                deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)
 
instance HsProtobuf.Named ErrorCause where
        nameOf _ = (Hs.fromString "ErrorCause")
 
instance HsProtobuf.HasDefault ErrorCause
 
instance HsProtobuf.Message ErrorCause where
        encodeMessage _
          ErrorCause{errorCauseMessage = errorCauseMessage,
                     errorCauseStackTrace = errorCauseStackTrace}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   errorCauseMessage),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                   errorCauseStackTrace)])
        decodeMessage _
          = (Hs.pure ErrorCause) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 2))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "message")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 2)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "stackTrace")
                []
                "")]
 
instance HsJSONPB.ToJSONPB ErrorCause where
        toJSONPB (ErrorCause f1 f2)
          = (HsJSONPB.object ["message" .= f1, "stackTrace" .= f2])
        toEncodingPB (ErrorCause f1 f2)
          = (HsJSONPB.pairs ["message" .= f1, "stackTrace" .= f2])
 
instance HsJSONPB.FromJSONPB ErrorCause where
        parseJSONPB
          = (HsJSONPB.withObject "ErrorCause"
               (\ obj ->
                  (Hs.pure ErrorCause) <*> obj .: "message" <*> obj .: "stackTrace"))
 
instance HsJSONPB.ToJSON ErrorCause where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON ErrorCause where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema ErrorCause where
        declareNamedSchema _
          = do let declare_message = HsJSONPB.declareSchemaRef
               errorCauseMessage <- declare_message Proxy.Proxy
               let declare_stackTrace = HsJSONPB.declareSchemaRef
               errorCauseStackTrace <- declare_stackTrace Proxy.Proxy
               let _ = Hs.pure ErrorCause <*> HsJSONPB.asProxy declare_message <*>
                         HsJSONPB.asProxy declare_stackTrace
               Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName =
                                         Hs.Just "ErrorCause",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList
                                                       [("message", errorCauseMessage),
                                                        ("stackTrace", errorCauseStackTrace)]}})
