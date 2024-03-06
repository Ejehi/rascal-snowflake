module grammar::DDL

extend grammar::DML;

syntax DDL = alterCommand: AlterCommand
            | createCommand: CreateCommand
            | dropCommand: DropCommand
            | undropCommand: UndropCommand
            | showCommand: ShowCommand
            | useCommand: UseCommand
            | describeCommand: DescribeCommand
            | otherCommand: OtherCommand
            ;

syntax AlterCommand = alterAccountCommand: AlterAccount
                    | alterTableCommand: AlterTable
                    | alterSessionCommand: AlterSession
                    | alterDatabaseCommand: AlterDatabase
                    | alterConnectionCommand: AlterConnection
                    | alterAlertCommand: AlterAlert
                    | alterUserCommand: AlterUser
                    | alterTagCommand: AlterTag
                    | alterSchemaCommand: AlterSchema
                    | alterRoleCommand: AlterRole
                    | alterRowAccessPolicyCommand: AlterRowAccessPolicy
                    | alterProcedureCommand: AlterProcedure
                    | alterNetworkPolicyCommand: AlterNetworkPolicy
                    | alterApiIntegrationCommand: AlterApiIntegration        
                    | alterDynamicTableCommand: AlterDynamicTable
                    | alterFailoverGroupCommand: AlterFailoverGroup
                    | alterFileFormatCommand: AlterFileFormat
                    | alterWareHouseCommand: AlterWareHouse                
                    | alterFunctionCommand: AlterFunction
                    | alterViewCommand: AlterView
                    | alterMaskingPolicyCommand: AlterMaskingPolicy
                    | alterMaterializedViewCommand: AlterMaterializedView
                    | alterPipeCommand: AlterPipe
                    | alterNotificationIntegrationCommand: AlterNotificationIntegration
                    | alterExternalTableCommand: AlterExternalTable
                    | alterResourceMonitorCommand: AlterResourceMonitor
                    | alterSequenceCommand: AlterSequence
                    ;

syntax CreateCommand =  createViewCommand: CreateView
                        | createTableCommand: CreateTable
                        | createTableAsSelectCommand: CreateTableAsSelect
                        | createTableLikeCommand: CreateTableLike
                        | createDatabaseCommand: CreateDatabase
                        | createSchemaCommand: CreateSchema
                        | createAccountCommand: CreateAccount
                        | createFileFormatCommand: CreateFileFormat
                        | createUserCommand: CreateUser
                        | createConnectionCommand: CreateConnection
                        | createDynamicTableCommand: CreateDynamicTable
                        | createEventTableCommand: CreateEventTable
                        | createFailoverGroupCommand: CreateFailoverGroup
                        | createManagedAccountCommand: CreateManagedAccount
                        | createNetworkPolicyCommand: CreateNetworkPolicy
                        | createApiIntegrationCommand: CreateApiIntegration
                        | createExternalFunctionCommand: CreateExternalFunction 
                        | createExternalTableCommand: CreateExternalTable
                        | createFunctionCommand: CreateFunction
                        | createMaskingPolicyCommand: CreateMaskingPolicy
                        | createMaterializedViewCommand: CreateMaterializedView
                        | createNotificationIntegrationCommand: CreateNotificationIntegration
                        | createProcedureCommand: CreateProcedure
                        | createPipeCommand: CreatePipe
                        | createRoleCommand: CreateRole
                        | createRowAccessPolicyCommand: CreateRowAccessPolicy
                        | createReplicationGroupCommand: CreateReplicationGroup
                        | createResourceMonitorCommand: CreateResourceMonitor
                        | createSequenceCommand: CreateSequence
                        | createSessionPolicyCommand: CreateSessionPolicy
                        | createShareCommand: CreateShare
                        | createStageCommand: CreateStage
                        | createStorageIntegrationCommand: CreateStorageIntegration
                        | createStreamCommand: CreateStream
                        | createTagCommand: CreateTag
                        | createWarehouseCommand: CreateWarehouse
                        | createObjectCloneCommand: CreateObjectClone
                        ;

syntax AlterAccount = alterAccount: 'ALTER' 'ACCOUNT' AlterAccountOpts;

syntax AlterAccountOpts = setAccountOpts: 'SET' AccountParams? ObjectParams? SessionParams?
                        | unsetAccountOpts: 'UNSET' {Identifier ","}+
                        | resourceMonitorAccountOpts: 'SET' 'RESOURCE_MONITOR' "=" Identifier
                        | setTagsAccountOpts: SetTags
                        | unsetTagsAccountOpts: UnsetTags
                        | dropUrlAccountOpts: Identifier 'DROP' 'OLD' 'URL'
                        | saveUrlAccountOpts: Identifier 'RENAME' 'TO' Identifier SaveOldUrl?
                        ;

syntax AccountParams = allowIdTokenParam: 'ALLOW_ID_TOKEN' "=" Boolean
                        | clientEncryptionParam: 'CLIENT_ENCRYPTION_KEY_SIZE' "=" Number
                        | enforceSessionParam: 'ENFORCE_SESSION_POLICY' "=" Boolean
                        | externalOauthParam: 'EXTERNAL_OAUTH_ADD_PRIVILEGED_ROLES_TO_BLOCKED_LIST' "=" Boolean
                        | replicationParam: 'INITIAL_REPLICATION_SIZE_LIMIT_IN_TB' "=" Number
                        | networkParam: 'NETWORK_POLICY' "=" String
                        ;

syntax ObjectParams = retentionTimeParam: 'DATA_RETENTION_TIME_IN_DAYS' "=" Number
                    | extentionTimeParam: 'MAX_DATA_EXTENSION_TIME_IN_DAYS' "=" Number
                    | concurrencyLevelParam: 'MAX_CONCURRENCY_LEVEL' "=" Number
                    | networkPolicyParam: 'NETWORK_POLICY' "=" String
                    | pipeExecutionParam: 'PIPE_EXECUTION_PAUSED' "=" Boolean
                    | sessionPolicyParam: 'SESSION_POLICY' "=" String
                    ;

syntax SessionParams = abortDetachedParam: 'ABORT_DETACHED_QUERY' "=" Boolean
                        | autoCommitParam: 'AUTOCOMMIT' "=" Boolean
                        | binaryInputParam: 'BINARY_INPUT_FORMAT' "=" String
                        | dateInputParam: 'DATE_INPUT_FORMAT' "=" String
                        | lockTimeOutParam: 'LOCK_TIMEOUT' "=" Number
                        | timeZoneParam: 'TIMEZONE' "=" String
                        | timeStampInputParam: 'TIMESTAMP_INPUT_FORMAT' "=" String
                        | timeStampLtzParam: 'TIMESTAMP_LTZ_OUTPUT_FORMAT' "=" String
                        | timeStampNtzParam: 'TIMESTAMP_NTZ_OUTPUT_FORMAT' "=" String
                        ;

syntax SetTags = setTags: 'SET' TagDeclList;

syntax UnsetTags = unsetTags: 'UNSET' 'TAG' {ObjectColumnNameOrIdentifier ","}+;

syntax TagDeclList = tagDeclList: 'TAG' {TagDecl ","}+;

syntax TagDecl = tagDecl: ObjectColumnNameOrIdentifier "=" String;

syntax SaveOldUrl = saveOldUrl: 'SAVE_OLD_URL' "=" Boolean;

syntax AlterTable = alterTableRename: 'ALTER' 'TABLE' IfExists? ObjectColumnNameOrIdentifier 'RENAME' 'TO' ObjectColumnNameOrIdentifier
                    | alterTableSetTags: 'ALTER' 'TABLE' IfExists? ObjectColumnNameOrIdentifier SetTags
                    | alterTableUnsetTags: 'ALTER' 'TABLE' IfExists? ObjectColumnNameOrIdentifier UnsetTags
                    | alterTableSwapWith: 'ALTER' 'TABLE' IfExists? ObjectColumnNameOrIdentifier 'SWAP' 'WITH' ObjectColumnNameOrIdentifier
                    | alterTableDropRow: 'ALTER' 'TABLE' IfExists? ObjectColumnNameOrIdentifier 'DROP' 'ROW' 'ACCESS' 'POLICY' Identifier
                    ;

syntax IfExists = ifExists: 'IF' 'EXISTS';

syntax AlterSession = alterSessionSet: 'ALTER' 'SESSION' 'SET' SessionParams
                    | alterSessionUnset: 'ALTER' 'SESSION' 'UNSET' {Identifier ","}+
                    ;

syntax AlterDatabase = alterDatabaseRename: 'ALTER' 'DATABASE' IfExists? Identifier 'RENAME' 'TO' Identifier
                        | alterDatabaseSwap: 'ALTER' 'DATABASE' IfExists? Identifier 'SWAP' 'WITH' Identifier
                        | alterDatabaseSetTags: 'ALTER' 'DATABASE' Identifier SetTags
                        | alterDatabaseUnsetTags: 'ALTER' 'DATABASE' Identifier UnsetTags
                        | alterDatabaseRefresh: 'ALTER' 'DATABASE' Identifier 'REFRESH'
                        | alterDatabaseProperty: 'ALTER' 'DATABASE' IfExists? Identifier 'UNSET' { DatabaseOrSchemaProperty "," }+
                        ;

syntax DatabaseOrSchemaProperty = dataRetentionTimeProp: DataRetentionTimeEqInt 
                                | maxDataExtentionTimeProp: MaxDataExtentionTimeEqInt 
                                | defaultDdlCollationProp: DefaultDdlCollation
                                | commentDatabaseOrSchemaProperty: 'COMMENT'
                                ;

syntax DataRetentionTimeEqInt = dataRetentionTimeEqInt: 'DATA_RETENTION_TIME_IN_DAYS' "=" Int;

syntax MaxDataExtentionTimeEqInt = maxDataExtentionTimeEqInt: 'MAX_DATA_EXTENSION_TIME_IN_DAYS' "=" Int;

syntax DefaultDdlCollation = defaultDdlCollation: 'DEFAULT_DDL_COLLATION' "=" String;

syntax AlterConnection =  alterConnection: 'ALTER' 'CONNECTION' AlterConnectionOptions;

syntax AlterConnectionOptions = alterConnectionPrimary: Identifier 'PRIMARY'
                                | alterConnectionSet: IfExists? Identifier 'SET' CommentClause
                                | alterConnectionUnset: IfExists? Identifier 'UNSET' 'COMMENT'
                                ;

syntax CommentClause = commentClause: 'COMMENT' "=" String;

syntax AlterAlert =  alterAlterResumeSuspend: 'ALTER' 'ALERT' IfExists? Identifier ResumeSuspend
                    | alterAlterSet: 'ALTER' 'ALERT' IfExists? Identifier 'SET' AlertSetClause+
                    | alterAlterUnset: 'ALTER' 'ALERT' IfExists? Identifier 'UNSET' AlertUnSetClause+
                    | alterAlterModify: 'ALTER' 'ALERT' IfExists? Identifier 'MODIFY' 'CONDITION' 'EXISTS' "(" AlertCondition ")"
                    ;

syntax ResumeSuspend = resumeSuspendOpt1: 'RESUME'
                        | resumeSuspendOpt2: 'SUSPEND'
                        ;

syntax AlertSetClause = warehouseAlertSetClause: 'WAREHOUSE' "=" Identifier
                        | scheduleAlertSetClause: 'SCHEDULE' "=" String
                        | commentAlertSetClause: CommentClause
                        ;

syntax AlertUnSetClause = warehouseAlertUnsetClause: 'WAREHOUSE'
                        | scheduleAlertUnsetClause: 'SCHEDULE'
                        | commentAlertUnsetClause: 'COMMENT'
                        ;

syntax AlertCondition = selectAlertCondition: SelectStatement
                       | showAlertCondition: ShowCommand
                       | callAlertCondition: Call
                       ;

syntax AlterUser = alterUser: 'ALTER' 'USER' IfExists? Identifier AlterUserOptions;

syntax AlterUserOptions = renameToId: 'RENAME' 'TO' Identifier
                        | resetPassword: 'RESET' 'PASSWORD'
                        | abortAllQueries: 'ABORT' 'ALL' 'QUERIES'
                        | addDelegated: 'ADD' 'DELEGATED' 'AUTHORIZATION' 'OF' 'ROLE' Identifier 'TO' 'SECURITY' 'INTEGRATION' Identifier
                        | removeDelegated: 'REMOVE' 'DELEGATED' AuthorizationType 'FROM' 'SECURITY' 'INTEGRATION' Identifier
                        | setTagAlterUserOpt: SetTags
                        | UnsetTagAlterUserOpt: UnsetTags
                        ;

syntax AuthorizationType = ofRoleAuthorizationType: 'AUTHORIZATION' 'OF' 'ROLE' Identifier 
                            | authorizationsType: 'AUTHORIZATIONS'
                            ;

syntax AlterTag = alterTag: 'ALTER' 'TAG' IfExists? ObjectColumnNameOrIdentifier AlterTagOptions;

syntax AlterTagOptions = alterTagOptsRename: 'RENAME' 'TO' ObjectColumnNameOrIdentifier
                        | alterTagOptsAddOrDrop: AddOrDrop TagAllowedValues
                        | alterTagOptsUnsetAllowed: 'UNSET' 'ALLOWED_VALUES'
                        | alterTagOptsSetMasking: 'SET' MaskingPolicyIdList
                        | alterTagOptsUnsetMasking: 'UNSET' MaskingPolicyIdList
                        | alterTagOptsSetCommentClause: 'SET' CommentClause
                        | alterTagOptsUnsetComment: 'UNSET' 'COMMENT'
                        ;

syntax AddOrDrop = add: 'ADD' 
                    | drop: 'DROP'
                    ;

syntax TagAllowedValues = tagAllowedValues: 'ALLOWED_VALUES' { String "," }+;

syntax MaskingPolicyId = maskingPolicyId: 'MASKING' 'POLICY' Identifier;

syntax MaskingPolicyIdList = maskingPolicyIdList: {MaskingPolicyId ","}+;

syntax AlterSchema = alterSchemaRenameTo: 'ALTER' 'SCHEMA' IfExists? Identifier 'RENAME' 'TO' Identifier
                    | alterSchemaSwapWith: 'ALTER' 'SCHEMA' IfExists? Identifier 'SWAP' 'WITH' Identifier
                    | alterSchemaCommentClause: 'ALTER' 'SCHEMA' IfExists? Identifier 'SET' 
                                                            DataRetentionTimeEqInt? 
                                                            MaxDataExtentionTimeEqInt? 
                                                            DefaultDdlCollation? 
                                                            CommentClause?
                    | alterSchemaSetTags: 'ALTER' 'SCHEMA' IfExists? Identifier SetTags
                    | alterSchemaUnsetTags: 'ALTER' 'SCHEMA' IfExists? Identifier UnsetTags
                    | alterSchemaUnset: 'ALTER' 'SCHEMA' IfExists? Identifier 'UNSET' {DatabaseOrSchemaProperty ","}+
                    | alterSchemaEnableDisable: 'ALTER' 'SCHEMA' IfExists? Identifier EnableDisable 'MANAGED' 'ACCESS'
                    ;

syntax EnableDisable = enable: 'ENABLE' 
                    | disable: 'DISABLE'
                    ;

syntax AlterRole = alterRoleRenameTo: 'ALTER' 'ROLE' IfExists? Identifier 'RENAME' 'TO' Identifier
                    | alterRoleSet: 'ALTER' 'ROLE' IfExists? Identifier 'SET' CommentClause
                    | alterRoleUnset: 'ALTER' 'ROLE' IfExists? Identifier 'UNSET' 'COMMENT'
                    | alterRoleSetTags: 'ALTER' 'ROLE' IfExists? Identifier SetTags
                    | alterRoleUnsetTags: 'ALTER' 'ROLE' IfExists? Identifier UnsetTags
                    ;

syntax AlterRowAccessPolicy = alterRowSetBody: 'ALTER' 'ROW' 'ACCESS' 'POLICY' IfExists? Identifier 'SET' 'BODY' "-\>" Exp
                            | alterRowRenameTo: 'ALTER' 'ROW' 'ACCESS' 'POLICY' IfExists? Identifier 'RENAME' 'TO' Identifier
                            | alterRowSetComment: 'ALTER' 'ROW' 'ACCESS' 'POLICY' IfExists? Identifier 'SET' CommentClause
                            ;

