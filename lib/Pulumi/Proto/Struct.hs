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
module Pulumi.Proto.Struct where
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
 
newtype Struct = Struct{structFields ::
                        Hs.Map Hs.Text (Hs.Maybe Pulumi.Proto.Struct.Value)}
                 deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)
 
instance HsProtobuf.Named Struct where
        nameOf _ = (Hs.fromString "Struct")
 
instance HsProtobuf.HasDefault Struct
 
instance HsProtobuf.Message Struct where
        encodeMessage _ Struct{structFields = structFields}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   (Hs.unsafeCoerce @(Hs.Map Hs.Text (Hs.Maybe Pulumi.Proto.Struct.Value))
                      @(Hs.Map Hs.Text (HsProtobuf.Nested Pulumi.Proto.Struct.Value))
                      structFields))])
        decodeMessage _
          = (Hs.pure Struct) <*>
              (Hs.unsafeCoerce
                 @(_ (Hs.Map Hs.Text (HsProtobuf.Nested Pulumi.Proto.Struct.Value)))
                 @(_ (Hs.Map Hs.Text (Hs.Maybe Pulumi.Proto.Struct.Value)))
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 1)))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Map HsProtobuf.String
                   (HsProtobuf.Named (HsProtobuf.Single "Value")))
                (HsProtobuf.Single "fields")
                []
                "")]
 
instance HsJSONPB.ToJSONPB Struct where
        toJSONPB (Struct f1) = (HsJSONPB.object ["fields" .= f1])
        toEncodingPB (Struct f1) = (HsJSONPB.pairs ["fields" .= f1])
 
instance HsJSONPB.FromJSONPB Struct where
        parseJSONPB
          = (HsJSONPB.withObject "Struct"
               (\ obj -> (Hs.pure Struct) <*> obj .: "fields"))
 
instance HsJSONPB.ToJSON Struct where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON Struct where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema Struct where
        declareNamedSchema _
          = do let declare_fields = HsJSONPB.declareSchemaRef
               structFields <- declare_fields Proxy.Proxy
               let _ = Hs.pure Struct <*> HsJSONPB.asProxy declare_fields
               Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName = Hs.Just "Struct",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList
                                                       [("fields", structFields)]}})
 
newtype Value = Value{valueKind :: Hs.Maybe ValueKind}
                deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)
 
instance HsProtobuf.Named Value where
        nameOf _ = (Hs.fromString "Value")
 
instance HsProtobuf.HasDefault Value
 
