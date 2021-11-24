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
module Pulumi.Proto.Language where
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
import Network.GRPC.HighLevel.Generated as HsGRPC
import Network.GRPC.HighLevel.Client as HsGRPC
import Network.GRPC.HighLevel.Server as HsGRPC hiding (serverLoop)
import Network.GRPC.HighLevel.Server.Unregistered as HsGRPC
       (serverLoop)
import qualified Pulumi.Proto.Empty
import qualified Pulumi.Proto.Plugin
 
data LanguageRuntime request
     response = LanguageRuntime{languageRuntimeGetRequiredPlugins ::
                                request 'HsGRPC.Normal Pulumi.Proto.Language.GetRequiredPluginsRequest
                                  Pulumi.Proto.Language.GetRequiredPluginsResponse
                                  ->
                                  Hs.IO
                                    (response 'HsGRPC.Normal Pulumi.Proto.Language.GetRequiredPluginsResponse),
                                languageRuntimeRun ::
                                request 'HsGRPC.Normal Pulumi.Proto.Language.RunRequest Pulumi.Proto.Language.RunResponse ->
                                  Hs.IO (response 'HsGRPC.Normal Pulumi.Proto.Language.RunResponse),
                                languageRuntimeGetPluginInfo ::
                                request 'HsGRPC.Normal Pulumi.Proto.Empty.Empty
                                  Pulumi.Proto.Plugin.PluginInfo
                                  -> Hs.IO (response 'HsGRPC.Normal Pulumi.Proto.Plugin.PluginInfo)}
              deriving Hs.Generic
 
languageRuntimeServer ::
                        LanguageRuntime HsGRPC.ServerRequest HsGRPC.ServerResponse ->
                          HsGRPC.ServiceOptions -> Hs.IO ()
languageRuntimeServer
  LanguageRuntime{languageRuntimeGetRequiredPlugins =
                    languageRuntimeGetRequiredPlugins,
                  languageRuntimeRun = languageRuntimeRun,
                  languageRuntimeGetPluginInfo = languageRuntimeGetPluginInfo}
  (ServiceOptions serverHost serverPort useCompression
     userAgentPrefix userAgentSuffix initialMetadata sslConfig logger
     serverMaxReceiveMessageLength)
  = (HsGRPC.serverLoop
       HsGRPC.defaultOptions{HsGRPC.optNormalHandlers =
                               [(HsGRPC.UnaryHandler
                                   (HsGRPC.MethodName
                                      "/pulumirpc.LanguageRuntime/GetRequiredPlugins")
                                   (HsGRPC.convertGeneratedServerHandler
                                      languageRuntimeGetRequiredPlugins)),
                                (HsGRPC.UnaryHandler
                                   (HsGRPC.MethodName "/pulumirpc.LanguageRuntime/Run")
                                   (HsGRPC.convertGeneratedServerHandler languageRuntimeRun)),
                                (HsGRPC.UnaryHandler
                                   (HsGRPC.MethodName "/pulumirpc.LanguageRuntime/GetPluginInfo")
                                   (HsGRPC.convertGeneratedServerHandler
                                      languageRuntimeGetPluginInfo))],
                             HsGRPC.optClientStreamHandlers = [],
                             HsGRPC.optServerStreamHandlers = [],
                             HsGRPC.optBiDiStreamHandlers = [], optServerHost = serverHost,
                             optServerPort = serverPort, optUseCompression = useCompression,
                             optUserAgentPrefix = userAgentPrefix,
                             optUserAgentSuffix = userAgentSuffix,
                             optInitialMetadata = initialMetadata, optSSLConfig = sslConfig,
                             optLogger = logger,
                             optMaxReceiveMessageLength = serverMaxReceiveMessageLength})
 
languageRuntimeClient ::
                        HsGRPC.Client ->
                          Hs.IO (LanguageRuntime HsGRPC.ClientRequest HsGRPC.ClientResult)
languageRuntimeClient client
  = (Hs.pure LanguageRuntime) <*>
      ((Hs.pure (HsGRPC.clientRequest client)) <*>
         (HsGRPC.clientRegisterMethod client
            (HsGRPC.MethodName
               "/pulumirpc.LanguageRuntime/GetRequiredPlugins")))
      <*>
      ((Hs.pure (HsGRPC.clientRequest client)) <*>
         (HsGRPC.clientRegisterMethod client
            (HsGRPC.MethodName "/pulumirpc.LanguageRuntime/Run")))
      <*>
      ((Hs.pure (HsGRPC.clientRequest client)) <*>
         (HsGRPC.clientRegisterMethod client
            (HsGRPC.MethodName "/pulumirpc.LanguageRuntime/GetPluginInfo")))
 
data GetRequiredPluginsRequest = GetRequiredPluginsRequest{getRequiredPluginsRequestProject
                                                           :: Hs.Text,
                                                           getRequiredPluginsRequestPwd :: Hs.Text,
                                                           getRequiredPluginsRequestProgram ::
                                                           Hs.Text}
                               deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)
 
instance HsProtobuf.Named GetRequiredPluginsRequest where
        nameOf _ = (Hs.fromString "GetRequiredPluginsRequest")
 
instance HsProtobuf.HasDefault GetRequiredPluginsRequest
 
instance HsProtobuf.Message GetRequiredPluginsRequest where
        encodeMessage _
          GetRequiredPluginsRequest{getRequiredPluginsRequestProject =
                                      getRequiredPluginsRequestProject,
                                    getRequiredPluginsRequestPwd = getRequiredPluginsRequestPwd,
                                    getRequiredPluginsRequestProgram =
                                      getRequiredPluginsRequestProgram}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   getRequiredPluginsRequestProject),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                   getRequiredPluginsRequestPwd),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 3)
                   getRequiredPluginsRequestProgram)])
        decodeMessage _
          = (Hs.pure GetRequiredPluginsRequest) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 2))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 3))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "project")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 2)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "pwd")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 3)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "program")
                []
                "")]
 