syntax AlterProcedure = alterProcedureRenameTo: 'ALTER' 'PROCEDURE' IfExists? Identifier "(" DataTypeList? ")" 'RENAME' 'TO' Identifier
                        | alterProcedureSetComment: 'ALTER' 'PROCEDURE' IfExists? Identifier "(" DataTypeList? ")" 'SET' CommentClause
                        | alterProcedureUnsetComment: 'ALTER' 'PROCEDURE' IfExists? Identifier "(" DataTypeList? ")" 'UNSET' CommentClause
                        | alterProcedureExecute: 'ALTER' 'PROCEDURE' IfExists? Identifier "(" DataTypeList? ")" 'EXECUTE' 'AS' CallerOwner
                        ;

syntax CallerOwner = caller: 'CALLER'
                    | owner: 'OWNER'
                    ;

syntax AlterNetworkPolicy = alterNetworkPolicy: 'ALTER' 'NETWORK' 'POLICY' AlterNetworkPolicyOpts;

syntax AlterNetworkPolicyOpts = alterNetworkIPList: IfExists? Identifier 'SET'
                                        AllowedIPList?
                                        BlockedIPList?
                                        CommentClause?
                                | alterNetworkUnset: IfExists? Identifier 'UNSET' 'COMMENT'
                                | alterNetworkRenameTo: Identifier 'RENAME' 'TO' Identifier
                                ;

syntax AllowedIPList = allowedIPList: 'ALLOWED_IP_LIST' "=" "(" StringList? ")";

syntax BlockedIPList = blockedIPList: 'BLOCKED_IP_LIST' "=" "(" StringList? ")"; 

syntax AlterApiIntegration = alterApiArn: 'ALTER' 'API' 'INTEGRATION' IfExists? Identifier 'SET'
                                        ApiAwsArn?
                                        AzureAdApplication?
                                        ApiKey?
                                        Enabled?
                                        ApiAllowedPrefixes?
                                        ApiBlockedPrefixes?
                                        CommentClause?
                                | alterNoApiArn: 'ALTER' 'INTEGRATION' IfExists? Identifier 'SET'
                                        ApiAwsArn?
                                        AzureAdApplication?
                                        ApiKey?
                                        Enabled?
                                        ApiAllowedPrefixes?
                                        ApiBlockedPrefixes?
                                        CommentClause?
                                | alterNoApiSetTags: 'ALTER' 'INTEGRATION' Identifier SetTags
                                | alterApiSetTags: 'ALTER' 'API' 'INTEGRATION' Identifier SetTags
                                |  alterNoApiUnsetTags: 'ALTER' 'INTEGRATION' Identifier UnsetTags
                                |  alterApiUnsetTags: 'ALTER' 'API' 'INTEGRATION' Identifier UnsetTags
                                |  alterNoApiUnset: 'ALTER' 'INTEGRATION' IfExists? Identifier 'UNSET' ApiIntegrationPropertyList
                                |  alterApiUnset: 'ALTER' 'API' 'INTEGRATION' IfExists? Identifier 'UNSET' ApiIntegrationPropertyList
                                ;

syntax ApiAwsArn = apiAwsArn: 'API_AWS_ROLE_ARN' "=" String;

syntax AzureAdApplication = azureAdApplication: 'AZURE_AD_APPLICATION_ID' "=" String;

syntax ApiKey = apiKey: 'API_KEY' "=" String;

syntax Enabled = enableTrueOrFalse: 'ENABLED' "=" Boolean; 

syntax ApiAllowedPrefixes = apiAllowedPrefixes: 'API_ALLOWED_PREFIXES' "=" "(" String ")";

syntax ApiBlockedPrefixes = apiBlockedPrefixes: 'API_BLOCKED_PREFIXES' "=" "(" String ")";

syntax ApiIntegrationPropertyList = apiIntegrationPropertyList: {ApiIntegrationProperty ","}+;

syntax ApiIntegrationProperty = apiKeyIntegrationProp: 'API_KEY'
                                | enabledIntegrationProp: 'ENABLED'
                                | blockedPrefixesIntegrationProp: 'API_BLOCKED_PREFIXES'
                                | commentIntegrationProp: 'COMMENT'
                                ;

syntax AlterDynamicTable = alterDynamicTable: 'ALTER' 'DYNAMIC' 'TABLE' Identifier AlterDynamicOpts;

syntax AlterDynamicOpts = resumeSuspendDynamicOpt: ResumeSuspend
                              | refreshDynamicOpt: 'REFRESH'
                              | setDynamicOpt: 'SET' 'WAREHOUSE' "=" Identifier
                              ;

syntax AlterFailoverGroup
                //Source Account
                = renameToFailoverGroup: 'ALTER' 'FAILOVER' 'GROUP' IfExists? Identifier 'RENAME' 'TO' Identifier
                | setFailoverGroup: 'ALTER' 'FAILOVER' 'GROUP' IfExists? Identifier 'SET' ObjectTypes? ReplicationSchedule? 
                | addAllowedFailoverGroup: 'ALTER' 'FAILOVER' 'GROUP' IfExists? Identifier 'ADD' ColumnList 'TO' 'ALLOWED_DATABASES'
                | moveToFailoverGroup: 'ALTER' 'FAILOVER' 'GROUP' IfExists? Identifier 'MOVE' 'DATABASES' ColumnList 'TO' 'FAILOVER' 'GROUP' Identifier
                | removeFromFailoverGroup: 'ALTER' 'FAILOVER' 'GROUP' IfExists? Identifier 'REMOVE' ColumnList 'FROM' 'ALLOWED_DATABASES'
                | allowedSharesFailoverGroup: 'ALTER' 'FAILOVER' 'GROUP' IfExists? Identifier 'ADD' ColumnList 'TO' 'ALLOWED_SHARES'
                | moveSharesFailoverGroup: 'ALTER' 'FAILOVER' 'GROUP' IfExists? Identifier 'MOVE' 'SHARES' ColumnList 'TO' 'FAILOVER' 'GROUP' Identifier
                | removeAllowedSharesFailoverGroup: 'ALTER' 'FAILOVER' 'GROUP' IfExists? Identifier 'REMOVE' ColumnList 'FROM' 'ALLOWED_SHARES'
                | allowedAccountsFailoverGroup: 'ALTER' 'FAILOVER' 'GROUP' IfExists? Identifier 'ADD' ObjectColumnNameOrIdentifier 'TO' 'ALLOWED_ACCOUNTS' IgnoreEditionCheck?
                | removeColumnFailoverGroup: 'ALTER' 'FAILOVER' 'GROUP' IfExists? Identifier 'REMOVE' ObjectColumnNameOrIdentifier 'FROM' 'ALLOWED_ACCOUNTS'
                //Target Account
                | failoverOptFailoverGroup: 'ALTER' 'FAILOVER' 'GROUP' IfExists? Identifier AlterFailoverOpts
                ;

syntax ObjectTypes = objectTypes: 'OBJECT_TYPES' "=" ObjectTypeList;

syntax ObjectTypeList = objectTypeList: {ObjectType ","}+;

syntax ObjectType = accountParamObjectType: 'ACCOUNT' 'PARAMETERS'
                    | databasesObjectType: 'DATABASES'
                    | integrationsObjectType: 'INTEGRATIONS'
                    | networkPoliciesObjectType: 'NETWORK' 'POLICIES'
                    | resourceMonitorsObjectType: 'RESOURCE' 'MONITORS'
                    | rolesObjectType: 'ROLES'
                    | sharesObjectType: 'SHARES'
                    | usersObjectType: 'USERS'
                    | warehousesObjectType: 'WAREHOUSES'
                    ;

syntax ReplicationSchedule = replicationSchedule: 'REPLICATION_SCHEDULE' "=" String;

syntax IgnoreEditionCheck = ignoreEditionCheck: 'IGNORE' 'EDITION' 'CHECK';

syntax AlterFailoverOpts = refreshFailoverOpts: 'REFRESH'
                                | primaryFailoverOpts: 'PRIMARY' 
                                | suspendFailoverOpts: 'SUSPEND' 
                                | resumeFailoverOpts: 'RESUME'
                                ;

syntax AlterFileFormat = alterFileRenameTo: 'ALTER' 'FILE' 'FORMAT' IfExists? Identifier 'RENAME' 'TO' Identifier
                        | alterFileSet: 'ALTER' 'FILE' 'FORMAT' IfExists? Identifier 'SET' FormatTypeOptions* CommentClause?
                        ;

syntax FormatTypeOptions = fileExtensionFormatOpts: 'FILE_EXTENSION' "=" String
                            | skipHeaderFormatOpts: 'SKIP_HEADER' "=" Int
                            | skipBlankLinesFormatOpts: 'SKIP_BLANK_LINES' "=" Boolean
                            | dateFormatOpts: 'DATE_FORMAT' "=" String
                            | timeFormatOpts: 'TIME_FORMAT' "=" String
                            | timeStampFormatOpts: 'TIMESTAMP_FORMAT' "=" String
                            | binaryFormatOpts: 'BINARY_FORMAT' "=" BinaryFormat
                            | escapeCharLiteralFormatOpts: 'ESCAPE' "=" CharacterLiteral
                            | escapeNoneFormatOpts: 'ESCAPE' "=" 'NONE'
                            | escapeNone_qFormatOpts: 'ESCAPE' "=" '\'NONE\''
                            | escapeEnclosedStringFormatOpts: 'ESCAPE_UNENCLOSED_FIELD' "=" String 
                            | compressionTypeFormatOpts: Compression
                            | preserveSpaceFormatOpts: 'PRESERVE_SPACE' "=" Boolean
                            | stripOuterElementFormatOpts: 'STRIP_OUTER_ELEMENT' "=" Boolean
                            | disableSnowFlakeFormatOpts: 'DISABLE_SNOWFLAKE_DATA' "=" Boolean
                            | disableAutoConvertFormatOpts: 'DISABLE_AUTO_CONVERT' "=" Boolean
                            | ignoreUtf8ErrorsFormatOpts: 'IGNORE_UTF8_ERRORS' "=" Boolean
                            | recordDelimiterFormatOpts: 'RECORD_DELIMITER' "=" String
                            | fieldDelimiterFormatOpts: 'FIELD_DELIMITER' "=" String
                            | trimSpaceFormatOpts: 'TRIM_SPACE' "=" Boolean
                            | errorOnMismatchFormatOpts: 'ERROR_ON_COLUMN_COUNT_MISMATCH' "=" Boolean
                            | encodingStringFormatOpts: 'ENCODING' "=" String 
                            | fieldEnclosedByStringFormatOpts: 'FIELD_OPTIONALLY_ENCLOSED_BY' "=" String 
                            | nullIfFormatOpts: 'NULL_IF' "=" "(" StringList ")"
                            | replaceInvalidCharFormatOpts: 'REPLACE_INVALID_CHARACTERS' "=" Boolean
                            ;

syntax BinaryFormat = binaryFormatHex: 'HEX' 
                    | binaryFormatBase64: 'BASE64'
                    | binaryFormatUtf8: 'UTF8'
                    ;

syntax Compression = compression: 'COMPRESSION' "=" CompressionType;

syntax CompressionType = compressionTypeAuto: 'AUTO' 
                        | compressionTypeGZIP: 'GZIP' 
                        | compressionTypeBZ2: 'BZ2'
                        | compressionTypeBROTLI: 'BROTLI'
                        | compressionTypeZSTD: 'ZSTD'
                        | compressionTypeDeflate: 'DEFLATE' 
                        | compressionTypeRawDeflate: 'RAW_DEFLATE' 
                        | compressionTypeNone: 'NONE'
                        | compressionTypeAuto_q: '\'AUTO\''
                        | compressionTypeAutoDetect: 'AUTO_DETECT'
                        ;

syntax AlterWareHouse = alterWareHouse: 'ALTER' 'WAREHOUSE' IfExists? AlterWareHouseOptions;

syntax AlterWareHouseOptions = idSuspendIfAlterWhOpt: IdentifierFn? SuspendResumeIf
                                | idAbortAllAlterWhOpt: IdentifierFn? 'ABORT' 'ALL' 'QUERIES'
                                | idRenameToAlterWhOpt: IdentifierFn 'RENAME' 'TO' Identifier
                                | idSetTagsAlterWhOpt: IdentifierFn SetTags
                                | idUnSetTagsAlterWhOpt: IdentifierFn UnsetTags
                                | idUnSetColListAlterWhOpt: IdentifierFn 'UNSET' ColumnList
                                ;

syntax IdentifierFn =  objectNameIdentifierFn: ObjectColumnNameOrIdentifier
                    | bracketIdentifierFn: 'IDENTIFIER' "(" Identifier ")"
                    | stringIdentifierFn: 'IDENTIFIER' "(" String ")"
                    ;

syntax SuspendResumeIf = suspendResumeIfOpt1: 'SUSPEND' 
                        | suspendResumeIfOpt2: 'RESUME' IfSuspended?
                        ;

syntax IfSuspended = ifSuspended: 'IF' 'SUSPENDED';

syntax AlterFunction = renameToAlterFunction: AlterFunctionSignature 'RENAME' 'TO' Identifier
                        | commentAlterFunction: AlterFunctionSignature 'SET' CommentClause
                        | setSecureAlterFunction: AlterFunctionSignature 'SET' 'SECURE'
                        | unsetAlterFunction: AlterFunctionSignature 'UNSET' UnsetSecureOrComment
                        // External Functions
                        | apiAlterFunction: AlterFunctionSignature 'SET' 'API_INTEGRATION' "=" Identifier
                        | headersAlterFunction: AlterFunctionSignature 'SET' 'HEADERS' "=" "(" HeaderDecl* ")"
                        | contextAlterFunction: AlterFunctionSignature 'SET' 'CONTEXT_HEADERS' "=" "(" Identifier* ")"
                        | maxBatchAlterFunction: AlterFunctionSignature 'SET' 'MAX_BATCH_ROWS' "=" Int
                        | compressionAlterFunction: AlterFunctionSignature 'SET' Compression
                        | translatorAlterFunction: AlterFunctionSignature 'SET' TranslatorType "=" Identifier
                        | unsetTypeAlterFunction: AlterFunctionSignature 'UNSET' UnsetType
                        ;

syntax AlterFunctionSignature = alterFunctionSignature: 'ALTER' 'FUNCTION' IfExists? Identifier "(" DataTypeList? ")";

syntax UnsetSecureOrComment = unsetSecure: 'SECURE' 
                        | unsetComment: 'COMMENT'
                        | setSecureOrComment: 'SET'
                        ;

syntax HeaderDecl = headerDecl: String "=" String;

syntax TranslatorType = requestTranslatorType: 'REQUEST_TRANSLATOR' 
                        | responseTranslatorType: 'RESPONSE_TRANSLATOR'
                        ;

syntax UnsetType = unsetCommentType: 'COMMENT' 
                        | unsetHeadersType: 'HEADERS' 
                        | unsetContextHeadersType: 'CONTEXT_HEADERS' 
                        | unsetMaxBatchType: 'MAX_BATCH_ROWS' 
                        | unsetCompressionType: 'COMPRESSION' 
                        | unsetSecureType: 'SECURE' 
                        | unsetTranslatorType: TranslatorType
                        ;