instance HsProtobuf.Message Value where
        encodeMessage _ Value{valueKind = valueKind}
          = (Hs.mconcat
               [case valueKind of
                    Hs.Nothing -> Hs.mempty
                    Hs.Just x
                      -> case x of
                             ValueKindNullValue y
                               -> (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                                     (HsProtobuf.ForceEmit y))
                             ValueKindNumberValue y
                               -> (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                                     (HsProtobuf.ForceEmit y))
                             ValueKindStringValue y
                               -> (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 3)
                                     (HsProtobuf.ForceEmit y))
                             ValueKindBoolValue y
                               -> (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 4)
                                     (HsProtobuf.ForceEmit y))
                             ValueKindStructValue y
                               -> (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 5)
                                     (Hs.coerce @(Hs.Maybe Pulumi.Proto.Struct.Struct)
                                        @(HsProtobuf.Nested Pulumi.Proto.Struct.Struct)
                                        (Hs.Just y)))
                             ValueKindListValue y
                               -> (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 6)
                                     (Hs.coerce @(Hs.Maybe Pulumi.Proto.Struct.ListValue)
                                        @(HsProtobuf.Nested Pulumi.Proto.Struct.ListValue)
                                        (Hs.Just y)))])
        decodeMessage _
          = (Hs.pure Value) <*>
              (HsProtobuf.oneof Hs.Nothing
                 [((HsProtobuf.FieldNumber 1),
                   (Hs.pure (Hs.Just Hs.. ValueKindNullValue)) <*>
                     HsProtobuf.decodeMessageField),
                  ((HsProtobuf.FieldNumber 2),
                   (Hs.pure (Hs.Just Hs.. ValueKindNumberValue)) <*>
                     HsProtobuf.decodeMessageField),
                  ((HsProtobuf.FieldNumber 3),
                   (Hs.pure (Hs.Just Hs.. ValueKindStringValue)) <*>
                     HsProtobuf.decodeMessageField),
                  ((HsProtobuf.FieldNumber 4),
                   (Hs.pure (Hs.Just Hs.. ValueKindBoolValue)) <*>
                     HsProtobuf.decodeMessageField),
                  ((HsProtobuf.FieldNumber 5),
                   (Hs.pure (Hs.fmap ValueKindStructValue)) <*>
                     (Hs.coerce @(_ (HsProtobuf.Nested Pulumi.Proto.Struct.Struct))
                        @(_ (Hs.Maybe Pulumi.Proto.Struct.Struct))
                        HsProtobuf.decodeMessageField)),
                  ((HsProtobuf.FieldNumber 6),
                   (Hs.pure (Hs.fmap ValueKindListValue)) <*>
                     (Hs.coerce @(_ (HsProtobuf.Nested Pulumi.Proto.Struct.ListValue))
                        @(_ (Hs.Maybe Pulumi.Proto.Struct.ListValue))
                        HsProtobuf.decodeMessageField))])
        dotProto _ = []
 
instance HsJSONPB.ToJSONPB Value where
        toJSONPB (Value f1_or_f2_or_f3_or_f4_or_f5_or_f6)
          = (HsJSONPB.object
               [(let encodeKind
                       = (case f1_or_f2_or_f3_or_f4_or_f5_or_f6 of
                              Hs.Just (ValueKindNullValue f1) -> (HsJSONPB.pair "null_value" f1)
                              Hs.Just (ValueKindNumberValue f2)
                                -> (HsJSONPB.pair "number_value" f2)
                              Hs.Just (ValueKindStringValue f3)
                                -> (HsJSONPB.pair "string_value" f3)
                              Hs.Just (ValueKindBoolValue f4) -> (HsJSONPB.pair "bool_value" f4)
                              Hs.Just (ValueKindStructValue f5)
                                -> (HsJSONPB.pair "struct_value" f5)
                              Hs.Just (ValueKindListValue f6) -> (HsJSONPB.pair "list_value" f6)
                              Hs.Nothing -> Hs.mempty)
                   in
                   \ options ->
                     if HsJSONPB.optEmitNamedOneof options then
                       ("kind" .= (HsJSONPB.objectOrNull [encodeKind] options)) options
                       else encodeKind options)])
        toEncodingPB (Value f1_or_f2_or_f3_or_f4_or_f5_or_f6)
          = (HsJSONPB.pairs
               [(let encodeKind
                       = (case f1_or_f2_or_f3_or_f4_or_f5_or_f6 of
                              Hs.Just (ValueKindNullValue f1) -> (HsJSONPB.pair "null_value" f1)
                              Hs.Just (ValueKindNumberValue f2)
                                -> (HsJSONPB.pair "number_value" f2)
                              Hs.Just (ValueKindStringValue f3)
                                -> (HsJSONPB.pair "string_value" f3)
                              Hs.Just (ValueKindBoolValue f4) -> (HsJSONPB.pair "bool_value" f4)
                              Hs.Just (ValueKindStructValue f5)
                                -> (HsJSONPB.pair "struct_value" f5)
                              Hs.Just (ValueKindListValue f6) -> (HsJSONPB.pair "list_value" f6)
                              Hs.Nothing -> Hs.mempty)
                   in
                   \ options ->
                     if HsJSONPB.optEmitNamedOneof options then
                       ("kind" .= (HsJSONPB.pairsOrNull [encodeKind] options)) options
                       else encodeKind options)])
 