instance HsJSONPB.ToJSONPB GetRequiredPluginsRequest where
        toJSONPB (GetRequiredPluginsRequest f1 f2 f3)
          = (HsJSONPB.object ["project" .= f1, "pwd" .= f2, "program" .= f3])
        toEncodingPB (GetRequiredPluginsRequest f1 f2 f3)
          = (HsJSONPB.pairs ["project" .= f1, "pwd" .= f2, "program" .= f3])
 
instance HsJSONPB.FromJSONPB GetRequiredPluginsRequest where
        parseJSONPB
          = (HsJSONPB.withObject "GetRequiredPluginsRequest"
               (\ obj ->
                  (Hs.pure GetRequiredPluginsRequest) <*> obj .: "project" <*>
                    obj .: "pwd"
                    <*> obj .: "program"))
 
instance HsJSONPB.ToJSON GetRequiredPluginsRequest where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON GetRequiredPluginsRequest where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema GetRequiredPluginsRequest where
        declareNamedSchema _
          = do let declare_project = HsJSONPB.declareSchemaRef
               getRequiredPluginsRequestProject <- declare_project Proxy.Proxy
               let declare_pwd = HsJSONPB.declareSchemaRef
               getRequiredPluginsRequestPwd <- declare_pwd Proxy.Proxy
               let declare_program = HsJSONPB.declareSchemaRef
               getRequiredPluginsRequestProgram <- declare_program Proxy.Proxy
               let _ = Hs.pure GetRequiredPluginsRequest <*>
                         HsJSONPB.asProxy declare_project
                         <*> HsJSONPB.asProxy declare_pwd
                         <*> HsJSONPB.asProxy declare_program
               Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName =
                                         Hs.Just "GetRequiredPluginsRequest",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList
                                                       [("project",
                                                         getRequiredPluginsRequestProject),
                                                        ("pwd", getRequiredPluginsRequestPwd),
                                                        ("program",
                                                         getRequiredPluginsRequestProgram)]}})
 
newtype GetRequiredPluginsResponse = GetRequiredPluginsResponse{getRequiredPluginsResponsePlugins
                                                                ::
                                                                Hs.Vector Pulumi.Proto.Plugin.PluginDependency}
                                     deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)
 