syntax AlterView = alterViewAlternative1: 'ALTER' 'VIEW' IfExists? ObjectColumnNameOrIdentifier 'RENAME' 'TO' ObjectColumnNameOrIdentifier
                        | alterViewAlternative2: 'ALTER' 'VIEW' IfExists? ObjectColumnNameOrIdentifier 'SET' CommentClause
                        | alterViewAlternative3: 'ALTER' 'VIEW' IfExists? ObjectColumnNameOrIdentifier 'UNSET' 'COMMENT'
                        | alterViewAlternative4: 'ALTER' 'VIEW' ObjectColumnNameOrIdentifier 'SET' 'SECURE'
                        | alterViewAlternative5: 'ALTER' 'VIEW' ObjectColumnNameOrIdentifier 'UNSET' 'SECURE'
                        | alterViewAlternative6: 'ALTER' 'VIEW' IfExists? ObjectColumnNameOrIdentifier SetTags
                        | alterViewAlternative7: 'ALTER' 'VIEW' IfExists? ObjectColumnNameOrIdentifier UnsetTags
                        | alterViewAlternative8: 'ALTER' 'VIEW' IfExists? ObjectColumnNameOrIdentifier 'ADD' 'ROW' 'ACCESS' 'POLICY' Identifier 'ON' ColumnListWithBrackets
                        | alterViewAlternative9: 'ALTER' 'VIEW' IfExists? ObjectColumnNameOrIdentifier 'DROP' 'ROW' 'ACCESS' 'POLICY' Identifier
                        | alterViewAlternative10: 'ALTER' 'VIEW' IfExists? ObjectColumnNameOrIdentifier 'ADD' 'ROW' 'ACCESS' 'POLICY' Identifier 'ON' ColumnListWithBrackets "," 'DROP' 'ROW' 'ACCESS' 'POLICY' Identifier
                        | alterViewAlternative11: 'ALTER' 'VIEW' IfExists? ObjectColumnNameOrIdentifier 'DROP' 'ALL' 'ROW' 'ACCESS' 'POLICIES'
                        | alterViewAlternative12: 'ALTER' 'VIEW' ObjectColumnNameOrIdentifier AlterOrModify Identifier 'SET' 'MASKING' 'POLICY' Identifier UsingColumnList?
                        | alterViewAlternative13: 'ALTER' 'VIEW' ObjectColumnNameOrIdentifier AlterOrModify 'COLUMN' Identifier 'SET' 'MASKING' 'POLICY' Identifier UsingColumnList?
                        | alterViewAlternative14: 'ALTER' 'VIEW' ObjectColumnNameOrIdentifier AlterOrModify Identifier 'SET' 'MASKING' 'POLICY' Identifier UsingColumnList? 'FORCE'
                        | alterViewAlternative15: 'ALTER' 'VIEW' ObjectColumnNameOrIdentifier AlterOrModify 'COLUMN' Identifier 'SET' 'MASKING' 'POLICY' Identifier UsingColumnList? 'FORCE'
                        | alterViewAlternative16: 'ALTER' 'VIEW' ObjectColumnNameOrIdentifier AlterOrModify Identifier 'UNSET' 'MASKING' 'POLICY'
                        | alterViewAlternative17: 'ALTER' 'VIEW' ObjectColumnNameOrIdentifier AlterOrModify 'COLUMN' Identifier 'UNSET' 'MASKING' 'POLICY'
                        | alterViewAlternative18: 'ALTER' 'VIEW' ObjectColumnNameOrIdentifier AlterOrModify Identifier SetTags
                        | alterViewAlternative19: 'ALTER' 'VIEW' ObjectColumnNameOrIdentifier AlterOrModify 'COLUMN' Identifier SetTags
                        | alterViewAlternative20: 'ALTER' 'VIEW' ObjectColumnNameOrIdentifier AlterOrModify 'COLUMN' Identifier UnsetTags
                        ;

syntax AlterOrModify = alterOrModifyOpt1: 'ALTER' 
                        | alterOrModifyOpt2: 'MODIFY'
                        ;

syntax AlterMaskingPolicy = alterMaskingBody: 'ALTER' 'MASKING' 'POLICY' IfExists? Identifier 'SET' 'BODY' "-\>" Exp
                                | alterMaskingRenameTo: 'ALTER' 'MASKING' 'POLICY' IfExists? Identifier 'RENAME' 'TO' Identifier
                                | alterMaskingSet: 'ALTER' 'MASKING' 'POLICY' IfExists? Identifier 'SET' CommentClause
                                ;

syntax AlterMaterializedView = alterMaterializedView: 'ALTER' 'MATERIALIZED' 'VIEW' Identifier AlterMaterializedViewOpts;

syntax AlterMaterializedViewOpts = alterMaterializedViewOpt1: 'RENAME' 'TO' Identifier
                                        | alterMaterializedViewOpt2: 'CLUSTER' 'BY' ExpListWithBrackets
                                        | alterMaterializedViewOpt3: 'DROP' 'CLUSTERING' 'KEY'
                                        | alterMaterializedOptNoRecluster: ResumeSuspend
                                        | alterMaterializedOptRecluster: ResumeSuspend 'RECLUSTER'
                                        | alterMaterializedOptNoSecure: 'SET' CommentClause?
                                        | alterMaterializedOptSecure: 'SET' 'SECURE' CommentClause?
                                        | alterMaterializedViewOpt7: UnsetSecureOrComment+
                                        ;

syntax AlterPipe = alterPipeOpt1: 'ALTER' 'PIPE' IfExists? Identifier 'SET' ObjectProperties? CommentClause?
                        | alterPipeOpt2: 'ALTER' 'PIPE' Identifier SetTags
                        | alterPipeOpt3: 'ALTER' 'PIPE' Identifier UnsetTags
                        | alterPipeOpt4: 'ALTER' 'PIPE' IfExists? Identifier 'UNSET' 'PIPE_EXECUTION_PAUSED' "=" Boolean
                        | alterPipeOpt5: 'ALTER' 'PIPE' IfExists? Identifier 'UNSET' 'COMMENT'
                        | alterPipeOpt6: 'ALTER' 'PIPE' IfExists? Identifier 'REFRESH' PrefixString? ModifiedAfter?
                        ;

syntax ObjectProperties = passwordObjectProp: 'PASSWORD' "=" String
                        | loginObjectProp: 'LOGIN_NAME' "=" String
                        | displayNameObjectProp: 'DISPLAY_NAME' "=" String
                        | firstNameObjectProp: 'FIRST_NAME' "=" String
                        | middleNameObjectProp: 'MIDDLE_NAME' "=" String
                        | lastNameObjectProp: 'LAST_NAME' "=" String
                        | emailObjectProp: 'EMAIL' "=" String
                        | mustChangePasswordObjectProp: 'MUST_CHANGE_PASSWORD' "=" Boolean
                        | disabledObjectProp: 'DISABLED' "=" Boolean
                        ;

syntax PrefixString = prefixString: 'PREFIX' "=" String;

syntax ModifiedAfter = modifiedAfter: 'MODIFIED_AFTER' "=" String;
                               
syntax AlterNotificationIntegration = alterNotificationIntegrationOpt1: 'ALTER' 'INTEGRATION' IfExists? Identifier 'SET'
                                                Enabled?
                                                CloudProviderParamsAuto
                                                CommentClause?
                                        | alterNotificationIntegrationOpt2: 'ALTER' 'NOTIFICATION' 'INTEGRATION' IfExists? Identifier 'SET'
                                                Enabled?
                                                CloudProviderParamsAuto
                                                CommentClause?
                                        // Push notifications
                                        | alterNotificationIntegrationOpt3: 'ALTER' 'INTEGRATION' IfExists? Identifier 'SET'
                                                Enabled?
                                                CloudProviderParamsPush
                                                CommentClause?
                                        | alterNotificationIntegrationOpt4: 'ALTER' 'NOTIFICATION' 'INTEGRATION' IfExists? Identifier 'SET'
                                                Enabled?
                                                CloudProviderParamsPush
                                                CommentClause?
                                        | alterNotificationIntegrationOpt5: 'ALTER' 'INTEGRATION' Identifier SetTags
                                        | alterNotificationIntegrationOpt6: 'ALTER' 'NOTIFICATION' 'INTEGRATION' Identifier SetTags
                                        | alterNotificationIntegrationOpt7: 'ALTER' 'INTEGRATION' Identifier UnsetTags
                                        | alterNotificationIntegrationOpt8: 'ALTER' 'NOTIFICATION' 'INTEGRATION' Identifier UnsetTags
                                        | alterNotificationIntegrationOpt9: 'ALTER' 'INTEGRATION' IfExists Identifier 'UNSET' AlterEnabledOrComment
                                        | alterNotificationIntegrationOpt10: 'ALTER' 'NOTIFICATION' 'INTEGRATION' IfExists Identifier 'UNSET' AlterEnabledOrComment
                                        ;

syntax CloudProviderParamsAuto
                                //(for Google Cloud Storage)
                                = googleCloudParamAuto: 'NOTIFICATION_PROVIDER' "=" 'GCP_PUBSUB' 'GCP_PUBSUB_SUBSCRIPTION_NAME' "=" String
                                //(for Microsoft Azure Storage)
                                | microsoftAzureParamAuto: 'NOTIFICATION_PROVIDER' "=" 'AZURE_EVENT_GRID' 'AZURE_STORAGE_QUEUE_PRIMARY_URI' "=" String 'AZURE_TENANT_ID' "=" String
                                ;

syntax CloudProviderParamsPush
                                //(for Amazon SNS)
                                = amazonAwsParamPush: 'NOTIFICATION_PROVIDER' "=" 'AWS_SNS'
                                        'AWS_SNS_TOPIC_ARN' "=" String
                                        'AWS_SNS_ROLE_ARN' "=" String
                                //(for Google Pub/Sub)
                                | googleCloudParamPush: 'NOTIFICATION_PROVIDER' "=" 'GCP_PUBSUB'
                                        'GCP_PUBSUB_TOPIC_NAME' "=" String
                                //(for Microsoft Azure Event Grid)
                                | microsoftAzureParamPush: 'NOTIFICATION_PROVIDER' "=" 'AZURE_EVENT_GRID'
                                        'AZURE_EVENT_GRID_TOPIC_ENDPOINT' "=" String
                                        'AZURE_TENANT_ID' "=" String
                                ;

syntax AlterEnabledOrComment = alterEnabled: 'ENABLED' 
                                | alterComment: 'COMMENT'
                                ;

syntax AlterExternalTable = alterExternalTableRefresh: 'ALTER' 'EXTERNAL' 'TABLE' IfExists? ObjectColumnNameOrIdentifier 'REFRESH' String?
                                | alterExternalTableAddFiles: 'ALTER' 'EXTERNAL' 'TABLE' IfExists? ObjectColumnNameOrIdentifier 'ADD' 'FILES' "(" StringList ")"
                                | alterExternalTableRemoveFiles: 'ALTER' 'EXTERNAL' 'TABLE' IfExists? ObjectColumnNameOrIdentifier 'REMOVE' 'FILES' "(" StringList ")"
                                | alterExternalTableSet: 'ALTER' 'EXTERNAL' 'TABLE' IfExists? ObjectColumnNameOrIdentifier 'SET'
                                        AutoRefresh? 
                                        TagDeclList?
                                | alterExternalTableUnset: 'ALTER' 'EXTERNAL' 'TABLE' IfExists? ObjectColumnNameOrIdentifier UnsetTags 
                                //Partitions added and removed manually
                                | alterExternalTableAddPartition: 'ALTER' 'EXTERNAL' 'TABLE' ObjectColumnNameOrIdentifier IfExists? 'ADD' 'PARTITION' "(" ColumnNameStringList ")" 'LOCATION' String
                                | alterExternalTableDropPartition: 'ALTER' 'EXTERNAL' 'TABLE' ObjectColumnNameOrIdentifier IfExists? 'DROP' 'PARTITION' 'LOCATION' String
                                ;

syntax AutoRefresh = autoRefresh: 'AUTO_REFRESH' "=" Boolean;

syntax ColumnNameString = columnNameString: ObjectColumnNameOrIdentifier "=" String;

syntax ColumnNameStringList = columnNameStringList: {ColumnNameString ","}+;

syntax AlterResourceMonitor = alterResourceMonitor: 'ALTER' 'RESOURCE' 'MONITOR' IfExists? Identifier SetResourceOpts? NotifyTriggers?;

syntax SetResourceOpts = setResourceOpts: 'SET' CreditQuota? Frequency? StartTimeStamp? EndTimeStamp?;

syntax CreditQuota = creditQuota: 'CREDIT_QUOTA' "=" Int;

syntax StartTimeStamp = startTimeStamp: 'START_TIMESTAMP' "=" String;

syntax EndTimeStamp = endTimeStamp: 'END_TIMESTAMP' "=" String;

syntax Frequency = frequency: 'FREQUENCY' "=" FrequencyOpts;

syntax FrequencyOpts = monthlyFrequency: 'MONTHLY' 
                        | dailyFrequency: 'DAILY' 
                        | weeklyFrequency: 'WEEKLY' 
                        | yearlyFrequency: 'YEARLY' 
                        | neverFrequency: 'NEVER'
                        ;

syntax NotifyTriggers = notifyTriggers: NotifyUsers Triggers?;

syntax NotifyUsers = notifyUsers: 'NOTIFY_USERS' "=" "(" {Identifier ","}+ ")";

syntax Triggers = triggers: 'TRIGGERS' TriggerDefinition+;

syntax TriggerDefinition = triggerDefinition: 'ON' Int 'PERCENT' 'DO' SuspendType;

syntax SuspendType = suspendTypeOpt1: 'SUSPEND' 
                        | suspendTypeOpt2: 'SUSPEND_IMMEDIATE' 
                        | suspendTypeOpt3: 'NOTIFY'
                        ;

syntax AlterSequence = alterSequenceRenameTo: 'ALTER' 'SEQUENCE' IfExists? ObjectColumnNameOrIdentifier 'RENAME' 'TO' ObjectColumnNameOrIdentifier
                        | alterSequenceSetIncrementBy: 'ALTER' 'SEQUENCE' IfExists? ObjectColumnNameOrIdentifier 'SET' IncrementBy?
                        | alterSequenceIncrementBy: 'ALTER' 'SEQUENCE' IfExists? ObjectColumnNameOrIdentifier IncrementBy?
                        | alterSequenceSetOrderComment: 'ALTER' 'SEQUENCE' IfExists? ObjectColumnNameOrIdentifier 'SET' OrderComment
                        | alterSequenceUnsetComment: 'ALTER' 'SEQUENCE' IfExists? ObjectColumnNameOrIdentifier 'UNSET' 'COMMENT'
                        ;
                        
syntax IncrementBy = incrementByOpt1: 'INCREMENT' "=" Int
                    | incrementByOpt2: 'INCREMENT' 'BY' "=" Int
                    | incrementByOpt3: 'INCREMENT' Int
                    | incrementByOpt4: 'INCREMENT' 'BY' Int
                    ;

syntax OrderComment = orderCommentOpt1: OrderNoOrder? CommentClause 
                        | orderCommentOpt2: OrderNoOrder
                        ;

syntax OrderNoOrder = orderNoOrder1: 'ORDER'
                    | orderNoOrder2: 'NOORDER'
                    ;

syntax CreateStage = createStageInternalParams: 'CREATE' OrReplace? Temporary? 'STAGE' IfNotExists? ObjectNameOrIdentifierFunc CloneAtBefore?
                                StageEncryptionOptsInternal?
                                DirectoryTableInternalParams?
                                FileFormat?
                                CopyEqCopyOpts?
                                WithTags?
                                CommentClause?
                        | createStageExternalParams: 'CREATE' OrReplace? Temporary? 'STAGE' IfNotExists? ObjectNameOrIdentifierFunc CloneAtBefore?
                                ExternalStageParams
                                DirectoryTableExternalParams?
                                FileFormat?
                                CopyEqCopyOpts? 
                                WithTags?
                                CommentClause?
                        ;

syntax StageEncryptionOptsInternal = stageEncryptionOptsInternal: 'ENCRYPTION' "=" "(" 'TYPE' "=" SnowFlakeFullSSE ")";

syntax SnowFlakeFullSSE = snowflakeFull: 'SNOWFLAKE_FULL' 
                        | snowflakeSSE: 'SNOWFLAKE_SSE'
                        ;

syntax DirectoryTableInternalParams = directoryTableInternalParams: 'DIRECTORY' "=" "(" EnableRefreshOnCreate")";

syntax EnableRefreshOnCreate = enableRefreshOnCreateOpt1: Enable RefreshOnCreate?
                                | enableRefreshOnCreateOpt2: RefreshOnCreate Enable?
                                ;

syntax ObjectNameOrIdentifierFunc = objectNameOrIdentifierFuncOpt1: ObjectColumnNameOrIdentifier
                                        | objectNameOrIdentifierFuncOpt2: 'IDENTIFIER' "(" String ")"
                                        ;

syntax Enable = enableTrueOrFalse: 'ENABLE' "=" Boolean; 

syntax CopyEqCopyOpts = copyEqCopyOpts: 'COPY_OPTIONS' "=" "(" CopyOptions ")";

syntax ExternalStageParams = externalStageAwsParam: 'URL' "=" S3OrGovAwsPath AwsCredentialEncryption*
                                //(for Google Cloud Storage)
                                | externalStageGcpParam: 'URL' "=" GcsPath GcpCredentialEncryption*
                                //(for Microsoft Azure)
                                | externalStageAzureParam: 'URL' "=" AzurePath AzCredentialEncryption*
                                ; 

syntax AwsCredentialEncryption = awsCredentialIntegration: AwsCredentialOrStorageIntegration
                                | awsCredentialEncryption: StageEncryptionOptsAws
                                ;

syntax AwsCredentialOrStorageIntegration = awsStorageIntegration: StorageIntegrationId
                                                |  awsCredential: 'CREDENTIALS' "=" "(" AwsKeyTokenOrRole ")"
                                                ; 

syntax StorageIntegrationId = storageIntegrationId: 'STORAGE_INTEGRATION' "=" Identifier;                                     

syntax AwsKeyTokenOrRole = awsKeyTokenOrRoleOpt1: AwsKeyId AwsSecretKey AwsToken? 
                                | awsKeyTokenOrRoleOpt2: AwsRole
                                ;