instance HsJSONPB.FromJSONPB Value where
        parseJSONPB
          = (HsJSONPB.withObject "Value"
               (\ obj ->
                  (Hs.pure Value) <*>
                    (let parseKind parseObj
                           = Hs.msum
                               [Hs.Just Hs.. ValueKindNullValue <$>
                                  (HsJSONPB.parseField parseObj "null_value"),
                                Hs.Just Hs.. ValueKindNumberValue <$>
                                  (HsJSONPB.parseField parseObj "number_value"),
                                Hs.Just Hs.. ValueKindStringValue <$>
                                  (HsJSONPB.parseField parseObj "string_value"),
                                Hs.Just Hs.. ValueKindBoolValue <$>
                                  (HsJSONPB.parseField parseObj "bool_value"),
                                Hs.Just Hs.. ValueKindStructValue <$>
                                  (HsJSONPB.parseField parseObj "struct_value"),
                                Hs.Just Hs.. ValueKindListValue <$>
                                  (HsJSONPB.parseField parseObj "list_value"),
                                Hs.pure Hs.Nothing]
                       in
                       ((obj .: "kind") Hs.>>= (HsJSONPB.withObject "kind" parseKind)) <|>
                         (parseKind obj))))
 
instance HsJSONPB.ToJSON Value where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON Value where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema Value where
        declareNamedSchema _
          = do let declare_kind = HsJSONPB.declareSchemaRef
               valueKind <- declare_kind Proxy.Proxy
               let _ = Hs.pure Value <*> HsJSONPB.asProxy declare_kind
               Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName = Hs.Just "Value",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList
                                                       [("kind", valueKind)]}})
 
data ValueKind = ValueKindNullValue (HsProtobuf.Enumerated
                                       Pulumi.Proto.Struct.NullValue)
               | ValueKindNumberValue Hs.Double
               | ValueKindStringValue Hs.Text
               | ValueKindBoolValue Hs.Bool
               | ValueKindStructValue Pulumi.Proto.Struct.Struct
               | ValueKindListValue Pulumi.Proto.Struct.ListValue
               deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)
 
instance HsProtobuf.Named ValueKind where
        nameOf _ = (Hs.fromString "ValueKind")
 
instance HsJSONPB.ToSchema ValueKind where
        declareNamedSchema _
          = do let declare_null_value = HsJSONPB.declareSchemaRef
               valueKindNullValue <- declare_null_value Proxy.Proxy
               let _ = Hs.pure ValueKindNullValue <*>
                         HsJSONPB.asProxy declare_null_value
               let declare_number_value = HsJSONPB.declareSchemaRef
               valueKindNumberValue <- declare_number_value Proxy.Proxy
               let _ = Hs.pure ValueKindNumberValue <*>
                         HsJSONPB.asProxy declare_number_value
               let declare_string_value = HsJSONPB.declareSchemaRef
               valueKindStringValue <- declare_string_value Proxy.Proxy
               let _ = Hs.pure ValueKindStringValue <*>
                         HsJSONPB.asProxy declare_string_value
               let declare_bool_value = HsJSONPB.declareSchemaRef
               valueKindBoolValue <- declare_bool_value Proxy.Proxy
               let _ = Hs.pure ValueKindBoolValue <*>
                         HsJSONPB.asProxy declare_bool_value
               let declare_struct_value = HsJSONPB.declareSchemaRef
               valueKindStructValue <- declare_struct_value Proxy.Proxy
               let _ = Hs.pure ValueKindStructValue <*>
                         HsJSONPB.asProxy declare_struct_value
               let declare_list_value = HsJSONPB.declareSchemaRef
               valueKindListValue <- declare_list_value Proxy.Proxy
               let _ = Hs.pure ValueKindListValue <*>
                         HsJSONPB.asProxy declare_list_value
               Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName =
                                         Hs.Just "ValueKind",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList
                                                       [("null_value", valueKindNullValue),
                                                        ("number_value", valueKindNumberValue),
                                                        ("string_value", valueKindStringValue),
                                                        ("bool_value", valueKindBoolValue),
                                                        ("struct_value", valueKindStructValue),
                                                        ("list_value", valueKindListValue)],
                                                   HsJSONPB._schemaMinProperties = Hs.Just 1,
                                                   HsJSONPB._schemaMaxProperties = Hs.Just 1}})
 