instance HsProtobuf.Named GetRequiredPluginsResponse where
        nameOf _ = (Hs.fromString "GetRequiredPluginsResponse")
 
instance HsProtobuf.HasDefault GetRequiredPluginsResponse
 
instance HsProtobuf.Message GetRequiredPluginsResponse where
        encodeMessage _
          GetRequiredPluginsResponse{getRequiredPluginsResponsePlugins =
                                       getRequiredPluginsResponsePlugins}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   (Hs.coerce @(Hs.Vector Pulumi.Proto.Plugin.PluginDependency)
                      @(HsProtobuf.NestedVec Pulumi.Proto.Plugin.PluginDependency)
                      getRequiredPluginsResponsePlugins))])
        decodeMessage _
          = (Hs.pure GetRequiredPluginsResponse) <*>
              (Hs.coerce @(_ (HsProtobuf.NestedVec Pulumi.Proto.Plugin.PluginDependency))
                 @(_ (Hs.Vector Pulumi.Proto.Plugin.PluginDependency))
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 1)))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Repeated
                   (HsProtobuf.Named (HsProtobuf.Single "PluginDependency")))
                (HsProtobuf.Single "plugins")
                []
                "")]
 
instance HsJSONPB.ToJSONPB GetRequiredPluginsResponse where
        toJSONPB (GetRequiredPluginsResponse f1)
          = (HsJSONPB.object ["plugins" .= f1])
        toEncodingPB (GetRequiredPluginsResponse f1)
          = (HsJSONPB.pairs ["plugins" .= f1])
 
instance HsJSONPB.FromJSONPB GetRequiredPluginsResponse where
        parseJSONPB
          = (HsJSONPB.withObject "GetRequiredPluginsResponse"
               (\ obj ->
                  (Hs.pure GetRequiredPluginsResponse) <*> obj .: "plugins"))
 
instance HsJSONPB.ToJSON GetRequiredPluginsResponse where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON GetRequiredPluginsResponse where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema GetRequiredPluginsResponse where
        declareNamedSchema _
          = do let declare_plugins = HsJSONPB.declareSchemaRef
               getRequiredPluginsResponsePlugins <- declare_plugins Proxy.Proxy
               let _ = Hs.pure GetRequiredPluginsResponse <*>
                         HsJSONPB.asProxy declare_plugins
               Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName =
                                         Hs.Just "GetRequiredPluginsResponse",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList
                                                       [("plugins",
                                                         getRequiredPluginsResponsePlugins)]}})
 
data RunRequest = RunRequest{runRequestProject :: Hs.Text,
                             runRequestStack :: Hs.Text, runRequestPwd :: Hs.Text,
                             runRequestProgram :: Hs.Text, runRequestArgs :: Hs.Vector Hs.Text,
                             runRequestConfig :: Hs.Map Hs.Text Hs.Text,
                             runRequestDryRun :: Hs.Bool, runRequestParallel :: Hs.Int32,
                             runRequestMonitorAddress :: Hs.Text,
                             runRequestQueryMode :: Hs.Bool,
                             runRequestConfigSecretKeys :: Hs.Vector Hs.Text}
                deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)
 
instance HsProtobuf.Named RunRequest where
        nameOf _ = (Hs.fromString "RunRequest")
 
instance HsProtobuf.HasDefault RunRequest
 