syntax AwsKeyId = awsKeyId: 'AWS_KEY_ID' "=" String;

syntax AwsSecretKey = awsSecretKey: 'AWS_SECRET_KEY' "=" String;

syntax AwsToken = awsToken: 'AWS_TOKEN' "=" String;

syntax AwsRole = awsRole: 'AWS_ROLE' "=" String;

syntax StageEncryptionOptsAws = stageEncryptionOptsAws: 'ENCRYPTION' "=" "(" StageTypeMasterOrKmsKey ")";

syntax StageTypeMasterOrKmsKey = stageTypeMasterKey: StageType? StageMasterKey
                                | stageTypeKmsKey: StageType StageKmsKey?
                                ;

syntax StageType = stageType: 'TYPE' "=" String;

syntax StageMasterKey = stageMasterKey: 'MASTER_KEY' "=" String;

syntax StageKmsKey = stageKmsKey: 'KMS_KEY_ID' "=" String;

syntax GcpCredentialEncryption = gcpCredentialIntegration: StorageIntegrationId
                                | gcpCredentialEncryption: StageEncryptionOptsGcp
                                ;

syntax StageEncryptionOptsGcp = stageEncryptionOptsGcp: 'ENCRYPTION' "=" "(" GcpEncryptionValue ")";
                  
syntax GcpEncryptionValue = typeGcsSseKmsKey: TypeGcsSseKms? 'KMS_KEY_ID' "=" String
                                | kmsTypeGcsSse: 'KMS_KEY_ID' "=" String 'TYPE' "=" '\'GCS_SSE_KMS\''
                                | typeNoneGcp: 'TYPE' "=" '\'NONE\''
                                ;

syntax TypeGcsSseKms = typeGcsSseKms: 'TYPE' "=" '\'GCS_SSE_KMS\'';

syntax AzCredentialEncryption = azCredentialIntegration: AzCredentialOrStorageIntegration
                                | azCredentialEncryption: StageEncryptionOptsAz
                                ;

syntax AzCredentialOrStorageIntegration = azureStorageIntegrationId: StorageIntegrationId
                                        |  azureSasToken: 'CREDENTIALS' "=" "(" 'AZURE_SAS_TOKEN' "=" String ")"
                                        ;

syntax StageEncryptionOptsAz = stageEncryptionOptsAz: 'ENCRYPTION' "=" "(" AzureEncryptionValue ")";

syntax AzureEncryptionValue = masterKeyValue: TypeAzureCse? 'MASTER_KEY' "=" String
                                | masterKeyType: 'MASTER_KEY' "=" String 'TYPE' "=" '\'AZURE_CSE\''
                                | typeNoneAzure: 'TYPE' "=" '\'NONE\''
                                ;

syntax TypeAzureCse = typeAzureCse: 'TYPE' "=" '\'AZURE_CSE\'';                   

syntax DirectoryTableExternalParams = directoryTableExternalParams: 'DIRECTORY' "=" "(" Enable RefreshOnCreateOrAutoRefresh* NotificationIntegration? ")";

syntax RefreshOnCreateOrAutoRefresh = refreshOnCreateOrAutoRefreshOpt1: AutoRefresh?
                                        | refreshOnCreateOrAutoRefreshOpt1: RefreshOnCreate?
                                        ;

syntax NotificationIntegration = notificationIntegration: 'NOTIFICATION_INTEGRATION' "=" String;

syntax CreateStorageIntegration = createStorageIntegration: 'CREATE' OrReplace? 'STORAGE' 'INTEGRATION' IfNotExists? Identifier
                                        'TYPE' "=" 'EXTERNAL_STAGE'
                                        CloudProviderParam
                                        Enabled
                                        'STORAGE_ALLOWED_LOCATIONS' "=" "(" StringList ")" 
                                        StorageBlockedLocations?
                                        CommentClause?
                                ;

syntax StorageBlockedLocations = storageBlockedLocations: 'STORAGE_BLOCKED_LOCATIONS' "=" "(" StringList ")";

syntax CreateStream
                        //-- table
                        = createStreamOnTable: 'CREATE' OrReplace? 'STREAM' IfNotExists?
                                ObjectColumnNameOrIdentifier
                                CopyGrants?
                                'ON' 'TABLE' ObjectColumnNameOrIdentifier
                                StreamTime?
                                AppendOnly?
                                ShowInitialRows?
                                CommentClause?
                        //-- External table
                        | createStreamOnExternalTable: 'CREATE' OrReplace? 'STREAM' IfNotExists?
                                ObjectColumnNameOrIdentifier
                                CopyGrants?
                                'ON' 'EXTERNAL' 'TABLE' ObjectColumnNameOrIdentifier
                                StreamTime?
                                InsertOnly?
                                CommentClause?
                        //-- Directory table
                        |  createStreamOnStage: 'CREATE' OrReplace? 'STREAM' IfNotExists?
                                ObjectColumnNameOrIdentifier
                                CopyGrants?
                                'ON' 'STAGE' ObjectColumnNameOrIdentifier
                                CommentClause?
                        //-- View
                        |  createStreamOnView: 'CREATE' OrReplace? 'STREAM' IfNotExists?
                                ObjectColumnNameOrIdentifier
                                CopyGrants?
                                'ON' 'VIEW' ObjectColumnNameOrIdentifier
                                StreamTime?
                                AppendOnly?
                                ShowInitialRows?
                                CommentClause?
                        ;

syntax StreamTime = streamOptional: CloneOptional;

syntax InsertOnly = insertOnly: 'INSERT_ONLY' "=" 'TRUE';

syntax AppendOnly = appendOnly: 'APPEND_ONLY' "=" Boolean;

syntax ShowInitialRows = showInitialRows: 'SHOW_INITIAL_ROWS' "=" Boolean;

syntax CreateTag = createTag: 'CREATE' OrReplace? 'TAG' IfNotExists? ObjectColumnNameOrIdentifier TagAllowedValues? CommentClause?;


syntax CreateWarehouse = createWarehouse: 'CREATE' OrReplace? 'WAREHOUSE' IfNotExists? IdentifierFn WithWhProperties? WhParams*;

syntax WithWhProperties = withWhProperties: 'WITH' WhProperties+
                        | withWhPropertiesNoWith: WhProperties+
                        ;

syntax WhProperties = warehouseSizeProp: 'WAREHOUSE_SIZE' "=" WarehouseSizeOrId
                        | maxCountProp: 'MAX_CLUSTER_COUNT' "=" Int
                        | minClusterProp: 'MIN_CLUSTER_COUNT' "=" Int
                        | scalingPolicyProp: 'SCALING_POLICY' "=" StandardOrEconomy
                        | autoSuspendProp: 'AUTO_SUSPEND' Exp
                        | autoResumeProp: 'AUTO_RESUME' "=" Boolean
                        | initiallySuspendedProp: 'INITIALLY_SUSPENDED' "=" Boolean
                        | resourceMoinitorProp: 'RESOURCE_MONITOR' "=" Identifier
                        | commentClauseProp: CommentClause
                        | enableQueryProp: 'ENABLE_QUERY_ACCELERATION' "=" Boolean
                        | queryAccelerationProp: 'QUERY_ACCELERATION_MAX_SCALE_FACTOR' "=" Int
                        ;

syntax WarehouseSizeOrId = wareHouseSize: WhSize 
                                | wareHouseId: WhIdentifier
                                ;


syntax StandardOrEconomy = standardOrEconomyOpt1: 'STANDARD' 
                        | standardOrEconomyOpt2: 'ECONOMY'
                        ;

syntax WhParams = maxConcurrencyParam: 'MAX_CONCURRENCY_LEVEL' "=" Int
                | statementQueuedParam: 'STATEMENT_QUEUED_TIMEOUT_IN_SECONDS' "=" Int
                | statementTimeoutParam: 'STATEMENT_TIMEOUT_IN_SECONDS' "=" Int WithTags?
                ;

syntax CreateObjectClone =  createObjectClone: 'CREATE' OrReplace? CreateCloneOpts IfNotExists? ObjectColumnNameOrIdentifier
                                        'CLONE' ObjectColumnNameOrIdentifier
                                ;

syntax CreateCloneOpts = stageCloneOpt: 'STAGE' 
                        | fileFormatCloneOpt: 'FILE' 'FORMAT' 
                        | sequenceCloneOpt: 'SEQUENCE' 
                        | streamCloneOpt: 'STREAM' 
                        | taskCloneOpt: 'TASK'
                        ;


syntax CreateAccount = createAccount: 'CREATE' 'ACCOUNT' Identifier
                                'ADMIN_NAME' "=" Identifier
                                'ADMIN_PASSWORD' "=" String
                                FirstName?
                                LastName?
                                'EMAIL' "=" String
                                MustChangePassword?
                                'EDITION' "=" EditionType
                                RegionGroup?
                                SnowflakeRegion?
                                CommentClause?
                        ;

syntax MustChangePassword = mustChangePassword: 'MUST_CHANGE_PASSWORD' "=" Boolean;

syntax FirstName = firstName: 'FIRST_NAME' "=" Identifier;

syntax LastName = lastName: 'LAST_NAME' "=" Identifier;

syntax EditionType = standard: 'STANDARD'
                    | enterprise: 'ENTERPRISE'
                    | businessCritical: 'BUSINESS_CRITICAL'
                    ;

syntax RegionGroup = regionGroup: 'REGION_GROUP' "=" Identifier;

syntax SnowflakeRegion = snowflakeRegion: 'REGION' "=" Identifier;

syntax CreateDatabase = createDatabaseWithTransient: 'CREATE' OrReplace? 'TRANSIENT' 'DATABASE' IfNotExists? Identifier
                                        CloneAtBefore?
                                        DataRetentionTime?
                                        MaxDataExtentionTime?
                                        DefaultDdlCollation?
                                        WithTags?
                                        CommentClause?
                        | createDatabaseNoTransient: 'CREATE' OrReplace? 'DATABASE' IfNotExists? Identifier
                                        CloneAtBefore?
                                        DataRetentionTime?
                                        MaxDataExtentionTime?
                                        DefaultDdlCollation?
                                        WithTags?
                                        CommentClause?
                        ;

syntax OrReplace = orReplace: 'OR' 'REPLACE';

syntax IfNotExists = ifNotExists: 'IF' 'NOT' 'EXISTS';

syntax CloneAtBefore = cloneAtBefore: 'CLONE' ObjectColumnNameOrIdentifier CloneOptional?;

syntax CloneOptional = cloneTimeStamp: AtOrBefore "(" 'TIMESTAMP' "=\>" String ")"
                        | cloneOffset: AtOrBefore "(" 'OFFSET' "=\>" String ")"
                        | cloneStatement: AtOrBefore "(" 'STATEMENT' "=\>" Identifier ")"
                        | cloneStream: AtOrBefore "(" 'STREAM' "=\>" String ")"
                        ;

syntax AtOrBefore = atOrBeforeOpt1: 'AT' 
                    | atOrBeforeOpt2: 'BEFORE'
                    ;

syntax DataRetentionTime = dataRetentionTime: 'DATA_RETENTION_TIME_IN_DAYS' "=" Number;

syntax MaxDataExtentionTime = maxDataExtentionTime: 'MAX_DATA_EXTENSION_TIME_IN_DAYS' "=" Number;

syntax WithTags = withTags: 'WITH' 'TAG' "(" {TagDecl ","}+ ")"
                | withTagsNoWith: 'TAG' "(" {TagDecl ","}+ ")"
                ;

syntax CreateSchema = createSchemaWithTransient: 'CREATE' OrReplace? 'TRANSIENT' 'SCHEMA' IfExists? ObjectColumnNameOrIdentifier
                                CloneAtBefore?
                                WithManagedAccess?
                                DataRetentionTime?
                                MaxDataExtentionTime?
                                DefaultDdlCollation?
                                WithTags?
                                CommentClause?
                        | createSchemaNoTransient: 'CREATE' OrReplace? 'SCHEMA' IfExists? ObjectColumnNameOrIdentifier
                                CloneAtBefore?
                                WithManagedAccess?
                                DataRetentionTime?
                                MaxDataExtentionTime?
                                DefaultDdlCollation?
                                WithTags?
                                CommentClause?
                        ;

syntax WithManagedAccess = withManagedAccess: 'WITH' 'MANAGED' 'ACCESS';

syntax CreateFileFormat = createFileFormat: 'CREATE' OrReplace? 'FILE' 'FORMAT' IfNotExists? ObjectColumnNameOrIdentifier
                                TypeEqFormatType? FormatTypeOptions*
                                CommentClause?
                        ;

syntax TypeEqFormatType = typeEqFormatType: 'TYPE' "=" FormatType;

syntax FormatType = csv_: 'CSV'
                    | json_: 'JSON' 
                    | avro_: 'AVRO' 
                    | orc_: 'ORC' 
                    | parquet_: 'PARQUET'
                    | xml_: 'XML'
                    | csv_q: '\'CSV\''
                    | json_q: '\'JSON\'' 
                    | avro_q: '\'AVRO\'' 
                    | orc_q: '\'ORC\'' 
                    | parquet_q: '\'PARQUET\''
                    | xml_q: '\'XML\''
                    ;

syntax CreateUser = createUser: 'CREATE' OrReplace? 'USER' IfNotExists? Identifier ObjectProperties? ObjectParams? SessionParams?;

syntax CreateConnection = createConnection: 'CREATE' 'CONNECTION' IfNotExists? Identifier AsReplicaOfObjectName? CommentClause?;

syntax AsReplicaOfObjectName = asReplicaOfObjectName: 'AS' 'REPLICA' 'OF' ObjectColumnNameOrIdentifier;

syntax CreateDynamicTable = createDynamicTable: 'CREATE' OrReplace? 'DYNAMIC' 'TABLE' Identifier
                                'TARGET_LAG' "=" String
                                'WAREHOUSE' "=" Identifier
                                'AS' Query
                            ;

syntax CreateEventTable = createEventTable: 'CREATE' OrReplace? 'EVENT' 'TABLE' IfNotExists? Identifier
                                ClusterBy?
                                DataRetentionTimeEqInt?
                                MaxDataExtentionTimeEqInt?
                                ChangeTracking?
                                DefaultDdlCollation?
                                CopyGrants?
                                WithRowAccessPolicy?
                                WithTags?
                                WithCommentClause? 
                            ;

syntax WithCommentClause = withCommentClauseNoWith: CommentClause
                                | withCommentClause: 'WITH' CommentClause
                                ;


syntax CreateFailoverGroup = createFailoverGroupAsReplica: 'CREATE' 'FAILOVER' 'GROUP' IfNotExists? Identifier AsReplicaOfObjectName
                                | createFailoverGroupObjectTypes: 'CREATE' 'FAILOVER' 'GROUP' IfNotExists? Identifier
                                        'OBJECT_TYPES' "=" ObjectTypeList
                                        AllowedDatabases?
                                        AllowedShares?
                                        AllowedIntegrationTypes?
                                        'ALLOWED_ACCOUNTS' "=" ObjectColumnNameOrIdentifier
                                        IgnoreEditionCheck?
                                        ReplicationSchedule? 
                                ;

syntax AllowedDatabases = allowedDatabases: 'ALLOWED_DATABASES' "=" {Identifier ","}+;

syntax AllowedShares = allowedShares: 'ALLOWED_SHARES' "=" {Identifier ","}+;

syntax AllowedIntegrationTypes = allowedIntegrationTypes: 'ALLOWED_INTEGRATION_TYPES' "=" {IntegrationTypeName ","}+;

syntax IntegrationTypeName =  securityIntegrations: 'SECURITY' 'INTEGRATIONS' 
                                | apiIntegrations: 'API' 'INTEGRATIONS'
                                ;

syntax CreateManagedAccount = createManagedAccount: 'CREATE' 'MANAGED' 'ACCOUNT' Identifier
                                        'ADMIN_NAME' "=" Identifier "," 'ADMIN_PASSWORD' "=" String "," 
                                        'TYPE' "=" 'READER' CommaCommentClause?
                                ;

syntax CommaCommentClause = commaCommentClause: "," CommentClause;

syntax CreateNetworkPolicy = createNetworkPolicy: 'CREATE' OrReplace? 'NETWORK' 'POLICY' Identifier
                                        AllowedIPList
                                        BlockedIPList?
                                        CommentClause?
                                ;