data NullValue = NullValueNULL_VALUE
               deriving (Hs.Show, Hs.Eq, Hs.Generic, Hs.NFData)
 
instance HsProtobuf.Named NullValue where
        nameOf _ = (Hs.fromString "NullValue")
 
instance HsProtobuf.HasDefault NullValue
 
instance Hs.Bounded NullValue where
        minBound = NullValueNULL_VALUE
        maxBound = NullValueNULL_VALUE
 
instance Hs.Ord NullValue where
        compare x y
          = Hs.compare (HsProtobuf.fromProtoEnum x)
              (HsProtobuf.fromProtoEnum y)
 
instance HsProtobuf.ProtoEnum NullValue where
        toProtoEnumMay 0 = Hs.Just NullValueNULL_VALUE
        toProtoEnumMay _ = Hs.Nothing
        fromProtoEnum (NullValueNULL_VALUE) = 0
 
instance HsJSONPB.ToJSONPB NullValue where
        toJSONPB x _ = HsJSONPB.enumFieldString x
        toEncodingPB x _ = HsJSONPB.enumFieldEncoding x
 
instance HsJSONPB.FromJSONPB NullValue where
        parseJSONPB (HsJSONPB.String "NULL_VALUE")
          = Hs.pure NullValueNULL_VALUE
        parseJSONPB v = (HsJSONPB.typeMismatch "NullValue" v)
 
instance HsJSONPB.ToJSON NullValue where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON NullValue where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsProtobuf.Finite NullValue
 
newtype ListValue = ListValue{listValueValues ::
                              Hs.Vector Pulumi.Proto.Struct.Value}
                    deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)
 
instance HsProtobuf.Named ListValue where
        nameOf _ = (Hs.fromString "ListValue")
 
instance HsProtobuf.HasDefault ListValue
 
instance HsProtobuf.Message ListValue where
        encodeMessage _ ListValue{listValueValues = listValueValues}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   (Hs.coerce @(Hs.Vector Pulumi.Proto.Struct.Value)
                      @(HsProtobuf.NestedVec Pulumi.Proto.Struct.Value)
                      listValueValues))])
        decodeMessage _
          = (Hs.pure ListValue) <*>
              (Hs.coerce @(_ (HsProtobuf.NestedVec Pulumi.Proto.Struct.Value))
                 @(_ (Hs.Vector Pulumi.Proto.Struct.Value))
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 1)))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Repeated
                   (HsProtobuf.Named (HsProtobuf.Single "Value")))
                (HsProtobuf.Single "values")
                []
                "")]
 
instance HsJSONPB.ToJSONPB ListValue where
        toJSONPB (ListValue f1) = (HsJSONPB.object ["values" .= f1])
        toEncodingPB (ListValue f1) = (HsJSONPB.pairs ["values" .= f1])
 
instance HsJSONPB.FromJSONPB ListValue where
        parseJSONPB
          = (HsJSONPB.withObject "ListValue"
               (\ obj -> (Hs.pure ListValue) <*> obj .: "values"))
 
instance HsJSONPB.ToJSON ListValue where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON ListValue where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema ListValue where
        declareNamedSchema _
          = do let declare_values = HsJSONPB.declareSchemaRef
               listValueValues <- declare_values Proxy.Proxy
               let _ = Hs.pure ListValue <*> HsJSONPB.asProxy declare_values
               Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName =
                                         Hs.Just "ListValue",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList
                                                       [("values", listValueValues)]}})