instance HsProtobuf.Message RunRequest where
        encodeMessage _
          RunRequest{runRequestProject = runRequestProject,
                     runRequestStack = runRequestStack, runRequestPwd = runRequestPwd,
                     runRequestProgram = runRequestProgram,
                     runRequestArgs = runRequestArgs,
                     runRequestConfig = runRequestConfig,
                     runRequestDryRun = runRequestDryRun,
                     runRequestParallel = runRequestParallel,
                     runRequestMonitorAddress = runRequestMonitorAddress,
                     runRequestQueryMode = runRequestQueryMode,
                     runRequestConfigSecretKeys = runRequestConfigSecretKeys}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   runRequestProject),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                   runRequestStack),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 3)
                   runRequestPwd),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 4)
                   runRequestProgram),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 5)
                   (Hs.coerce @(Hs.Vector Hs.Text) @(HsProtobuf.UnpackedVec Hs.Text)
                      runRequestArgs)),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 6)
                   runRequestConfig),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 7)
                   runRequestDryRun),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 8)
                   runRequestParallel),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 9)
                   runRequestMonitorAddress),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 10)
                   runRequestQueryMode),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 11)
                   (Hs.coerce @(Hs.Vector Hs.Text) @(HsProtobuf.UnpackedVec Hs.Text)
                      runRequestConfigSecretKeys))])
        decodeMessage _
          = (Hs.pure RunRequest) <*>
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
              <*>
              (Hs.coerce @(_ (HsProtobuf.UnpackedVec Hs.Text))
                 @(_ (Hs.Vector Hs.Text))
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 5)))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 6))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 7))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 8))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 9))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 10))
              <*>
              (Hs.coerce @(_ (HsProtobuf.UnpackedVec Hs.Text))
                 @(_ (Hs.Vector Hs.Text))
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 11)))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "project")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 2)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "stack")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 3)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "pwd")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 4)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "program")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 5)
                (HsProtobuf.Repeated HsProtobuf.String)
                (HsProtobuf.Single "args")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 6)
                (HsProtobuf.Map HsProtobuf.String HsProtobuf.String)
                (HsProtobuf.Single "config")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 7)
                (HsProtobuf.Prim HsProtobuf.Bool)
                (HsProtobuf.Single "dryRun")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 8)
                (HsProtobuf.Prim HsProtobuf.Int32)
                (HsProtobuf.Single "parallel")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 9)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "monitor_address")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 10)
                (HsProtobuf.Prim HsProtobuf.Bool)
                (HsProtobuf.Single "queryMode")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 11)
                (HsProtobuf.Repeated HsProtobuf.String)
                (HsProtobuf.Single "configSecretKeys")
                []
                "")]
 
instance HsJSONPB.ToJSONPB RunRequest where
        toJSONPB (RunRequest f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11)
          = (HsJSONPB.object
               ["project" .= f1, "stack" .= f2, "pwd" .= f3, "program" .= f4,
                "args" .= f5, "config" .= f6, "dryRun" .= f7, "parallel" .= f8,
                "monitor_address" .= f9, "queryMode" .= f10,
                "configSecretKeys" .= f11])
        toEncodingPB (RunRequest f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11)
          = (HsJSONPB.pairs
               ["project" .= f1, "stack" .= f2, "pwd" .= f3, "program" .= f4,
                "args" .= f5, "config" .= f6, "dryRun" .= f7, "parallel" .= f8,
                "monitor_address" .= f9, "queryMode" .= f10,
                "configSecretKeys" .= f11])
 
instance HsJSONPB.FromJSONPB RunRequest where
        parseJSONPB
          = (HsJSONPB.withObject "RunRequest"
               (\ obj ->
                  (Hs.pure RunRequest) <*> obj .: "project" <*> obj .: "stack" <*>
                    obj .: "pwd"
                    <*> obj .: "program"
                    <*> obj .: "args"
                    <*> obj .: "config"
                    <*> obj .: "dryRun"
                    <*> obj .: "parallel"
                    <*> obj .: "monitor_address"
                    <*> obj .: "queryMode"
                    <*> obj .: "configSecretKeys"))
 