syntax CreateApiIntegration = apiAwsRole: 'CREATE' OrReplace? 'API' 'INTEGRATION' IfNotExists? Identifier
                                        'API_PROVIDER' "=" Identifier
                                        'API_AWS_ROLE_ARN' "=" String
                                        ApiKey?
                                        'API_ALLOWED_PREFIXES' "=" "(" String ")"
                                        ApiBlockedPrefixes?
                                        Enabled
                                        CommentClause?
                                | azureTenant: 'CREATE' OrReplace? 'API' 'INTEGRATION' IfNotExists? Identifier
                                        'API_PROVIDER' "=" Identifier
                                        'AZURE_TENANT_ID' "=" String
                                        'AZURE_AD_APPLICATION_ID' "=" String
                                        ApiKey?
                                        'API_ALLOWED_PREFIXES' "=" "(" String ")"
                                        ApiBlockedPrefixes?
                                        Enabled
                                        CommentClause?
                                | googleAudience: 'CREATE' OrReplace? 'API' 'INTEGRATION' IfNotExists? Identifier
                                        'API_PROVIDER' "=" Identifier
                                        'GOOGLE_AUDIENCE' "=" String
                                        'API_ALLOWED_PREFIXES' "=" "(" String ")"
                                        ApiBlockedPrefixes?
                                        Enabled
                                        CommentClause?
                                ;

syntax CreateExternalFunction = createExternalFunction: 'CREATE' OrReplace? 'SECURE' 'EXTERNAL' 'FUNCTION' 
                                        ObjectColumnNameOrIdentifier "(" ArgDataTypeList? ")"
                                        'RETURNS' DataType NullNotNull?
                                        CalledReturnsOrStrict?
                                        VolatileOrImmutable?
                                        CommentClause?
                                        'API_INTEGRATION' "=" Identifier
                                        Headers?
                                        ContextHeaders?
                                        MaxBatchRows?
                                        Compression?
                                        RequestTranslator?
                                        ResponseTranslator?
                                        'AS' String
                                | createExternalFunctionNoSecure: 'CREATE' OrReplace? 'EXTERNAL' 'FUNCTION' 
                                        ObjectColumnNameOrIdentifier "(" ArgDataTypeList? ")"
                                        'RETURNS' DataType NullNotNull?
                                        CalledReturnsOrStrict?
                                        VolatileOrImmutable?
                                        CommentClause?
                                        'API_INTEGRATION' "=" Identifier
                                        Headers?
                                        ContextHeaders?
                                        MaxBatchRows?
                                        Compression?
                                        RequestTranslator?
                                        ResponseTranslator?
                                        'AS' String
                                ;

syntax ArgDataTypeList = argDataTypeList: {ArgDataType ","}+;

syntax ArgDataType = argDataType: Identifier Identifier;

syntax VolatileOrImmutable = volatileOpt: 'VOLATILE' 
                                | immutableOpt: 'IMMUTABLE'
                                ;

syntax Headers = headers: 'HEADERS' "=" "(" {HeaderDecl ","}+ ")";

syntax ContextHeaders = contextHeaders: 'CONTEXT_HEADERS' "=" "(" {Identifier ","}+ ")";

syntax MaxBatchRows = maxBatchRows: 'MAX_BATCH_ROWS' "=" Int;

syntax ResponseTranslator = responseTranslator: 'RESPONSE_TRANSLATOR' "=" Identifier;

syntax RequestTranslator = requestTranslator: 'REQUEST_TRANSLATOR' "=" Identifier;

syntax CreateExternalTable = createExternalTableAuto: 'CREATE' OrReplace? 'EXTERNAL' 'TABLE' IfNotExists?
                                        ObjectColumnNameOrIdentifier "(" ExternalTableColumnDeclList ")"
                                        CloudProviderParam?
                                        PartitionBy?
                                        LocationEqInternalOrExternalStage
                                        RefreshOnCreate?
                                        AutoRefresh?
                                        Pattern?
                                        FileFormat
                                        AwsSNSTopic?
                                        CopyGrants?
                                        WithRowAccessPolicy?
                                        WithTags?
                                        CommentClause?
                                // Partitions added and removed manually
                                | createExternalTableManual: 'CREATE' OrReplace? 'EXTERNAL' 'TABLE' IfNotExists?
                                        ObjectColumnNameOrIdentifier "(" ExternalTableColumnDeclList ")"
                                        CloudProviderParam?
                                        PartitionBy?
                                        LocationEqInternalOrExternalStage
                                        PartitionType
                                        FileFormat
                                        CopyGrants?
                                        WithRowAccessPolicy?
                                        WithTags?
                                        CommentClause?
                                // Delta Lake
                                | createExternalTableDeltaLake: 'CREATE' OrReplace? 'EXTERNAL' 'TABLE' IfNotExists?
                                        ObjectColumnNameOrIdentifier "(" ExternalTableColumnDeclList ")"
                                        CloudProviderParam?
                                        PartitionBy?
                                        LocationEqInternalOrExternalStage
                                        PartitionType
                                        FileFormat
                                        TableFormatEqDelta?
                                        CopyGrants?
                                        WithRowAccessPolicy?
                                        WithTags?
                                        CommentClause?
                                ;

syntax ExternalTableColumnDeclList = externalTableColumnDeclList: {ExternalTableColumnDecl ","}+;

syntax ExternalTableColumnDecl = externalTableColumnDecl: ObjectColumnNameOrIdentifier DataType 'AS' Exp InlineConstraint?;


syntax CloudProviderParam = cloudProviderParamAws: 'STORAGE_PROVIDER' "=" '\'S3\'' 'STORAGE_AWS_ROLE_ARN' "=" String StorageAwsObject?
                                //(for Google Cloud Storage)
                                | cloudProviderParamGCS: 'STORAGE_PROVIDER' "=" 'GCS'
                                //(for Microsoft Azure)
                                | cloudProviderParamAzure: 'STORAGE_PROVIDER' "=" 'AZURE AZURE_TENANT_ID' "=" String
                                ;

syntax StorageAwsObject = storageAwsObject: 'STORAGE_AWS_OBJECT_ACL' "=" String;

syntax LocationEqInternalOrExternalStage = withLocation: 'WITH' 'LOCATION' "=" InternalOrExternalStage
                                                | noWithLocation: 'LOCATION' "=" InternalOrExternalStage
                                                ;

syntax RefreshOnCreate = refreshOnCreate: 'REFRESH_ON_CREATE' "=" Boolean; 

syntax AwsSNSTopic = awsSNSTopic: 'AWS_SNS_TOPIC' "=" String;

syntax PartitionType = partitionType: 'PARTITION_TYPE' "=" 'USER_SPECIFIED';

syntax TableFormatEqDelta = tableFormatEqDelta: 'TABLE_FORMAT' "=" 'DELTA';

syntax CreateTable =  createTable: 'CREATE' OrReplace? TableType? 'TABLE' IfNotExistsObjectName? CloneAtBefore? CreateTableOrCommentClause*;

syntax CreateTableOrCommentClause = createTableOrCommentClauseOpt1: CreateTableClause
                                        | createTableOrCommentClauseOpt2: CommentClause
                                        ;
                                        
syntax CreateTableClause = createTableClause: ColumnDeclItemListWithBrackets
                                        ClusterBy?
                                        StageFileFormat?
                                        StageCopyEqCopyOptions?
                                        DataRetentionTimeEqInt?
                                        MaxDataExtentionTimeEqInt?
                                        ChangeTracking?
                                        DefaultDdlCollation?
                                        CopyGrants?
                                        WithRowAccessPolicy?
                                        WithTags?
                                ;

syntax ColumnDeclItem = fullColItem: FullColDecl
                        | outOfLineConstraintItem: OutOfLineConstraint
                        ;
                        
syntax ColumnDeclItemList = columnDeclItemList: { ColumnDeclItem ","}+;

syntax ColumnDeclItemListWithBrackets = columnDeclItemListWithBrackets: "(" ColumnDeclItemList ")";

syntax FullColDecl = fullColDecl: ColDecl FullColDeclOptionals* WithMaskingPolicy? WithTags? CommentString?;

syntax OutOfLineConstraint = outOfLineConstraint: ConstraintId? OutOfLineConstraintOptionals;

syntax ColDecl = colDecl: IdentifierType DataType;

syntax FullColDeclOptionals = fullColDeclOptCollate: Collate
                            | fullColDeclOptInline: InlineConstraint
                            | fullColDeclOptDefault: DefaultValue
                            | fullColDeclOptNullNotNull: NullNotNull
                            ;

syntax InlineConstraint = inlineConstraintUnique: ConstraintId? UniquePrimaryKey CommonConstraintProperties*
                        | inlineConstraintForeign: NullNotNull? ConstraintId? ForeignKey 'REFERENCES' ObjectColumnNameOrIdentifier ColumnNameWithBrackets? ConstraintProperties
                        ;

syntax ConstraintId = constraintId: 'CONSTRAINT' Identifier;

syntax UniquePrimaryKey = uniquePrimaryKeyOpt1: 'UNIQUE' 
                        | uniquePrimaryKeyOpt2: PrimaryKey
                        ;

syntax PrimaryKey = primaryKey: 'PRIMARY' 'KEY';

syntax ForeignKey = foreignKey: 'FOREIGN' 'KEY';

syntax CommonConstraintProperties = enforcedConstraintProp: EnforcedNotEnforced ValidateNoValidate?
                                    | defferableConstraintProp: DeferrableNotDeferrable
                                    | initiallyConstraintProp: InitiallyDeferredOrImmediate
                                    | enableConstraintProp: EnableDisable ValidateNoValidate?
                                    | relyConstraintProp: 'RELY'
                                    | norelyConstraintProp: 'NORELY'
                                    ;

syntax EnforcedNotEnforced = enforcedNotEnforced: 'NOT' 'ENFORCED'
                            | enforcedNotEnforcedNoNot: 'ENFORCED'
                            ;

syntax DeferrableNotDeferrable = deferrableNotDeferrable: 'NOT' 'DEFERRABLE'
                                | deferrableNotDeferrableNoNot: 'DEFERRABLE'
                                ;

syntax ValidateNoValidate = validateNoValidateOpt1: 'VALIDATE' 
                            | validateNoValidateOpt2: 'NOVALIDATE'
                            ;

syntax InitiallyDeferredOrImmediate = initiallyDeferred: 'INITIALLY' 'DEFERRED' 
                                    | initiallyImmediate: 'INITIALLY' 'IMMEDIATE'
                                    ;

syntax ColumnNameWithBrackets = columnNameWithBrackets: "(" ObjectColumnNameOrIdentifier ")";

syntax ConstraintProperties = constraintPropStar: CommonConstraintProperties*
                            | constraintPropForeign: ForeignKeyOnActionToggle+
                            ;

syntax ForeignKeyOnActionToggle = foreignKeyOnActionToggleOpt1: ForeignKeyMatch 
                                | foreignKeyOnActionToggleOpt2: OnUpdate 
                                | foreignKeyOnActionToggleOpt3: OnDelete
                                ;

syntax ForeignKeyMatch = matchFull: 'MATCH' 'FULL' 
                        | matchPartial: 'MATCH' 'PARTIAL'
                        | matchSimple: 'MATCH' 'SIMPLE'
                        ;

syntax OnUpdate = onUpdate: 'ON' 'UPDATE' OnAction;

syntax OnDelete = onDelete: 'ON' 'DELETE' OnAction;

syntax OnAction = cascadeAction: 'CASCADE'
                | setNullAction: 'SET' 'NULL' 
                | setDefaultAction: 'SET' 'DEFAULT'
                | restrictAction: 'RESTRICT'
                | noAction: 'NO' 'ACTION'
                ;

syntax DefaultValue = defaultExpVal: 'DEFAULT' Exp 
                    | autoIncrementVal: 'AUTOINCREMENT' StartWithIncrementBy? OrderNoOrder?
                    | identityVal: 'IDENTITY' StartWithIncrementBy? OrderNoOrder?
                    ;

syntax StartWithIncrementBy = startWithIncrementByOpt1: ListOfIntWithBracket 
                            | startWithIncrementByOpt2: StartWith 
                            | startWithIncrementByOpt3: IncrementBy 
                            | startWithIncrementByOpt4: StartWith IncrementBy
                            ;

syntax StartWith = startWithOpt1: 'START' Int
                    | startWithOpt2: 'START' 'WITH' "=" Int
                    | startWithOpt3: 'START' "=" Int
                    | startWithOpt4: 'START' 'WITH' Int
                    ;

syntax WithMaskingPolicy = withMaskingPolicy: 'WITH' 'MASKING' 'POLICY' Identifier UsingColumnList?
                            | withMaskingPolicyNoWith: 'MASKING' 'POLICY' Identifier UsingColumnList?
                            ;

syntax CommentString = commentString: 'COMMENT' String;

syntax OutOfLineConstraintOptionals = outOfLineConstraintUnique: UniquePrimaryKey ColumnListWithBrackets CommonConstraintProperties*
                                    | outOfLineConstraintForeign: ForeignKey ColumnListWithBrackets 'REFERENCES' ObjectColumnNameOrIdentifier ColumnListWithBrackets ConstraintProperties
                                    ;

syntax ClusterBy = clusterBy: 'CLUSTER' 'BY' ExpListWithBrackets;

syntax StageFileFormat = stageFileFormatOpt1: 'STAGE_FILE_FORMAT' "=" "(" 'FORMAT_NAME' "=" String ")"
                        | stageFileFormatOpt2: 'STAGE_FILE_FORMAT' "=" "(" 'TYPE' "=" FormatType FormatTypeOptions+ ")"
                        ;

syntax StageCopyEqCopyOptions = stageCopyEqCopyOptions: 'STAGE_COPY_OPTIONS' "=" "(" CopyOptions ")";

syntax CopyOptions = onErrorOpts: 'ON_ERROR' "=" OnErrorAction
                    | sizeLimitInt: 'SIZE_LIMIT' "=" Int
                    | purgeTrueOrFalse: 'PURGE' "=" Boolean
                    | returnedFailedOnly: 'RETURN_FAILED_ONLY' "=" Boolean
                    | matchByColName: 'MATCH_BY_COLUMN_NAME' "=" Sensitivity
                    | enforceLength: 'ENFORCE_LENGTH' "=" Boolean
                    | truncateCol: 'TRUNCATECOLUMNS' "=" Boolean
                    | forceTrueOrFalse: 'FORCE' "=" Boolean
                    ;

syntax OnErrorAction = continueAction: 'CONTINUE'
                        | skipFile: 'SKIP_FILE' 
                        | skipFileInt: 'SKIP_FILE_' Int
                        | skipFileAbort: 'SKIP_FILE_' Int 'ABORT_STATEMENT'
                        ;

syntax Sensitivity = sensitivityOpt1: 'CASE_SENSITIVE'
                    | sensitivityOpt2: 'CASE_INSENSITIVE' 
                    | sensitivityOpt3: 'NONE'
                    ;

syntax ChangeTracking = changeTracking: 'CHANGE_TRACKING' "=" Boolean;

syntax CopyGrants = copyGrants: 'COPY' 'GRANTS';

syntax WithRowAccessPolicy = withRowAccessPolicy: 'WITH' 'ROW' 'ACCESS' 'POLICY' Identifier 'ON' "(" { ObjectColumnNameOrIdentifier ","}+ ")"
                            | withRowAccessPolicyNoWith: 'ROW' 'ACCESS' 'POLICY' Identifier 'ON' "(" { ObjectColumnNameOrIdentifier ","}+ ")"
                            ;

syntax TableType = volatileType: LocalGlobal? 'VOLATILE'
                    | temporaryType: LocalGlobal? Temporary
                    | transientType: 'TRANSIENT'
                    ;

syntax LocalGlobal = local: 'LOCAL'
                    | global: 'GLOBAL'
                    ;

syntax Temporary = temp: 'TEMP' 
                    | temporary: 'TEMPORARY'
                    ;

syntax IfNotExistsObjectName = ifNotExistsObjectName: IfNotExists? ObjectColumnNameOrIdentifier 
                                | objectNameIfNotExists: ObjectColumnNameOrIdentifier IfNotExists
                                ;

syntax InternalOrExternalStage = stageAtId: "@" Identifier "/"
                                | stageAtIdNoSlash: "@" Identifier
                                | externallocation: ExternalLocation
                                ;

syntax ExternalLocation = externalLocationOpt1: S3OrGovAwsPath
                        | externalLocationOpt2: GcsPath
                        | externalLocationOpt3: AzurePath
                        ;

syntax S3OrGovAwsPath = s3Path: "\'" 's3://' Uri "\'"
                        | s3govPath: "\'" 's3gov://' Uri "\'"
                        ;

syntax GcsPath = gcsPath: "\'" 'gcs://' Uri "\'";

syntax AzurePath = azurePath: "\'" 'azure://' Uri "\'";

syntax FileFormat = fileFormat: 'FILE_FORMAT' "=" "(" FormatNameOrTypeFormat ")";

