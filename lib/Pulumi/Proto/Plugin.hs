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
module Pulumi.Proto.Plugin where
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
 
newtype PluginInfo = PluginInfo{pluginInfoVersion :: Hs.Text}
                     deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)
 
instance HsProtobuf.Named PluginInfo where
        nameOf _ = (Hs.fromString "PluginInfo")
 
instance HsProtobuf.HasDefault PluginInfo
 
instance HsProtobuf.Message PluginInfo where
        encodeMessage _ PluginInfo{pluginInfoVersion = pluginInfoVersion}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   pluginInfoVersion)])
        decodeMessage _
          = (Hs.pure PluginInfo) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "version")
                []
                "")]
 
instance HsJSONPB.ToJSONPB PluginInfo where
        toJSONPB (PluginInfo f1) = (HsJSONPB.object ["version" .= f1])
        toEncodingPB (PluginInfo f1) = (HsJSONPB.pairs ["version" .= f1])
 
instance HsJSONPB.FromJSONPB PluginInfo where
        parseJSONPB
          = (HsJSONPB.withObject "PluginInfo"
               (\ obj -> (Hs.pure PluginInfo) <*> obj .: "version"))
 
instance HsJSONPB.ToJSON PluginInfo where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON PluginInfo where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema PluginInfo where
        declareNamedSchema _
          = do let declare_version = HsJSONPB.declareSchemaRef
               pluginInfoVersion <- declare_version Proxy.Proxy
               let _ = Hs.pure PluginInfo <*> HsJSONPB.asProxy declare_version
               Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName =
                                         Hs.Just "PluginInfo",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList
                                                       [("version", pluginInfoVersion)]}})
 
data PluginDependency = PluginDependency{pluginDependencyName ::
                                         Hs.Text,
                                         pluginDependencyKind :: Hs.Text,
                                         pluginDependencyVersion :: Hs.Text,
                                         pluginDependencyServer :: Hs.Text}
                      deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)
 
instance HsProtobuf.Named PluginDependency where
        nameOf _ = (Hs.fromString "PluginDependency")
 
instance HsProtobuf.HasDefault PluginDependency
 
instance HsProtobuf.Message PluginDependency where
        encodeMessage _
          PluginDependency{pluginDependencyName = pluginDependencyName,
                           pluginDependencyKind = pluginDependencyKind,
                           pluginDependencyVersion = pluginDependencyVersion,
                           pluginDependencyServer = pluginDependencyServer}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   pluginDependencyName),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                   pluginDependencyKind),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 3)
                   pluginDependencyVersion),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 4)
                   pluginDependencyServer)])
        decodeMessage _
          = (Hs.pure PluginDependency) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 2))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 3))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 4))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "name")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 2)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "kind")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 3)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "version")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 4)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "server")
                []
                "")]
 
instance HsJSONPB.ToJSONPB PluginDependency where
        toJSONPB (PluginDependency f1 f2 f3 f4)
          = (HsJSONPB.object
               ["name" .= f1, "kind" .= f2, "version" .= f3, "server" .= f4])
        toEncodingPB (PluginDependency f1 f2 f3 f4)
          = (HsJSONPB.pairs
               ["name" .= f1, "kind" .= f2, "version" .= f3, "server" .= f4])
 
instance HsJSONPB.FromJSONPB PluginDependency where
        parseJSONPB
          = (HsJSONPB.withObject "PluginDependency"
               (\ obj ->
                  (Hs.pure PluginDependency) <*> obj .: "name" <*> obj .: "kind" <*>
                    obj .: "version"
                    <*> obj .: "server"))
 
instance HsJSONPB.ToJSON PluginDependency where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON PluginDependency where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema PluginDependency where
        declareNamedSchema _
          = do let declare_name = HsJSONPB.declareSchemaRef
               pluginDependencyName <- declare_name Proxy.Proxy
               let declare_kind = HsJSONPB.declareSchemaRef
               pluginDependencyKind <- declare_kind Proxy.Proxy
               let declare_version = HsJSONPB.declareSchemaRef
               pluginDependencyVersion <- declare_version Proxy.Proxy
               let declare_server = HsJSONPB.declareSchemaRef
               pluginDependencyServer <- declare_server Proxy.Proxy
               let _ = Hs.pure PluginDependency <*> HsJSONPB.asProxy declare_name
                         <*> HsJSONPB.asProxy declare_kind
                         <*> HsJSONPB.asProxy declare_version
                         <*> HsJSONPB.asProxy declare_server
               Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName =
                                         Hs.Just "PluginDependency",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList
                                                       [("name", pluginDependencyName),
                                                        ("kind", pluginDependencyKind),
                                                        ("version", pluginDependencyVersion),
                                                        ("server", pluginDependencyServer)]}})