instance HsJSONPB.ToJSON RunRequest where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON RunRequest where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema RunRequest where
        declareNamedSchema _
          = do let declare_project = HsJSONPB.declareSchemaRef
               runRequestProject <- declare_project Proxy.Proxy
               let declare_stack = HsJSONPB.declareSchemaRef
               runRequestStack <- declare_stack Proxy.Proxy
               let declare_pwd = HsJSONPB.declareSchemaRef
               runRequestPwd <- declare_pwd Proxy.Proxy
               let declare_program = HsJSONPB.declareSchemaRef
               runRequestProgram <- declare_program Proxy.Proxy
               let declare_args = HsJSONPB.declareSchemaRef
               runRequestArgs <- declare_args Proxy.Proxy
               let declare_config = HsJSONPB.declareSchemaRef
               runRequestConfig <- declare_config Proxy.Proxy
               let declare_dryRun = HsJSONPB.declareSchemaRef
               runRequestDryRun <- declare_dryRun Proxy.Proxy
               let declare_parallel = HsJSONPB.declareSchemaRef
               runRequestParallel <- declare_parallel Proxy.Proxy
               let declare_monitor_address = HsJSONPB.declareSchemaRef
               runRequestMonitorAddress <- declare_monitor_address Proxy.Proxy
               let declare_queryMode = HsJSONPB.declareSchemaRef
               runRequestQueryMode <- declare_queryMode Proxy.Proxy
               let declare_configSecretKeys = HsJSONPB.declareSchemaRef
               runRequestConfigSecretKeys <- declare_configSecretKeys Proxy.Proxy
               let _ = Hs.pure RunRequest <*> HsJSONPB.asProxy declare_project <*>
                         HsJSONPB.asProxy declare_stack
                         <*> HsJSONPB.asProxy declare_pwd
                         <*> HsJSONPB.asProxy declare_program
                         <*> HsJSONPB.asProxy declare_args
                         <*> HsJSONPB.asProxy declare_config
                         <*> HsJSONPB.asProxy declare_dryRun
                         <*> HsJSONPB.asProxy declare_parallel
                         <*> HsJSONPB.asProxy declare_monitor_address
                         <*> HsJSONPB.asProxy declare_queryMode
                         <*> HsJSONPB.asProxy declare_configSecretKeys
               Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName =
                                         Hs.Just "RunRequest",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList
                                                       [("project", runRequestProject),
                                                        ("stack", runRequestStack),
                                                        ("pwd", runRequestPwd),
                                                        ("program", runRequestProgram),
                                                        ("args", runRequestArgs),
                                                        ("config", runRequestConfig),
                                                        ("dryRun", runRequestDryRun),
                                                        ("parallel", runRequestParallel),
                                                        ("monitor_address",
                                                         runRequestMonitorAddress),
                                                        ("queryMode", runRequestQueryMode),
                                                        ("configSecretKeys",
                                                         runRequestConfigSecretKeys)]}})
 
data RunResponse = RunResponse{runResponseError :: Hs.Text,
                               runResponseBail :: Hs.Bool}
                 deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)
 
instance HsProtobuf.Named RunResponse where
        nameOf _ = (Hs.fromString "RunResponse")
 
instance HsProtobuf.HasDefault RunResponse
 
instance HsProtobuf.Message RunResponse where
        encodeMessage _
          RunResponse{runResponseError = runResponseError,
                      runResponseBail = runResponseBail}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   runResponseError),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                   runResponseBail)])
        decodeMessage _
          = (Hs.pure RunResponse) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 2))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "error")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 2)
                (HsProtobuf.Prim HsProtobuf.Bool)
                (HsProtobuf.Single "bail")
                []
                "")]
 
instance HsJSONPB.ToJSONPB RunResponse where
        toJSONPB (RunResponse f1 f2)
          = (HsJSONPB.object ["error" .= f1, "bail" .= f2])
        toEncodingPB (RunResponse f1 f2)
          = (HsJSONPB.pairs ["error" .= f1, "bail" .= f2])
 
instance HsJSONPB.FromJSONPB RunResponse where
        parseJSONPB
          = (HsJSONPB.withObject "RunResponse"
               (\ obj ->
                  (Hs.pure RunResponse) <*> obj .: "error" <*> obj .: "bail"))
 
instance HsJSONPB.ToJSON RunResponse where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON RunResponse where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema RunResponse where
        declareNamedSchema _
          = do let declare_error = HsJSONPB.declareSchemaRef
               runResponseError <- declare_error Proxy.Proxy
               let declare_bail = HsJSONPB.declareSchemaRef
               runResponseBail <- declare_bail Proxy.Proxy
               let _ = Hs.pure RunResponse <*> HsJSONPB.asProxy declare_error <*>
                         HsJSONPB.asProxy declare_bail
               Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName =
                                         Hs.Just "RunResponse",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList
                                                       [("error", runResponseError),
                                                        ("bail", runResponseBail)]}})