syntax FormatNameOrTypeFormat = formatNameOrTypeFormatOpt1: FormatName 
                            | formatNameOrTypeFormatOpt2: TypeFormat
                            ;

syntax FormatName = formatName: 'FORMAT_NAME' "=" String;

syntax TypeFormat = typeFormat: 'TYPE' "=" FormatType FormatTypeOptions*;

syntax BracketColumnListWithComment = bracketColumnListWithComment: "(" ColumnListWithComment ")";

syntax ColumnListWithComment = columnListWithComment: {ColumnNameWithComment ","}+;

syntax ColumnNameWithComment = columnNameWithComment: ObjectColumnNameOrIdentifier CommentString?;

syntax ViewCol = viewCol: ObjectColumnNameOrIdentifier WithMaskingPolicy WithTags;


syntax CreateNotificationIntegration = createNotificationAuto: 'CREATE' OrReplace? 'NOTIFICATION' 'INTEGRATION' IfNotExists? Identifier
                                        'ENABLED' "=" Boolean
                                        'TYPE' "=" 'QUEUE'
                                        CloudProviderParamsAuto
                                        CommentClause?
                                | createNotificationPush: 'CREATE' OrReplace? 'NOTIFICATION' 'INTEGRATION' IfNotExists? Identifier
                                        'ENABLED' "=" Boolean
                                        'DIRECTION' "=" 'OUTBOUND'
                                        'TYPE' "=" 'QUEUE'
                                        CloudProviderParamsPush
                                        CommentClause?
                                ;

syntax CreateProcedure = createProcedureLangSQL: 'CREATE' OrReplace? 'PROCEDURE' ObjectColumnNameOrIdentifier "(" ArgDataTypeList? ")"
                                'RETURNS' ReturnsType
                                NullNotNull?
                                'LANGUAGE' 'SQL'
                                CalledReturnsOrStrict?
                                VolatileOrImmutable? // Note: VOLATILE and IMMUTABLE are deprecated.
                                CommentClause?
                                ExecuteAs?
                                'AS' String
                        | createProcedureLangJavascript: 'CREATE' OrReplace? 'SECURE' 'PROCEDURE' ObjectColumnNameOrIdentifier "(" ArgDataTypeList? ")"
                                'RETURNS' ReturnsType
                                'LANGUAGE' 'JAVASCRIPT'
                                CalledReturnsOrStrict?
                                VolatileOrImmutable? // Note: VOLATILE and IMMUTABLE are deprecated.
                                CommentClause?
                                ExecuteAs?
                                'AS' String
                        | createProcedureLangJavascriptNoSecure: 'CREATE' OrReplace? 'PROCEDURE' ObjectColumnNameOrIdentifier "(" ArgDataTypeList? ")"
                                'RETURNS' ReturnsType
                                'LANGUAGE' 'JAVASCRIPT'
                                CalledReturnsOrStrict?
                                VolatileOrImmutable? // Note: VOLATILE and IMMUTABLE are deprecated.
                                CommentClause?
                                ExecuteAs?
                                'AS' String
                        ;

syntax ExecuteAs = executeAs: 'EXECUTE' 'AS' CallerOwner;

syntax CreatePipe = createPipe: 'CREATE' OrReplace? 'PIPE' IfNotExists? ObjectColumnNameOrIdentifier
                                AutoIngest?
                                ErrorIntegration?
                                AwsSNSTopic?
                                IntegrationString?
                                CommentClause?
                                'AS' CopyIntoTable
                        ;

syntax AutoIngest = autoIngest: 'AUTO_INGEST' "=" Boolean;

syntax ErrorIntegration = errorIntegration: 'ERROR_INTEGRATION' "=" Identifier;

syntax IntegrationString = integrationString: 'INTEGRATION' "=" String;

syntax CopyIntoTable = copyIntoTableFromStage: 'COPY' 'INTO' ObjectColumnNameOrIdentifier
                                'FROM' InternalOrExternalStage
                                Files?
                                Pattern?
                                FileFormat?
                                CopyOptions*
                                ValidationMode?
                        | copyIntoTable: 'COPY' 'INTO' ObjectColumnNameOrIdentifier ColumnListWithBrackets?
                                Files?
                                Pattern?
                                FileFormat?
                                CopyOptions*
                        ;

syntax Files = fileEq: 'FILES' "=" "(" { String "," }+ ")";

syntax ValidationMode = validationMode: 'VALIDATION_MODE' "=" ReturnValidationType;

syntax ReturnValidationType = returnValidationTypeOpt1: 'RETURN_' Int '_ROWS' 
                            | returnValidationTypeOpt2: 'RETURN_ERRORS'
                            | returnValidationTypeOpt3: 'RETURN_ALL_ERRORS'
                            ;


syntax CreateRole = createRole: 'CREATE' OrReplace? 'ROLE' IfNotExists? Identifier WithTags? CommentClause?;

syntax CreateRowAccessPolicy = createRowAccessPolicy: 'CREATE' OrReplace? 'ROW' 'ACCESS' 'POLICY' IfNotExists? Identifier 'AS'
                                        "(" ArgDataTypeList? ")"
                                        'RETURNS' 'BOOLEAN' "-\>" Exp
                                        CommentClause?
                                ;

syntax CreateReplicationGroup = replicationGroupAllowed: 'CREATE' 'REPLICATION' 'GROUP' IfNotExists? Identifier
                                        ObjectTypes
                                        AllowedDatabases?
                                        AllowedShares?
                                        AllowedIntegrationTypes?
                                        'ALLOWED_ACCOUNTS' "=" ObjectColumnNameOrIdentifier
                                        IgnoreEditionCheck?
                                        ReplicationSchedule?
                                //Secondary Replication Group
                                | replicationGroupReplica: 'CREATE' 'REPLICATION' 'GROUP' IfNotExists? Identifier AsReplicaOfObjectName
                                ;

syntax CreateResourceMonitor = createResourceMonitor: 'CREATE' OrReplace? 'RESOURCE' 'MONITOR' Identifier 'WITH'
                                        CreditQuota?
                                        Frequency?
                                        StartTimeStamp?
                                        EndTimeStamp?
                                        NotifyUsers?
                                        Triggers?
                                ;

syntax CreateSequence = createSequence: 'CREATE' OrReplace? 'SEQUENCE' IfNotExists? ObjectColumnNameOrIdentifier
                                'WITH'
                                StartWith?
                                IncrementBy?
                                OrderNoOrder?
                                CommentClause?
                        | createSequenceNoWith: 'CREATE' OrReplace? 'SEQUENCE' IfNotExists? ObjectColumnNameOrIdentifier
                                StartWith?
                                IncrementBy?
                                OrderNoOrder?
                                CommentClause?
                        ;

syntax CreateSessionPolicy = createSessionPolicy: 'CREATE' OrReplace? 'SESSION' 'POLICY' IfExists? Identifier
                                        SessionIdleTimeOut?
                                        SessionUIIdleTimeOut?
                                        CommentClause?
                                ;

syntax SessionIdleTimeOut = sessionIdleTimeOut: 'SESSION_IDLE_TIMEOUT_MINS' "=" Int;

syntax SessionUIIdleTimeOut = sessionUIIdleTimeOut: 'SESSION_UI_IDLE_TIMEOUT_MINS' "=" Int;

syntax CreateShare = createShare: 'CREATE' OrReplace? 'SHARE' Identifier CommentClause?;

syntax CreateTableAsSelect = createTableAsSelect: 'CREATE' OrReplace? TableType? 'TABLE' IfNotExistsObjectName
                                        ColumnDeclItemListWithBrackets?
                                        ClusterBy?
                                        CopyGrants?
                                        WithRowAccessPolicy?
                                        WithTags?
                                        CommentClause?
                                        'AS' Query
                                ;

syntax CreateTableLike = createTableLike: 'CREATE' OrReplace? 'TRANSIENT' 'TABLE' ObjectColumnNameOrIdentifier 'LIKE' ObjectColumnNameOrIdentifier
                                ClusterBy?
                                CopyGrants?
                        | createTableLikeNoTransient: 'CREATE' OrReplace? 'TABLE' ObjectColumnNameOrIdentifier 'LIKE' ObjectColumnNameOrIdentifier
                                ClusterBy?
                                CopyGrants?
                        ;


syntax CreateFunction = createFunctionOpt1: 'CREATE' OrReplace? 'FUNCTION' ObjectColumnNameOrIdentifier "(" ArgDataTypeList? ")"
                                'RETURNS' ReturnsType
                                NullNotNull?
                                'LANGUAGE' 'JAVASCRIPT'
                                CalledReturnsOrStrict?
                                VolatileOrImmutable?
                                CommentClause?
                                'AS' String
                        | createFunctionOpt2: 'CREATE' OrReplace? 'SECURE' 'FUNCTION' ObjectColumnNameOrIdentifier "(" ArgDataTypeList? ")"
                                'RETURNS' ReturnsType
                                NullNotNull?
                                'LANGUAGE' 'JAVASCRIPT'
                                CalledReturnsOrStrict?
                                VolatileOrImmutable?
                                CommentClause?
                                'AS' String
                        | createFunctionOpt3: 'CREATE' OrReplace? 'FUNCTION' ObjectColumnNameOrIdentifier "(" ArgDataTypeList? ")"
                                'RETURNS' ReturnsType
                                NullNotNull?
                                CalledReturnsOrStrict?
                                VolatileOrImmutable?
                                CommentClause?
                                'AS' String
                        | createFunctionOpt4: 'CREATE' OrReplace? 'FUNCTION' ObjectColumnNameOrIdentifier "(" ArgDataTypeList? ")"
                                'RETURNS' ReturnsType
                                NullNotNull?
                                CalledReturnsOrStrict?
                                VolatileOrImmutable?
                                'MEMOIZABLE'
                                CommentClause?
                                'AS' String
                        | createFunctionOpt5: 'CREATE' OrReplace? 'SECURE' 'FUNCTION' ObjectColumnNameOrIdentifier "(" ArgDataTypeList? ")"
                                'RETURNS' ReturnsType
                                NullNotNull?
                                CalledReturnsOrStrict?
                                VolatileOrImmutable?
                                CommentClause?
                                'AS' String
                        | createFunctionOpt6: 'CREATE' OrReplace? 'SECURE' 'FUNCTION' ObjectColumnNameOrIdentifier "(" ArgDataTypeList? ")"
                                'RETURNS' ReturnsType
                                NullNotNull?
                                CalledReturnsOrStrict?
                                VolatileOrImmutable?
                                'MEMOIZABLE'
                                CommentClause?
                                'AS' String
                        ;

syntax ReturnsType = returnsDataType: DataType 
                        | returnsTable: 'TABLE' "(" ColDeclList? ")"
                        ;

syntax CalledReturnsOrStrict = calledOnNull: 'CALLED' 'ON' 'NULL' 'INPUT' 
                                | returnsNull: 'RETURNS' 'NULL' 'ON' 'NULL' 'INPUT' 
                                | returnsStrict: 'STRICT'
                                ;

syntax ColDeclList = colDeclList: {ColDecl ","}+;

syntax CreateMaskingPolicy = createMaskingPolicy: 'CREATE' OrReplace? 'MASKING' 'POLICY' IfNotExists? ObjectColumnNameOrIdentifier 'AS'
                                        "(" ArgDataTypeList? ")"
                                        'RETURNS' Identifier "-\>" Exp
                                        CommentClause?
                                ;

syntax CreateMaterializedView = createMaterializedViewNoSecure: 'CREATE' OrReplace? 'MATERIALIZED' 'VIEW' IfNotExists? ObjectColumnNameOrIdentifier
                                        BracketColumnListWithComment?
                                        ViewCol*
                                        WithRowAccessPolicy?
                                        WithTags?
                                        CopyGrants?
                                        CommentClause?
                                        ClusterBy?
                                        'AS' SelectStatement
                                | createMaterializedViewSecure: 'CREATE' OrReplace? 'SECURE' 'MATERIALIZED' 'VIEW' IfNotExists? ObjectColumnNameOrIdentifier
                                        BracketColumnListWithComment?
                                        ViewCol*
                                        WithRowAccessPolicy?
                                        WithTags?
                                        CopyGrants?
                                        CommentClause?
                                        ClusterBy?
                                        'AS' SelectStatement
                                ;

syntax CreateView = createViewOpt1: 'CREATE' OrReplace? 'SECURE' 'RECURSIVE' 'VIEW' IfNotExists? ObjectColumnNameOrIdentifier
                                BracketColumnListWithComment?
                                ViewCol*
                                WithRowAccessPolicy?
                                WithTags?
                                CopyGrants?
                                CommentClause?
                                'AS' Query
                        | createViewOpt2: 'CREATE' OrReplace? 'VIEW' IfNotExists? ObjectColumnNameOrIdentifier
                                BracketColumnListWithComment?
                                ViewCol*
                                WithRowAccessPolicy?
                                WithTags?
                                CopyGrants?
                                CommentClause?
                                'AS' Query
                        | createViewOpt3: 'CREATE' OrReplace? 'RECURSIVE' 'VIEW' IfNotExists? ObjectColumnNameOrIdentifier
                                BracketColumnListWithComment?
                                ViewCol*
                                WithRowAccessPolicy?
                                WithTags?
                                CopyGrants?
                                CommentClause?
                                'AS' Query
                        | createViewOpt4: 'CREATE' OrReplace? 'SECURE' 'VIEW' IfNotExists? ObjectColumnNameOrIdentifier
                                BracketColumnListWithComment?
                                ViewCol*
                                WithRowAccessPolicy?
                                WithTags?
                                CopyGrants?
                                CommentClause?
                                'AS' Query
                        ;

syntax WhSize = sizeXsmall: 'XSMALL'
                | sizeSmall: 'SMALL'
                | sizeMedium: 'MEDIUM'
                | sizeLarge: 'LARGE'
                | sizeXlarge: 'XLARGE'
                | sizeXxlarge: 'XXLARGE'
                | sizeXxxlarge: 'XXXLARGE'
                | sizeX4large: 'X4LARGE'
                | sizeX5large: 'X5LARGE'
                | sizeX6large: 'X6LARGE'
                ;

syntax DropCommand = dropDatabaseCommand: DropDatabase
                    | dropAlertCommand: DropAlert
                    | dropConnectionCommand: DropConnection
                    | dropObjectCommand: DropObject
                    | dropRoleCommand: DropRole
                    | dropTableCommand: DropTable
                    | dropDynamicTableCommand: DropDynamicTable
                    | dropExternalTableCommand: DropExternalTable
                    | dropFailoverGroupCommand: DropFailoverGroup
                    | dropFileFormatCommand: DropFileFormat
                    | dropFunctionCommand: DropFunction
                    | dropIntegrationCommand: DropIntegration
                    | dropManagedAccountCommand: DropManagedAccount
                    | dropMaskingPolicyCommand: DropMaskingPolicy
                    | dropMaterializedViewsCommand: DropMaterializedViews
                    | dropPipeCommand: DropPipe
                    | dropReplicationGroupCommand: DropReplicationGroup
                    | dropResourceMonitorCommand: DropResourceMonitor
                    | dropShareCommand: DropShare
                    | dropTaskCommand: DropTask
                    | dropTagCommand: DropTag
                    | dropUserCommand: DropUser
                    | dropViewCommand: DropView
                    | dropWareHouseCommand: DropWareHouse
                    | dropNetworkPolicyCommand: DropNetworkPolicy
                    | dropProcedureCommand: DropProcedure
                    | dropRowAccessPolicyCommand: DropRowAccessPolicy
                    | dropSchemaCommand: DropSchema
                    | dropSequenceCommand: DropSequence
                    | dropSessionPolicyCommand: DropSessionPolicy
                    | dropStageCommand: DropStage
                    | dropStreamCommand: DropStream
                    ;

syntax DropDatabase = dropDatabase: 'DROP' 'DATABASE' IfExists? Identifier CascadeRestrict?;

syntax CascadeRestrict = cascadeRestrictOpt1: 'CASCADE'
                        | cascadeRestrictOpt2: 'RESTRICT'
                        ;

syntax DropAlert = dropAlert: 'DROP' 'ALERT' Identifier;

syntax DropConnection = dropConnection: 'DROP' 'CONNECTION' IfExists? Identifier;

syntax DropObject = dropObject: 'DROP' ObjectType IfExists Identifier CascadeRestrict?;

syntax DropRole = dropRole: 'DROP' 'ROLE' IfExists? Identifier;

syntax DropTable = dropTable: 'DROP' 'TABLE' IfExists? ObjectColumnNameOrIdentifier CascadeRestrict?;

syntax DropDynamicTable = dropDynamicTable: 'DROP' 'DYNAMIC' 'TABLE' Identifier;

syntax DropExternalTable = dropExternalTable: 'DROP' 'EXTERNAL' 'TABLE' IfExists? ObjectColumnNameOrIdentifier CascadeRestrict?;

syntax DropFailoverGroup = dropFailoverGroup: 'DROP' 'FAILOVER' 'GROUP' IfExists? Identifier;

syntax DropFileFormat = dropFileFormat: 'DROP' 'FILE' 'FORMAT' IfExists? Identifier;

syntax DropFunction = dropFunction: 'DROP' 'FUNCTION' IfExists? ObjectColumnNameOrIdentifier ArgTypes;

syntax ArgTypes = argTypes: "(" DataTypeList? ")";

syntax DropIntegration = dropIntegration: 'DROP' IntegrationsOptionals? 'INTEGRATION' IfExists? Identifier;

syntax IntegrationsOptionals = apiIntegrationsOpt: 'API' 
                                    | notificationIntegrationsOpt: 'NOTIFICATION' 
                                    | securityIntegrationsOpt: 'SECURITY' 
                                    | storageIntegrationsOpt: 'STORAGE'
                                    ;

syntax DropManagedAccount =  dropManagedAccount: 'DROP' 'MANAGED' 'ACCOUNT' Identifier;

syntax DropMaskingPolicy = dropMaskingPolicy: 'DROP' 'MASKING' 'POLICY' Identifier; 

syntax DropMaterializedViews = dropMaterializedViews: 'DROP' 'MATERIALIZED' 'VIEW' IfExists? ObjectColumnNameOrIdentifier;

syntax DropPipe = dropPipe: 'DROP' 'PIPE' IfExists? ObjectColumnNameOrIdentifier;

syntax DropReplicationGroup = dropReplicationGroup: 'DROP' 'REPLICATION' 'GROUP' IfExists? Identifier;

syntax DropResourceMonitor = dropResourceMonitor: 'DROP' 'RESOURCE' 'MONITOR' Identifier;

syntax DropShare = dropShare: 'DROP' 'SHARE' Identifier;

syntax DropTask = dropTask: 'DROP' 'TASK' IfExists? ObjectColumnNameOrIdentifier;

syntax DropTag = dropTag: 'DROP' 'TAG' IfExists? ObjectColumnNameOrIdentifier;

syntax DropUser = dropUser: 'DROP' 'USER' IfExists? Identifier;

syntax DropView = dropView: 'DROP' 'VIEW' IfExists? ObjectColumnNameOrIdentifier;

syntax DropWareHouse = dropWareHouse: 'DROP' 'WAREHOUSE' IfExists? IdentifierFn;

syntax DropNetworkPolicy = dropNetworkPolicy: 'DROP' 'NETWORK' 'POLICY' IfExists? Identifier;

syntax DropProcedure = dropProcedure: 'DROP' 'PROCEDURE' IfExists? ObjectColumnNameOrIdentifier ArgTypes;

syntax DropRowAccessPolicy = dropRowAccessPolicy: 'DROP' 'ROW' 'ACCESS' 'POLICY' IfExists? Identifier;

syntax DropSchema = dropSchema: 'DROP' 'SCHEMA' IfExists? Identifier CascadeRestrict?;

syntax DropSequence = dropSequence: 'DROP' 'SEQUENCE' IfExists? ObjectColumnNameOrIdentifier CascadeRestrict?;

syntax DropSessionPolicy = dropSessionPolicy: 'DROP' 'SESSION' 'POLICY' IfExists? Identifier;

syntax DropStage = dropStage: 'DROP' 'STAGE' IfExists? IdentifierType;

syntax DropStream = dropStream: 'DROP' 'STREAM' IfExists? ObjectColumnNameOrIdentifier;

syntax UndropCommand = undropDatabaseCommand: UndropDatabase
                        | undropSchemaCommand: UndropSchema
                        | undropTableCommand: UndropTable
                        | undropTagCommand: UndropTag
                        ;

syntax UndropDatabase = undropDatabase: 'UNDROP' 'DATABASE' Identifier;

syntax UndropSchema = undropSchema: 'UNDROP' 'SCHEMA' ObjectColumnNameOrIdentifier;

syntax UndropTable = undropTable: 'UNDROP' 'TABLE' ObjectColumnNameOrIdentifier;

syntax UndropTag = undropTag: 'UNDROP' 'TAG' ObjectColumnNameOrIdentifier;

syntax ShowCommand = showAlertsCommand: ShowAlerts
                    | showChannelsCommand: ShowChannels
                    | showColumnsCommand: ShowColumns
                    | showConnectionsCommand: ShowConnections
                    | showDatabasesCommand: ShowDatabases
                    | showDatabasesInFailoverGroupCommand: ShowDatabasesInFailoverGroup
                    | showDatabasesInReplicationGroupCommand: ShowDatabasesInReplicationGroup
                    | showDelegatedAuthorizationsCommand: ShowDelegatedAuthorizations
                    | showDynamicTablesCommand: ShowDynamicTables
                    | showEventTablesCommand: ShowEventTables
                    | showExternalFunctionsCommand: ShowExternalFunctions
                    | showExternalTablesCommand: ShowExternalTables
                    | showFailoverGroupsCommand: ShowFailoverGroups
                    | showFileFormatsCommand: ShowFileFormats
                    | showFunctionsCommand: ShowFunctions
                    | showGlobalAccountsCommand: ShowGlobalAccounts
                    | showGrantsCommand: ShowGrants
                    | showIntegrationsCommand: ShowIntegrations
                    | showLocksCommand: ShowLocks
                    | showManagedAccountsCommand: ShowManagedAccounts
                    | showMaskingPoliciesCommand: ShowMaskingPolicies
                    | showMaterializedViewsCommand: ShowMaterializedViews
                    | showNetworkPoliciesCommand: ShowNetworkPolicies
                    | showObjectsCommand: ShowObjects
                    | showOrganizationAccountsCommand: ShowOrganizationAccounts
                    | showParametersCommand: ShowParameters
                    | showPipesCommand: ShowPipes
                    | showPrimaryKeysCommand: ShowPrimaryKeys
                    | showProceduresCommand: ShowProcedures
                    | showRegionsCommand: ShowRegions
                    | showReplicationAccountsCommand: ShowReplicationAccounts
                    | showReplicationDatabasesCommand: ShowReplicationDatabases
                    | showReplicationGroupsCommand: ShowReplicationGroups
                    | showResourceMonitorsCommand: ShowResourceMonitors
                    | showRolesCommand: ShowRoles
                    | showRowAccessPoliciesCommand: ShowRowAccessPolicies
                    | showSchemasCommand: ShowSchemas
                    | showSequencesCommand: ShowSequences
                    | showSessionPoliciesCommand: ShowSessionPolicies
                    | showSharesCommand: ShowShares
                    | showSharesInFailoverGroupCommand: ShowSharesInFailoverGroup
                    | showSharesInReplicationGroupCommand: ShowSharesInReplicationGroup
                    | showStagesCommand: ShowStages
                    | showStreamsCommand: ShowStreams
                    | showTablesCommand: ShowTables
                    | showTagsCommand: ShowTags
                    | showTasksCommand: ShowTasks
                    | showTransactionsCommand: ShowTransactions
                    | showUserFunctionsCommand: ShowUserFunctions
                    | showUsersCommand: ShowUsers
                    | showVariablesCommand: ShowVariables
                    | showViewsCommand: ShowViews
                    | showWareHousesCommand: ShowWareHouses
                    ;

syntax ShowAlerts = showAlerts: 'SHOW' 'TERSE' 'ALERTS' LikePattern? InShowOptionals? StartsWith? LimitRows?
                        | showAlertsNoTerse: 'SHOW' 'ALERTS' LikePattern? InShowOptionals? StartsWith? LimitRows?
                        ;

syntax LikePattern = likePattern: 'LIKE' String;

syntax InShowOptionals = inShowOptionals: 'IN' ShowOptionals;

syntax ShowOptionals = accountIdShowOpt: 'ACCOUNT' Identifier?
                            | databaseIdShowOpt: 'DATABASE' Identifier? 
                            | tableNameShowOpt: 'TABLE' ObjectColumnNameOrIdentifier?
                            | viewNameShowOpt: 'VIEW' ObjectColumnNameOrIdentifier?
                            | schemaNameShowOpt: 'SCHEMA' ObjectColumnNameOrIdentifier?
                            | objNameShowOpt: ObjectColumnNameOrIdentifier
                            ;

syntax StartsWith = startsWith: 'STARTS' 'WITH' String;

syntax LimitRows = limitRows: 'LIMIT' Int FromString?;

syntax FromString = fromString: 'FROM' String;

syntax ShowChannels = showChannels: 'SHOW' 'CHANNELS' LikePattern? InShowOptionals?;

syntax ShowColumns = showColumns: 'SHOW' 'COLUMNS' LikePattern? InShowOptionals?;

syntax ShowConnections = showConnections: 'SHOW' 'CONNECTIONS' LikePattern?;

syntax ShowDatabases = showDatabasesOpt1: 'SHOW' 'TERSE' 'DATABASES' 'HISTORY' LikePattern? StartsWith? LimitRows?
                        | showDatabasesOpt2: 'SHOW' 'DATABASES' LikePattern? StartsWith? LimitRows?
                        | showDatabasesOpt3: 'SHOW' 'DATABASES' 'HISTORY' LikePattern? StartsWith? LimitRows?
                        | showDatabasesOpt4: 'SHOW' 'TERSE' 'DATABASES' LikePattern? StartsWith? LimitRows?
                        ;

syntax ShowDatabasesInFailoverGroup = showDatabasesInFailoverGroup: 'SHOW' 'DATABASES' 'IN' 'FAILOVER' 'GROUP' Identifier;

syntax ShowDatabasesInReplicationGroup = showDatabasesInReplicationGroup: 'SHOW' 'DATABASES' 'IN' 'REPLICATION' 'GROUP' Identifier;

syntax ShowDelegatedAuthorizations = showDelegatedAuthorizations: 'SHOW' 'DELEGATED' 'AUTHORIZATIONS'
                                    | showDelegatedAuthorizationsByUser: 'SHOW' 'DELEGATED' 'AUTHORIZATIONS' 'BY' 'USER' Identifier
                                    | showDelegatedAuthorizationsToSecurity: 'SHOW' 'DELEGATED' 'AUTHORIZATIONS' 'TO' 'SECURITY' 'INTEGRATION' Identifier
                                    ;

syntax ShowDynamicTables = showDynamicTables: 'SHOW' 'DYNAMIC' 'TABLES' LikePattern? InShowOptionals? StartsWith? LimitRows?;

syntax ShowEventTables = showEventTables: 'SHOW' 'TERSE' 'EVENT' 'TABLES' LikePattern? InShowOptionals? StartsWith? LimitRows?
                        | showEventTablesNoTerse: 'SHOW' 'EVENT' 'TABLES' LikePattern? InShowOptionals? StartsWith? LimitRows?
                        ;

syntax ShowExternalFunctions = showExternalFunctions: 'SHOW' 'EXTERNAL' 'FUNCTIONS' LikePattern?;

syntax ShowExternalTables = showExternalTables: 'SHOW' 'TERSE' 'EXTERNAL' 'TABLES' LikePattern? InShowOptionals? StartsWith? LimitRows?
                                | showExternalTablesNoTerse: 'SHOW' 'EXTERNAL' 'TABLES' LikePattern? InShowOptionals? StartsWith? LimitRows?
                                ;

syntax ShowFailoverGroups = showFailoverGroups: 'SHOW' 'FAILOVER' 'GROUPS' InShowOptionals?;

syntax ShowFileFormats = showFileFormats: 'SHOW' 'FILE' 'FORMATS' LikePattern? InShowOptionals?;

syntax ShowFunctions = showFunctions: 'SHOW' 'FUNCTIONS' LikePattern? InShowOptionals?;

syntax ShowGlobalAccounts = showGlobalAccounts: 'SHOW' 'GLOBAL' 'ACCOUNTS' LikePattern?;

syntax ShowGrants = showGrantsOptionals: 'SHOW' 'GRANTS' ShowGrantOptionals?
                    | showGrantsInSchema: 'SHOW' 'FUTURE' 'GRANTS' 'IN' 'SCHEMA' ObjectColumnNameOrIdentifier
                    | showGrantsInDatabase: 'SHOW' 'FUTURE' 'GRANTS' 'IN' 'DATABASE' Identifier
                    ;

syntax ShowGrantOptionals = onAccountShowGrantOpt: 'ON' 'ACCOUNT'
                            | onObjectNameShowGrantOpt: 'ON' ObjectType ObjectColumnNameOrIdentifier
                            | toRoleShareShowGrantOpt: 'TO' RoleUserOrShareId
                            | ofRoleShowGrantOpt: 'OF' 'ROLE' Identifier
                            | ofShareShowGrantOpt: 'OF' 'SHARE' Identifier
                            ;

syntax RoleUserOrShareId = roleId: 'ROLE' Identifier 
                            | userId: 'USER' Identifier 
                            | shareId: 'SHARE' Identifier
                            ;

syntax ShowIntegrations = showIntegrations: 'SHOW' IntegrationsOptionals? 'INTEGRATIONS' LikePattern?;

syntax ShowLocks = showLocks: 'SHOW' 'LOCKS' InAccount?;

syntax InAccount = inAccount: 'IN' 'ACCOUNT';

syntax ShowManagedAccounts = showManagedAccounts: 'SHOW' 'MANAGED' 'ACCOUNTS' LikePattern?;

syntax ShowMaskingPolicies = showMaskingPolicies: 'SHOW' 'MASKING' 'POLICIES'  LikePattern? InShowOptionals?;

syntax ShowMaterializedViews = showMaterializedViews: 'SHOW' 'MATERIALIZED' 'VIEWS' LikePattern? InShowOptionals?;

syntax ShowNetworkPolicies = showNetworkPolicies: 'SHOW' 'NETWORK' 'POLICIES';

syntax ShowObjects = showObjects: 'SHOW' 'OBJECTS' LikePattern? ShowOptionals?;

syntax ShowOrganizationAccounts = showOrganizationAccounts: 'SHOW' 'ORGANIZATION' 'ACCOUNTS' LikePattern?;

syntax ShowParameters = showParameters: 'SHOW' 'PARAMETERS' LikePattern? InOrForShowParameter?;

syntax InOrForShowParameter = inOrForShowParameter: InOrFor ShowParameterOptionals;

syntax InOrFor = inOrForOpt1: 'IN'
                | inOrForOpt2: 'FOR'
                ;
 
syntax ShowParameterOptionals = sessionShowParameterOpt: 'SESSION' 
                                | accountShowParameterOpt: 'ACCOUNT' 
                                | userIdShowParameterOpt: 'USER' Identifier? 
                                | paramObjShowParameterOpt: ShowParameterObjects 
                                | tableNameShowParameterOpt: 'TABLE' ObjectColumnNameOrIdentifier
                                ;

syntax ShowParameterObjects = warehouseIdShowParameterObj: 'WAREHOUSE' Identifier?
                                | databaseidShowParameterObj: 'DATABASE' Identifier?
                                | schemaIdShowParameterObj: 'SCHEMA' Identifier?
                                | taskIdShowParameterObj: 'TASK' Identifier?
                                ;

syntax ShowPipes = showPipes: 'SHOW' 'PIPES' LikePattern? InShowOptionals?;

syntax ShowPrimaryKeys = showPrimaryKeysNoTerse: 'SHOW' 'PRIMARY' 'KEYS' InShowOptionals?
                        | showPrimaryKeys:'SHOW' 'TERSE' 'PRIMARY' 'KEYS' InShowOptionals?
                        ;

syntax ShowProcedures = showProcedures: 'SHOW' 'PROCEDURES' LikePattern? InShowOptionals?;

syntax ShowRegions = showRegions: 'SHOW' 'REGIONS' LikePattern?;

syntax ShowReplicationAccounts = showReplicationAccounts: 'SHOW' 'REPLICATION' 'ACCOUNTS' LikePattern?;

syntax ShowReplicationDatabases = showReplicationDatabases: 'SHOW' 'REPLICATION' 'DATABASES' LikePattern? WithPrimaryColName?;

syntax WithPrimaryColName = withPrimaryColName: 'WITH' 'PRIMARY' ObjectColumnNameOrIdentifier;

syntax ShowReplicationGroups = showReplicationGroups: 'SHOW' 'REPLICATION' 'GROUPS' InShowOptionals?;

syntax ShowResourceMonitors = showResourceMonitors: 'SHOW' 'RESOURCE' 'MONITORS' LikePattern?;

syntax ShowRoles = showRoles: 'SHOW' 'ROLES' LikePattern?;

syntax ShowRowAccessPolicies = showRowAccessPolicies: 'SHOW' 'ROW' 'ACCESS' 'POLICIES' LikePattern? InShowOptionals?;

syntax ShowSchemas = showSchemasOpt1: 'SHOW' 'TERSE' 'SCHEMAS' LikePattern? InShowOptionals? StartsWith? LimitRows?
                        | showSchemasOpt2: 'SHOW' 'TERSE' 'SCHEMAS' 'HISTORY' LikePattern? InShowOptionals? StartsWith? LimitRows?
                        | showSchemasOpt3: 'SHOW' 'SCHEMAS' LikePattern? InShowOptionals? StartsWith? LimitRows?
                        | showSchemasOpt4: 'SHOW' 'SCHEMAS' 'HISTORY' LikePattern? InShowOptionals? StartsWith? LimitRows?
                        ;

syntax ShowSequences = showSequences: 'SHOW' 'SEQUENCES' LikePattern? InShowOptionals?;

syntax ShowSessionPolicies = showSessionPolicies: 'SHOW' 'SESSION' 'POLICIES';

syntax ShowShares = showShares: 'SHOW' 'SHARES' LikePattern?;

syntax ShowSharesInFailoverGroup = showSharesInFailoverGroup: 'SHOW' 'SHARES' 'IN' 'FAILOVER' 'GROUP' Identifier;

syntax ShowSharesInReplicationGroup = showSharesInReplicationGroup: 'SHOW' 'SHARES' 'IN' 'REPLICATION' 'GROUP' Identifier;


syntax ShowStages = showStages: 'SHOW' 'STAGES' LikePattern? InShowOptionals?;

syntax ShowStreams = showStreams: 'SHOW' 'STREAMS' LikePattern? InShowOptionals?;

syntax ShowTables = showTables: 'SHOW' 'TABLES' LikePattern? InShowOptionals?;

syntax ShowTags = showTags: 'SHOW' 'TAGS' LikePattern? ShowTagsOptionals?;

syntax ShowTagsOptionals = inAccountShowTagsOpt: InAccount
                            | databaseIdShowTagsOpt: 'DATABASE' Identifier?
                            | schemaIdShowTagsOpt: 'SCHEMA' Identifier?
                            | idShowTagsOpt: Identifier
                            ;

syntax ShowTasks = showTasks: 'SHOW' 'TERSE' 'TASKS' LikePattern? InShowOptionals? StartsWith? LimitRows?
                        | showTasksNoTerse: 'SHOW' 'TASKS' LikePattern? InShowOptionals? StartsWith? LimitRows?
                        ;

syntax ShowTransactions = showTransactions: 'SHOW' 'TRANSACTIONS' InAccount?;

syntax ShowUserFunctions = showUserFunctions: 'SHOW' 'USER' 'FUNCTIONS' LikePattern? InShowOptionals?;

syntax ShowUsers = showUsers: 'SHOW' 'TERSE' 'USERS' LikePattern? StartsWith? LimitInt? FromString?
                        | showUsersNoTerse: 'SHOW' 'USERS' LikePattern? StartsWith? LimitInt? FromString?
                        ;

syntax LimitInt = limitInt: 'LIMIT' Int;

syntax ShowVariables = showVariables: 'SHOW' 'VARIABLES' LikePattern?;

syntax ShowViews = showViews: 'SHOW' 'TERSE' 'VIEWS' LikePattern? InShowOptionals? StartsWith? LimitRows?
                        | showViewsNoTerse: 'SHOW' 'VIEWS' LikePattern? InShowOptionals? StartsWith? LimitRows?
                        ;

syntax ShowWareHouses = showWareHouses: 'SHOW' 'WAREHOUSES' LikePattern?;

syntax UseCommand = useDatabaseCommand: UseDatabase
                    | useRoleCommand: UseRole
                    | useSchemaCommand: UseSchema
                    | useSecondaryRolesCommand: UseSecondaryRoles
                    | useWarehouseCommand: UseWarehouse
                    ;

syntax UseDatabase = useDatabase: 'USE' 'DATABASE' Identifier;

syntax UseRole = useRole: 'USE' 'ROLE' Identifier;

syntax UseSchema = useSchema: 'USE' 'SCHEMA' ObjectColumnNameOrIdentifier
                        | useNoSchema: 'USE' ObjectColumnNameOrIdentifier
                        ;

syntax UseSecondaryRoles = useSecondaryRoles: 'USE' 'SECONDARY' 'ROLES' AllOrNone;

syntax AllOrNone = allOrNoneOpt1: 'ALL' 
                | allOrNoneOpt2: 'NONE'
                ;

syntax UseWarehouse = useWarehouse: 'USE' 'WAREHOUSE' IdentifierFn;

syntax DescribeCommand = describeAlertCommand: DescribeAlert
                        | describeDatabaseCommand: DescribeDatabase
                        | describeDynamicTableCommand: DescribeDynamicTable
                        | describeEventTableCommand: DescribeEventTable
                        | describeExternalTableCommand: DescribeExternalTable
                        | describeFileFormatCommand: DescribeFileFormat
                        | describeFunctionCommand: DescribeFunction
                        | describeIntegrationCommand: DescribeIntegration
                        | describeMaskingPolicyCommand: DescribeMaskingPolicy
                        | describeMaterializedViewCommand: DescribeMaterializedView
                        | describeNetworkPolicyCommand: DescribeNetworkPolicy
                        | describePipeCommand: DescribePipe
                        | describeProcedureCommand: DescribeProcedure
                        | describeResultCommand: DescribeResult
                        | describeRowAccessPolicyCommand: DescribeRowAccessPolicy
                        | describeSchemaCommand: DescribeSchema
                        | describeSearchOptimizationCommand: DescribeSearchOptimization
                        | describeSequenceCommand: DescribeSequence
                        | describeSessionPolicyCommand: DescribeSessionPolicy
                        | describeShareCommand: DescribeShare
                        | describeStageCommand: DescribeStage
                        | describeStreamCommand: DescribeStream
                        | describeTableCommand: DescribeTable
                        | describeTaskCommand: DescribeTask
                        | describeTransactionCommand: DescribeTransaction
                        | describeUserCommand: DescribeUser
                        | describeViewCommand: DescribeView
                        | describeWareHouseCommand: DescribeWareHouse
                        ;

syntax DescribeAlert = describeAlert: Describe 'ALERT' Identifier;

syntax Describe = describeOpt1: 'DESC'
                | describeOpt2: 'DESCRIBE'
                ;

syntax DescribeDatabase = describeDatabase: Describe 'DATABASE' Identifier;

syntax DescribeDynamicTable = describeDynamicTable: Describe 'DYNAMIC' 'TABLE' Identifier;

syntax DescribeEventTable = describeEventTable: Describe 'EVENT' 'TABLE' Identifier;

syntax DescribeExternalTable = describeExternalTable: Describe 'EXTERNAL' 'TABLE' ObjectColumnNameOrIdentifier DescribeTableType?;

syntax DescribeTableType = describeTypeColumns: 'TYPE' "=" 'COLUMNS' 
                            | describeTypeStage: 'TYPE' "=" 'STAGE'
                            ;

syntax DescribeFileFormat = describeFileFormat: Describe 'FILE' 'FORMAT' Identifier;

syntax DescribeFunction = describeFunction: Describe 'FUNCTION' ObjectColumnNameOrIdentifier ArgTypes;

syntax DescribeIntegration = describeIntegration: Describe IntegrationsOptionals? 'INTEGRATION' Identifier;

syntax DescribeMaskingPolicy = describeMaskingPolicy: Describe 'MASKING' 'POLICY' Identifier;

syntax DescribeMaterializedView = describeMaterializedView: Describe 'MATERIALIZED' 'VIEW' ObjectColumnNameOrIdentifier;

syntax DescribeNetworkPolicy = describeNetworkPolicy: Describe 'NETWORK' 'POLICY' Identifier;

syntax DescribePipe = describePipe: Describe 'PIPE' ObjectColumnNameOrIdentifier;

syntax DescribeProcedure = describeProcedure: Describe 'PROCEDURE' ObjectColumnNameOrIdentifier ArgTypes;

syntax DescribeResult = describeResultStr: Describe 'RESULT' String 
                        | describeResultLastQuery: Describe 'RESULT' 'LAST_QUERY_ID' "(" ")"
                        ;

syntax DescribeRowAccessPolicy = describeRowAccessPolicy: Describe 'ROW' 'ACCESS' 'POLICY' Identifier;

syntax DescribeSchema = describeSchema: Describe 'SCHEMA' ObjectColumnNameOrIdentifier;

syntax DescribeSearchOptimization = describeSearchOptimization: Describe 'SEARCH' 'OPTIMIZATION' 'ON' ObjectColumnNameOrIdentifier;

syntax DescribeSequence = describeSequence: Describe 'SEQUENCE' ObjectColumnNameOrIdentifier;

syntax DescribeSessionPolicy = describeSessionPolicy: Describe 'SESSION' 'POLICY' Identifier;

syntax DescribeShare = describeShare: Describe 'SHARE' Identifier;

syntax DescribeStage = describeStage: Describe 'STAGE' IdentifierFn;

syntax DescribeStream = describeStream: Describe 'STREAM' ObjectColumnNameOrIdentifier;

syntax DescribeTable = describeTable: Describe 'TABLE' ObjectColumnNameOrIdentifier DescribeTableType?;

syntax DescribeTask = describeTask: Describe 'TASK' ObjectColumnNameOrIdentifier;

syntax DescribeTransaction = describeTransaction: Describe 'TRANSACTION' Int;

syntax DescribeUser = describeUser: Describe 'USER' Identifier;

syntax DescribeView = describeView: Describe 'VIEW' ObjectColumnNameOrIdentifier;

syntax DescribeWareHouse = describeWareHouse: Describe 'WAREHOUSE' Identifier;

syntax Call = callClause: 'CALL' ObjectColumnNameOrIdentifier "(" ExpList? ")";

syntax OtherCommand = copyIntoTableCommand: CopyIntoTable
                    | beginTransactionCommand: BeginTransaction
                    | copyIntoLocationCommand: CopyIntoLocation
                    | commentCommand: Comment
                    | commitCommand: Commit
                    | executeImmediateCommand: ExecuteImmediate
                    | executeTaskCommand: ExecuteTask
                    | getDMLCommand: GetDML
                    | listCommand: List
                    | removeCommand: Remove
                    | setCommand: Set
                    | unsetCommand: Unset
                    | truncateTableCommand: TruncateTable
                    | truncateMaterializedViewCommand: TruncateMaterializedView
                    | revokeRoleCommand: RevokeRole
                    | callCommand: Call
                    | putCommand: Put
                    | rollbackCommand: Rollback
                    ;

syntax BeginTransaction = beginTransaction: 'BEGIN' WorkOrTransaction? NameId?
                        | startTransaction: 'START' 'TRANSACTION' NameId?
                        ;

syntax WorkOrTransaction = workOrTransactionOpt1: 'WORK'
                            | workOrTransactionOpt2: 'TRANSACTION'
                            ;

syntax NameId = nameId: 'NAME' Identifier;

syntax CopyIntoLocation = copyIntoLocation: 'COPY' 'INTO' InternalOrExternalStage
                                'FROM' ObjectNameOrQuery
                                PartitionBy?
                                FileFormat?
                                CopyOptions?
                                ValidationMode?
                                'HEADER'
                        | copyIntoLocationNoHeader: 'COPY' 'INTO' InternalOrExternalStage
                                'FROM' ObjectNameOrQuery
                                PartitionBy?
                                FileFormat?
                                CopyOptions?
                                ValidationMode?
                        ;

syntax ObjectNameOrQuery = objectNameOrQueryOpt1: ObjectColumnNameOrIdentifier
                            | objectNameOrQueryOpt2: "(" Query ")"
                            ;

syntax Comment = commentFuncSignature: 'COMMENT' IfExists? 'ON' ObjectTypeName ObjectColumnNameOrIdentifier ArgTypes? 'IS' String
                | commentColumn: 'COMMENT' IfExists? 'ON' 'COLUMN' ObjectColumnNameOrIdentifier 'IS' String
                ;

syntax ObjectTypeName = roleObjectTypeName: 'ROLE'
                        | userObjectTypeName: 'USER'
                        | warehouseObjectTypeName: 'WAREHOUSE'
                        | integrationObjectTypeName: 'INTEGRATION'
                        | networkObjectTypeName: 'NETWORK' 'POLICY'
                        | sessionObjectTypeName: 'SESSION' 'POLICY'
                        | databaseObjectTypeName: 'DATABASE'
                        | schemaObjectTypeName: 'SCHEMA'
                        | tableObjectTypeName: 'TABLE'
                        | viewObjectTypeName: 'VIEW'
                        | stageObjectTypeName: 'STAGE'
                        | fileFormatObjectTypeName: 'FILE' 'FORMAT'
                        | streamObjectTypeName: 'STREAM'
                        | taskObjectTypeName: 'TASK'
                        | maskingObjectTypeName: 'MASKING' 'POLICY'
                        | rowAccessObjectTypeName: 'ROW' 'ACCESS' 'POLICY'
                        | tagObjectTypeName: 'TAG'
                        | pipeObjectTypeName: 'PIPE'
                        | functionObjectTypeName: 'FUNCTION'
                        | procedureObjectTypeName: 'PROCEDURE'
                        | sequenceObjectTypeName: 'SEQUENCE'
                        ;

syntax Commit = commitClause: 'COMMIT' 'WORK'
                | commitClauseNoWork: 'COMMIT'
                ;

syntax ExecuteImmediate = executeImmediateId: 'EXECUTE' 'IMMEDIATE' StringId UsingColumnList?;

syntax StringId = stringIdOpt1: String 
                | stringIdOpt2: Identifier
                ;

syntax ExecuteTask = executeTask: 'EXECUTE' 'TASK' ObjectColumnNameOrIdentifier;

syntax GetDML = getDML: 'GET' InternalOrExternalStage FilePath Parallel? Pattern?;

syntax Parallel = parallelClause: 'PARALLEL' "=" Int;

syntax List = listClause: 'LIST' InternalOrExternalStage Pattern?;

syntax Remove = removeClause: 'REMOVE' InternalOrExternalStage Pattern?;

syntax Set =  setId: 'SET' Identifier "=" Exp
            | setCols: 'SET' ColumnListWithBrackets "=" ExpListWithBrackets
            ;

syntax Unset = unsetId: 'UNSET' Identifier
                | unsetCols: 'UNSET' ColumnListWithBrackets
                ;

syntax TruncateTable = truncateTable: 'TRUNCATE' 'TABLE' IfExists? ObjectColumnNameOrIdentifier
                        | truncateTableNoTable: 'TRUNCATE' IfExists? ObjectColumnNameOrIdentifier
                        ;

syntax TruncateMaterializedView = truncateMaterializedView: 'TRUNCATE' 'MATERIALIZED' 'VIEW' ObjectColumnNameOrIdentifier;

syntax RevokeRole = revokeRole: 'REVOKE' 'ROLE' RoleName 'FROM' RoleOrUser;

syntax RoleName = systemDefinedRoleName: SystemDefinedRole
                | idRoleName: Identifier
                ;

syntax RoleOrUser = roleOrUserOpt1: 'ROLE' RoleName 
                    | roleOrUserOpt2: 'USER' Identifier
                    ;

syntax SystemDefinedRole = orgAdminDefinedRole: 'ORGADMIN'
                            | accountAdminDefinedRole: 'ACCOUNTADMIN'
                            | securityAdminDefinedRole: 'SECURITYADMIN'
                            | userAdminDefinedRole: 'USERADMIN'
                            | sysAdminDefinedRole: 'SYSADMIN'
                            | publicDefinedRole: 'PUBLIC'
                            ;

syntax Put = put: 'PUT' FilePath InternalOrExternalStage
                        Parallel?
                        AutoCompress?
                        SourceCompression?
                        OverWrite?
                ;

syntax AutoCompress = autoCompress: 'AUTO_COMPRESS' "=" Boolean;

syntax SourceCompression = sourceCompression: 'SOURCE_COMPRESSION' "=" CompressionType;

syntax OverWrite = overWrite: 'OVERWRITE' "=" Boolean;

syntax FilePath = filePath1: "file://" "/" Uri 
                | filePath2: "file://" WindowsPath
                ;

syntax Rollback = rollback: 'ROLLBACK' 'WORK'
                | rollbackNoWork: 'ROLLBACK'
                ;