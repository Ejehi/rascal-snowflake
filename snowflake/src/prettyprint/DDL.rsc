module prettyprint::DDL

extend prettyprint::DML;

import ast::SnowFlake;

import List;

// DDL

public str prettySnowFlake(DDL::alterCommand(AlterCommand alterCmd)) = "<prettySnowFlake(alterCmd)>";

public str prettySnowFlake(DDL::createCommand(CreateCommand createCmd)) = "<prettySnowFlake(createCmd)>";

public str prettySnowFlake(DDL::dropCommand(DropCommand dropCmd)) = "<prettySnowFlake(dropCmd)>";

public str prettySnowFlake(DDL::undropCommand(UndropCommand undropCmd)) = "<prettySnowFlake(undropCmd)>";

public str prettySnowFlake(DDL::showCommand(ShowCommand showCmd)) = "<prettySnowFlake(showCmd)>";

public str prettySnowFlake(DDL::useCommand(UseCommand useCmd)) = "<prettySnowFlake(useCmd)>";

public str prettySnowFlake(DDL::describeCommand(DescribeCommand describeCmd)) = "<prettySnowFlake(describeCmd)>";

public str prettySnowFlake(DDL::otherCommand(OtherCommand otherCmd)) = "<prettySnowFlake(otherCmd)>";


// Alter Command

public str prettySnowFlake(AlterCommand::alterAccountCommand(AlterAccount alterAccountCmd)) = "<prettySnowFlake(alterAccountCmd)>";

public str prettySnowFlake(AlterCommand::alterTableCommand(AlterTable alterTableCmd)) = "<prettySnowFlake(alterTableCmd)>";

public str prettySnowFlake(AlterCommand::alterSessionCommand(AlterSession alterSessionCmd)) = "<prettySnowFlake(alterSessionCmd)>";

public str prettySnowFlake(AlterCommand::alterDatabaseCommand(AlterDatabase alterDatabaseCmd)) = "<prettySnowFlake(alterDatabaseCmd)>";

public str prettySnowFlake(AlterCommand::alterConnectionCommand(AlterConnection alterConnectionCmd)) = "<prettySnowFlake(alterConnectionCmd)>";

public str prettySnowFlake(AlterCommand::alterAlertCommand(AlterAlert alterAlertCmd)) = "<prettySnowFlake(alterAlertCmd)>";

public str prettySnowFlake(AlterCommand::alterUserCommand(AlterUser alterUserCmd)) = "<prettySnowFlake(alterUserCmd)>";

public str prettySnowFlake(AlterCommand::alterTagCommand(AlterTag alterTagCmd)) = "<prettySnowFlake(alterTagCmd)>";

public str prettySnowFlake(AlterCommand::alterSchemaCommand(AlterSchema alterSchemaCmd)) = "<prettySnowFlake(alterSchemaCmd)>";

public str prettySnowFlake(AlterCommand::alterRoleCommand(AlterRole alterRoleCmd)) = "<prettySnowFlake(alterRoleCmd)>";

public str prettySnowFlake(AlterCommand::alterRowAccessPolicyCommand(AlterRowAccessPolicy alterRowAccessPolicyCmd)) = "<prettySnowFlake(alterRowAccessPolicyCmd)>";

public str prettySnowFlake(AlterCommand::alterProcedureCommand(AlterProcedure alterProcedureCmd)) = "<prettySnowFlake(alterProcedureCmd)>";

public str prettySnowFlake(AlterCommand::alterNetworkPolicyCommand(AlterNetworkPolicy alterNetworkPolicyCmd)) = "<prettySnowFlake(alterNetworkPolicyCmd)>";

public str prettySnowFlake(AlterCommand::alterApiIntegrationCommand(AlterApiIntegration alterApiIntegrationCmd)) = "<prettySnowFlake(alterApiIntegrationCmd)>";

public str prettySnowFlake(AlterCommand::alterDynamicTableCommand(AlterDynamicTable alterDynamicTableCmd)) = "<prettySnowFlake(alterDynamicTableCmd)>";

public str prettySnowFlake(AlterCommand::alterFailoverGroupCommand(AlterFailoverGroup alterFailoverGroupCmd)) = "<prettySnowFlake(alterFailoverGroupCmd)>";

public str prettySnowFlake(AlterCommand:alterFileFormatCommand(AlterFileFormat alterFileFormatCmd)) = "<prettySnowFlake(alterFileFormatCmd)>";

public str prettySnowFlake(AlterCommand::alterWareHouseCommand(AlterWareHouse alterWareHouseCmd)) = "<prettySnowFlake(alterWareHouseCmd)>";

public str prettySnowFlake(AlterCommand::alterFunctionCommand(AlterFunction alterFunctionCmd)) = "<prettySnowFlake(alterFunctionCmd)>";

public str prettySnowFlake(AlterCommand::alterViewCommand(AlterView alterViewCmd)) = "<prettySnowFlake(alterViewCmd)>";

public str prettySnowFlake(AlterCommand::alterMaskingPolicyCommand(AlterMaskingPolicy alterMaskingPolicyCmd)) = "<prettySnowFlake(alterMaskingPolicyCmd)>";

public str prettySnowFlake(AlterCommand::alterMaterializedViewCommand(AlterMaterializedView alterMaterializedViewCmd)) = "<prettySnowFlake(alterMaterializedViewCmd)>";

public str prettySnowFlake(AlterCommand::alterPipeCommand(AlterPipe alterPipeCmd)) = "<prettySnowFlake(alterPipeCmd)>";

public str prettySnowFlake(AlterCommand::alterNotificationIntegrationCommand(AlterNotificationIntegration alterNotificationIntegrationCmd)) = "<prettySnowFlake(alterNotificationIntegrationCmd)>";

public str prettySnowFlake(AlterCommand::alterExternalTableCommand(AlterExternalTable alterExternalTableCmd)) = "<prettySnowFlake(alterExternalTableCmd)>";

public str prettySnowFlake(AlterCommand::alterResourceMonitorCommand(AlterResourceMonitor alterResourceMonitorCmd)) = "<prettySnowFlake(alterResourceMonitorCmd)>";

public str prettySnowFlake(AlterCommand::alterSequenceCommand(AlterSequence alterSequenceCmd)) = "<prettySnowFlake(alterSequenceCmd)>";

public str prettySnowFlake(AlterAccount::alterAccount(AlterAccountOpts alterAccountOpts)) = "ALTER ACCOUNT <prettySnowFlake(alterAccountOpts)>";

public str prettySnowFlake(AlterAccountOpts::setAccountOpts(list[AccountParams] accountParamsList, list[ObjectParams] objectParamsList, list[SessionParams] sessionParamsList)) = "SET <for(accountParams <- accountParamsList) {><prettySnowFlake(accountParams)><}> <for(objectParams <- objectParamsList) {><prettySnowFlake(objectParams)><}> <for(sessionParams <- sessionParamsList) {><prettySnowFlake(sessionParams)><}>";

public str prettySnowFlake(AlterAccountOpts::unsetAccountOpts(list[Identifier] idList)) = "UNSET <intercalate(", ", [ prettySnowFlake(id) | id <- idList ])>";

public str prettySnowFlake(AlterAccountOpts::resourceMonitorAccountOpts(Identifier id)) = "SET RESOURCE_MONITOR = <prettySnowFlake(id)>";

public str prettySnowFlake(AlterAccountOpts::setTagsAccountOpts(SetTags setTags)) = "<prettySnowFlake(setTags)>";

public str prettySnowFlake(AlterAccountOpts::unsetTagsAccountOpts(UnsetTags unsetTags)) = "<prettySnowFlake(unsetTags)>";

public str prettySnowFlake(AlterAccountOpts::dropUrlAccountOpts(Identifier id)) = "<prettySnowFlake(id)> DROP OLD URL";

public str prettySnowFlake(AlterAccountOpts::saveUrlAccountOpts(Identifier id1, Identifier id2, list[SaveOldUrl] saveOldUrlList)) = "<prettySnowFlake(id1)> RENAME TO <prettySnowFlake(id2)> <for(saveOldUrl <- saveOldUrlList) {><prettySnowFlake(saveOldUrl)><}>";

public str prettySnowFlake(AccountParams::allowIdTokenParam(Boolean boolVal)) = "ALLOW_ID_TOKEN = <prettySnowFlake(boolVal)>";

public str prettySnowFlake(AccountParams::clientEncryptionParam(Number number)) = "CLIENT_ENCRYPTION_KEY_SIZE = <prettySnowFlake(number)>";

public str prettySnowFlake(AccountParams::enforceSessionParam(Boolean boolVal)) = "ENFORCE_SESSION_POLICY =<prettySnowFlake(boolVal)>";

public str prettySnowFlake(AccountParams::externalOauthParam(Boolean boolVal)) = "EXTERNAL_OAUTH_ADD_PRIVILEGED_ROLES_TO_BLOCKED_LIST = <prettySnowFlake(boolVal)>";

public str prettySnowFlake(AccountParams::replicationParam(Number number)) = "INITIAL_REPLICATION_SIZE_LIMIT_IN_TB = <prettySnowFlake(number)>";

public str prettySnowFlake(AccountParams::networkParam(String string)) = "NETWORK_POLICY = <prettySnowFlake(string)>";

public str prettySnowFlake(ObjectParams::retentionTimeParam(Number number)) = "DATA_RETENTION_TIME_IN_DAYS = <prettySnowFlake(number)>";

public str prettySnowFlake(ObjectParams::extentionTimeParam(Number number)) = "MAX_DATA_EXTENSION_TIME_IN_DAYS = <prettySnowFlake(number)>";

public str prettySnowFlake(ObjectParams::concurrencyLevelParam(Number number)) = "MAX_CONCURRENCY_LEVEL = <prettySnowFlake(number)>";

public str prettySnowFlake(ObjectParams::networkPolicyParam(String string)) = "NETWORK_POLICY = <prettySnowFlake(string)>";

public str prettySnowFlake(ObjectParams::pipeExecutionParam(Boolean boolVal)) = "PIPE_EXECUTION_PAUSED = <prettySnowFlake(boolVal)>";

public str prettySnowFlake(ObjectParams::sessionPolicyParam(String string)) = "SESSION_POLICY = <prettySnowFlake(string)>";

public str prettySnowFlake(SessionParams::abortDetachedParam(Boolean boolVal)) = "ABORT_DETACHED_QUERY = <prettySnowFlake(boolVal)>";

public str prettySnowFlake(SessionParams::autoCommitParam(Boolean boolVal)) = "AUTOCOMMIT = <prettySnowFlake(boolVal)>";

public str prettySnowFlake(SessionParams::binaryInputParam(String string)) = "BINARY_INPUT_FORMAT = <prettySnowFlake(string)>";

public str prettySnowFlake(SessionParams::dateInputParam(String string)) = "DATE_INPUT_FORMAT = <prettySnowFlake(string)>";

public str prettySnowFlake(SessionParams::lockTimeOutParam(Number number)) = "LOCK_TIMEOUT = <prettySnowFlake(number)>";

public str prettySnowFlake(SessionParams::timeZoneParam(String string)) = "TIMEZONE = <prettySnowFlake(string)>";

public str prettySnowFlake(SessionParams::timeStampInputParam(String string)) = "TIMESTAMP_INPUT_FORMAT = <prettySnowFlake(string)>";

public str prettySnowFlake(SessionParams::timeStampLtzParam(String string)) = "TIMESTAMP_LTZ_OUTPUT_FORMAT = <prettySnowFlake(string)>";

public str prettySnowFlake(SessionParams::timeStampNtzParam(String string)) = "TIMESTAMP_NTZ_OUTPUT_FORMAT = <prettySnowFlake(string)>";

public str prettySnowFlake(SetTags::setTags(TagDeclList tagDeclList)) = "SET <prettySnowFlake(tagDeclList)>";

public str prettySnowFlake(UnsetTags::unsetTags(list[ObjectColumnNameOrIdentifier] objNameOrIdList)) = "UNSET TAG <intercalate(", ", [ prettySnowFlake(objNameOrId) | objNameOrId <- objNameOrIdList ])>";

public str prettySnowFlake(TagDeclList::tagDeclList(list[TagDecl] tagDeclList)) = "TAG <intercalate(", ", [ prettySnowFlake(tagDecl) | tagDecl <- tagDeclList ])>";

public str prettySnowFlake(TagDecl::tagDecl(ObjectColumnNameOrIdentifier objNameOrId, String string)) = "<prettySnowFlake(objNameOrId)> = <prettySnowFlake(string)>";

public str prettySnowFlake(SaveOldUrl::saveOldUrl(Boolean boolVal)) = "SAVE_OLD_URL = <prettySnowFlake(boolVal)>";

public str prettySnowFlake(AlterTable::alterTableRename(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId1, ObjectColumnNameOrIdentifier objNameOrId2)) = "ALTER TABLE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId1)> RENAME TO <prettySnowFlake(objNameOrId2)>";

public str prettySnowFlake(AlterTable::alterTableSetTags(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, SetTags setTags)) = "ALTER TABLE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> <prettySnowFlake(setTags)>";

public str prettySnowFlake(AlterTable::alterTableUnsetTags(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, UnsetTags unsetTags)) = "ALTER TABLE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> <prettySnowFlake(unsetTags)>";

public str prettySnowFlake(AlterTable::alterTableSwapWith(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId1, ObjectColumnNameOrIdentifier objNameOrId2)) = "ALTER TABLE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId1)> SWAP WITH <prettySnowFlake(objNameOrId2)>";

public str prettySnowFlake(AlterTable::alterTableDropRow(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, Identifier id)) = "ALTER TABLE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> DROP ROW ACCESS POLICY <prettySnowFlake(id)>";

public str prettySnowFlake(IfExists::ifExists()) = "IF EXISTS";

public str prettySnowFlake(AlterSession::alterSessionSet(SessionParams sessionParams)) = "ALTER SESSION SET <prettySnowFlake(sessionParams)>";

public str prettySnowFlake(AlterSession::alterSessionUnset(list[Identifier] idList)) = "ALTER SESSION UNSET <intercalate(", ", [ prettySnowFlake(id) | id <- idList ])>";

public str prettySnowFlake(AlterDatabase::alterDatabaseRename(list[IfExists] ifExistsList, Identifier id1, Identifier id2)) = "ALTER DATABASE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id1)> RENAME TO <prettySnowFlake(id2)>";

public str prettySnowFlake(AlterDatabase::alterDatabaseSwap(list[IfExists] ifExistsList, Identifier id1, Identifier id2)) = "ALTER DATABASE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id1)> SWAP WITH <prettySnowFlake(id2)>";

public str prettySnowFlake(AlterDatabase::alterDatabaseSetTags(Identifier id, SetTags setTags)) = "ALTER DATABASE <prettySnowFlake(id)> <prettySnowFlake(setTags)>";

public str prettySnowFlake(AlterDatabase::alterDatabaseUnsetTags(Identifier id, UnsetTags unsetTags)) = "ALTER DATABASE <prettySnowFlake(id)> <prettySnowFlake(unsetTags)>";

public str prettySnowFlake(AlterDatabase::alterDatabaseRefresh(Identifier id)) = "ALTER DATABASE <prettySnowFlake(id)> REFRESH";

public str prettySnowFlake(AlterDatabase::alterDatabaseProperty(list[IfExists] ifExistsList, Identifier id, list[DatabaseOrSchemaProperty] databaseOrSchemaPropertyList)) = "ALTER DATABASE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> UNSET <intercalate(", ", [ prettySnowFlake(databaseOrSchemaProperty) | databaseOrSchemaProperty <- databaseOrSchemaPropertyList ])>";

public str prettySnowFlake(DatabaseOrSchemaProperty::dataRetentionTimeProp(DataRetentionTimeEqInt dataRetentionTimeEqInt)) = "<prettySnowFlake(dataRetentionTimeEqInt)>";

public str prettySnowFlake(DatabaseOrSchemaProperty::maxDataExtentionTimeProp(MaxDataExtentionTimeEqInt maxDataExtentionTimeEqInt)) = "<prettySnowFlake(maxDataExtentionTimeEqInt)>";

public str prettySnowFlake(DatabaseOrSchemaProperty::defaultDdlCollationProp(DefaultDdlCollation defaultDdlCollation)) = "<prettySnowFlake(defaultDdlCollation)>";

public str prettySnowFlake(DatabaseOrSchemaProperty::commentDatabaseOrSchemaProperty()) = "COMMENT";

public str prettySnowFlake(DataRetentionTimeEqInt::dataRetentionTimeEqInt(str integer)) = "DATA_RETENTION_TIME_IN_DAYS = <integer>";

public str prettySnowFlake(MaxDataExtentionTimeEqInt::maxDataExtentionTimeEqInt(str integer)) = "MAX_DATA_EXTENSION_TIME_IN_DAYS = <integer>";

public str prettySnowFlake(DefaultDdlCollation::defaultDdlCollation(String string)) = "DEFAULT_DDL_COLLATION = <prettySnowFlake(string)>";

public str prettySnowFlake(AlterConnection::alterConnection(AlterConnectionOptions alterConnectionOptions)) = "ALTER CONNECTION <prettySnowFlake(alterConnectionOptions)>";

public str prettySnowFlake(AlterConnectionOptions::alterConnectionPrimary(Identifier id)) = "<prettySnowFlake(id)> PRIMARY";

public str prettySnowFlake(AlterConnectionOptions::alterConnectionSet(list[IfExists] ifExistsList, Identifier id, CommentClause commentClause)) = "<for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> SET <prettySnowFlake(commentClause)>";

public str prettySnowFlake(AlterConnectionOptions::alterConnectionUnset(list[IfExists] ifExistsList, Identifier id)) = "<for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> UNSET COMMENT";

public str prettySnowFlake(CommentClause::commentClause(String string)) = "COMMENT = <prettySnowFlake(string)>";

public str prettySnowFlake(AlterAlert::alterAlterResumeSuspend(list[IfExists] ifExistsList, Identifier id, ResumeSuspend resumeSuspend)) = "ALTER ALERT <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> <prettySnowFlake(resumeSuspend)>";

public str prettySnowFlake(AlterAlert::alterAlterSet(list[IfExists] ifExistsList, Identifier id, list[AlertSetClause] alertSetClauseList)) = "ALTER ALERT <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> SET <for(alertSetClause <- alertSetClauseList) {><prettySnowFlake(alertSetClause)> <}>";

public str prettySnowFlake(AlterAlert::alterAlterUnset(list[IfExists] ifExistsList, Identifier id, list[AlertUnSetClause] alertUnSetClauseList)) = "ALTER ALERT <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> UNSET <for(alertUnSetClause <- alertUnSetClauseList) {><prettySnowFlake(alertUnSetClause)> <}>";

public str prettySnowFlake(AlterAlert::alterAlterModify(list[IfExists] ifExistsList, Identifier id, AlertCondition alertCondition)) = "ALTER ALERT <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> MODIFY CONDITION EXISTS ( <prettySnowFlake(alertCondition)> )";

public str prettySnowFlake(ResumeSuspend::resumeSuspendOpt1()) = "RESUME";

public str prettySnowFlake(ResumeSuspend::resumeSuspendOpt2()) = "SUSPEND";

public str prettySnowFlake(AlertSetClause::warehouseAlertSetClause(Identifier id)) = "WAREHOUSE = <prettySnowFlake(id)>";

public str prettySnowFlake(AlertSetClause::scheduleAlertSetClause(String string)) = "SCHEDULE = <prettySnowFlake(string)>";

public str prettySnowFlake(AlertSetClause::commentAlertSetClause(CommentClause commentClause)) = "<prettySnowFlake(commentClause)>";

public str prettySnowFlake(AlertUnSetClause::warehouseAlertUnsetClause()) = "WAREHOUSE";

public str prettySnowFlake(AlertUnSetClause::scheduleAlertUnsetClause()) = "SCHEDULE";

public str prettySnowFlake(AlertUnSetClause::commentAlertUnsetClause()) = "COMMENT";

public str prettySnowFlake(AlertCondition::selectAlertCondition(SelectStatement selectStatement)) = "<prettySnowFlake(selectStatement)>";

public str prettySnowFlake(AlertCondition::showAlertCondition(ShowCommand showCommand)) = "<prettySnowFlake(showCommand)>";

public str prettySnowFlake(AlertCondition::callAlertCondition(Call call)) = "<prettySnowFlake(call)>";

public str prettySnowFlake(AlterUser::alterUser(list[IfExists] ifExistsList, Identifier id, AlterUserOptions alterUserOptions)) = "ALTER USER <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> <prettySnowFlake(alterUserOptions)>";

public str prettySnowFlake(AlterUserOptions::renameToId(Identifier id)) = "RENAME TO <prettySnowFlake(id)>";

public str prettySnowFlake(AlterUserOptions::resetPassword()) = "RESET PASSWORD";

public str prettySnowFlake(AlterUserOptions::abortAllQueries()) = "ABORT ALL QUERIES";

public str prettySnowFlake(AlterUserOptions::addDelegated(Identifier id1, Identifier id2)) = "ADD DELEGATED AUTHORIZATION OF ROLE <prettySnowFlake(id1)> TO SECURITY INTEGRATION <prettySnowFlake(id2)>";

public str prettySnowFlake(AlterUserOptions::removeDelegated(AuthorizationType authorizationType, Identifier id)) = "REMOVE DELEGATED <prettySnowFlake(authorizationType)> FROM SECURITY INTEGRATION <prettySnowFlake(id)>";

public str prettySnowFlake(AlterUserOptions::setTagAlterUserOpt(SetTags setTags)) = "<prettySnowFlake(setTags)>";

public str prettySnowFlake(AlterUserOptions::UnsetTagAlterUserOpt(UnsetTags unsetTags)) = "<prettySnowFlake(unsetTags)>";

public str prettySnowFlake(AuthorizationType::ofRoleAuthorizationType(Identifier id)) = "AUTHORIZATION OF ROLE <prettySnowFlake(id)>";

public str prettySnowFlake(AuthorizationType::authorizationsType()) = "AUTHORIZATIONS";

public str prettySnowFlake(AlterTag::alterTag(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, AlterTagOptions alterTagOptions)) = "ALTER TAG <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> <prettySnowFlake(alterTagOptions)>";

public str prettySnowFlake(AlterTagOptions::alterTagOptsRename(ObjectColumnNameOrIdentifier objectColumnNameOrIdentifier)) = "RENAME TO <prettySnowFlake(objectColumnNameOrIdentifier)>";

public str prettySnowFlake(AlterTagOptions::alterTagOptsAddOrDrop(AddOrDrop addOrDrop, TagAllowedValues tagAllowedValues)) = "<prettySnowFlake(addOrDrop)> <prettySnowFlake(tagAllowedValues)>";

public str prettySnowFlake(AlterTagOptions::alterTagOptsUnsetAllowed()) = "UNSET ALLOWED_VALUES";

public str prettySnowFlake(AlterTagOptions::alterTagOptsSetMasking(MaskingPolicyIdList maskingPolicyIdList)) = "SET <prettySnowFlake(maskingPolicyIdList)>";

public str prettySnowFlake(AlterTagOptions::alterTagOptsUnsetMasking(MaskingPolicyIdList maskingPolicyIdList)) = "UNSET <prettySnowFlake(maskingPolicyIdList)>";

public str prettySnowFlake(AlterTagOptions::alterTagOptsSetCommentClause(CommentClause commentClause)) = "SET <prettySnowFlake(commentClause)>";

public str prettySnowFlake(AlterTagOptions::alterTagOptsUnsetComment()) = "UNSET COMMENT";

public str prettySnowFlake(AddOrDrop::add()) = "ADD";

public str prettySnowFlake(AddOrDrop::drop()) = "DROP";

public str prettySnowFlake(TagAllowedValues::tagAllowedValues(list[String] stringList)) = "ALLOWED_VALUES <intercalate(", ", [ prettySnowFlake(string) | string <- stringList ])>";

public str prettySnowFlake(MaskingPolicyId::maskingPolicyId(Identifier id)) = "MASKING POLICY <prettySnowFlake(id)>";

public str prettySnowFlake(MaskingPolicyIdList::maskingPolicyIdList(list[MaskingPolicyId] maskingPolIdList)) = "<intercalate(", ", [ prettySnowFlake(maskingPolId) | maskingPolId <- maskingPolIdList ])>";

public str prettySnowFlake(AlterSchema::alterSchemaRenameTo(list[IfExists] ifExistsList, Identifier id1, Identifier id2)) = "ALTER SCHEMA <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id1)> RENAME TO <prettySnowFlake(id2)>";

public str prettySnowFlake(AlterSchema::alterSchemaSwapWith(list[IfExists] ifExistsList, Identifier id1, Identifier id2)) = "ALTER SCHEMA <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id1)> SWAP WITH <prettySnowFlake(id2)>";

public str prettySnowFlake(AlterSchema::alterSchemaCommentClause(list[IfExists] ifExistsList, Identifier id, list[DataRetentionTimeEqInt] dataRetentionTimeEqIntList, list[MaxDataExtentionTimeEqInt] maxDataExtentionTimeEqIntList, 
                                list[DefaultDdlCollation] defaultDdlCollationList, list[CommentClause] commentClauseList)) 
                                = "ALTER SCHEMA <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> <for(dataRetentionTimeEqInt <- dataRetentionTimeEqIntList) {><prettySnowFlake(dataRetentionTimeEqInt)><}> <for(maxDataExtentionTimeEqInt <- maxDataExtentionTimeEqIntList) {><prettySnowFlake(maxDataExtentionTimeEqInt)><}> <for(defaultDdlCollation <- defaultDdlCollationList) {><prettySnowFlake(defaultDdlCollation)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(AlterSchema::alterSchemaSetTags(list[IfExists] ifExistsList, Identifier id, SetTags setTags)) = "ALTER SCHEMA <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> <prettySnowFlake(setTags)>";

public str prettySnowFlake(AlterSchema::alterSchemaUnsetTags(list[IfExists] ifExistsList, Identifier id, UnsetTags unsetTags)) = "ALTER SCHEMA <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> <prettySnowFlake(unsetTags)>";

public str prettySnowFlake(AlterSchema::alterSchemaUnset(list[IfExists] ifExistsList, Identifier id, list[DatabaseOrSchemaProperty] databaseOrSchemaPropertyList)) = "ALTER SCHEMA <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> UNSET <intercalate(", ", [ prettySnowFlake(databaseOrSchemaProperty) | databaseOrSchemaProperty <- databaseOrSchemaPropertyList ])>";

public str prettySnowFlake(AlterSchema::alterSchemaEnableDisable(list[IfExists] ifExistsList, Identifier id, EnableDisable enableDisable)) = "ALTER SCHEMA <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> <prettySnowFlake(enableDisable)> MANAGED ACCESS";

public str prettySnowFlake(EnableDisable::enable()) = "ENABLE";

public str prettySnowFlake(EnableDisable::disable()) = "DISABLE";

public str prettySnowFlake(AlterRole::alterRoleRenameTo(list[IfExists] ifExistsList, Identifier id1, Identifier id2)) = "ALTER ROLE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id1)> RENAME TO <prettySnowFlake(id2)>";

public str prettySnowFlake(AlterRole::alterRoleSet(list[IfExists] ifExistsList, Identifier id, CommentClause commentClause)) = "ALTER ROLE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> SET <prettySnowFlake(commentClause)>";

public str prettySnowFlake(AlterRole::alterRoleUnset(list[IfExists] ifExistsList, Identifier id)) = "ALTER ROLE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> UNSET COMMENT";

public str prettySnowFlake(AlterRole::alterRoleSetTags(list[IfExists] ifExistsList, Identifier id, SetTags setTags)) = "ALTER ROLE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> <prettySnowFlake(setTags)>";

public str prettySnowFlake(AlterRole::alterRoleUnsetTags(list[IfExists] ifExistsList, Identifier id, UnsetTags unsetTags)) = "ALTER ROLE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> <prettySnowFlake(unsetTags)>";

public str prettySnowFlake(AlterRowAccessPolicy::alterRowSetBody(list[IfExists] ifExistsList, Identifier id, Exp exp)) = "ALTER ROW ACCESS POLICY <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> SET BODY -\> <prettySnowFlake(exp)>";

public str prettySnowFlake(AlterRowAccessPolicy::alterRowRenameTo(list[IfExists] ifExistsList, Identifier id1, Identifier id2)) = "ALTER ROW ACCESS POLICY <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id1)> RENAME TO <prettySnowFlake(id2)>";

public str prettySnowFlake(AlterRowAccessPolicy::alterRowSetComment(list[IfExists] ifExistsList, Identifier id, CommentClause commentClause)) = "ALTER ROW ACCESS POLICY <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> SET <prettySnowFlake(commentClause)>";

public str prettySnowFlake(AlterProcedure::alterProcedureRenameTo(list[IfExists] ifExistsList, Identifier id1, list[DataTypeList] dataTypeList, Identifier id2)) = "ALTER PROCEDURE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id1)> ( <for(dataType <- dataTypeList) {><prettySnowFlake(dataType)><}> ) RENAME TO <prettySnowFlake(id2)>";

public str prettySnowFlake(AlterProcedure::alterProcedureSetComment(list[IfExists] ifExistsList, Identifier id, list[DataTypeList] dataTypeList, CommentClause commentClause)) = "ALTER PROCEDURE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> ( <for(dataType <- dataTypeList) {><prettySnowFlake(dataType)><}> ) SET <prettySnowFlake(commentClause)>";

public str prettySnowFlake(AlterProcedure::alterProcedureUnsetComment(list[IfExists] ifExistsList, Identifier id, list[DataTypeList] dataTypeList, CommentClause commentClause)) = "ALTER PROCEDURE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> ( <for(dataType <- dataTypeList) {><prettySnowFlake(dataType)><}> ) UNSET <prettySnowFlake(commentClause)>";

public str prettySnowFlake(AlterProcedure::alterProcedureExecute(list[IfExists] ifExistsList, Identifier id, list[DataTypeList] dataTypeList, CallerOwner callerOwner)) = "ALTER PROCEDURE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> ( <for(dataType <- dataTypeList) {><prettySnowFlake(dataType)><}> ) EXECUTE AS <prettySnowFlake(callerOwner)>";

public str prettySnowFlake(CallerOwner::caller()) = "CALLER";

public str prettySnowFlake(CallerOwner::owner()) = "OWNER";

public str prettySnowFlake(AlterNetworkPolicy::alterNetworkPolicy(AlterNetworkPolicyOpts alterNetworkPolicyOpts)) = "ALTER NETWORK POLICY <prettySnowFlake(alterNetworkPolicyOpts)>";

public str prettySnowFlake(AlterNetworkPolicyOpts::alterNetworkIPList(list[IfExists] ifExistsList, Identifier id, list[AllowedIPList] allowedIPList, list[BlockedIPList] blockedIPList, list[CommentClause] commentClauseList)) 
                                        = "<for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> SET <for(allowedIP <- allowedIPList) {><prettySnowFlake(allowedIP)><}> <for(blockedIP <- blockedIPList) {><prettySnowFlake(blockedIP)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(AlterNetworkPolicyOpts::alterNetworkUnset(list[IfExists] ifExistsList, Identifier id)) = "<for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> UNSET COMMENT";

public str prettySnowFlake(AlterNetworkPolicyOpts::alterNetworkRenameTo(Identifier id1, Identifier id2)) = "<prettySnowFlake(id1)> RENAME TO <prettySnowFlake(id2)>";

public str prettySnowFlake(AllowedIPList::allowedIPList(list[StringList] stringList)) = "ALLOWED_IP_LIST = ( <for(string <- stringList) {><prettySnowFlake(string)><}> )";

public str prettySnowFlake(BlockedIPList::blockedIPList(list[StringList] stringList)) = "BLOCKED_IP_LIST = ( <for(string <- stringList) {><prettySnowFlake(string)><}> )";

public str prettySnowFlake(AlterApiIntegration::alterApiArn(list[IfExists] ifExistsList, Identifier id,
                                        list[ApiAwsArn] apiAwsArnList,
                                        list[AzureAdApplication] azureAdApplicationList,
                                        list[ApiKey] apiKeyList,
                                        list[Enabled] enabledList,
                                        list[ApiAllowedPrefixes] apiAllowedPrefixesList,
                                        list[ApiBlockedPrefixes] apiBlockedPrefixesList,
                                        list[CommentClause] commentClauseList
                                    )) 
                                    = "ALTER API INTEGRATION <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> SET <for(apiAwsArn <- apiAwsArnList) {><prettySnowFlake(apiAwsArn)><}> <for(azureAdApplication <- azureAdApplicationList) {><prettySnowFlake(azureAdApplication)><}> <for(apiKey <- apiKeyList) {><prettySnowFlake(apiKey)><}> <for(enabled <- enabledList) {><prettySnowFlake(enabled)><}> <for(apiAllowedPrefixes <- apiAllowedPrefixesList) {><prettySnowFlake(apiAllowedPrefixes)><}> <for(apiBlockedPrefixes <- apiBlockedPrefixesList) {><prettySnowFlake(apiBlockedPrefixes)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(AlterApiIntegration::alterNoApiArn(list[IfExists] ifExistsList, Identifier id,
                                        list[ApiAwsArn] apiAwsArnList,
                                        list[AzureAdApplication] azureAdApplicationList,
                                        list[ApiKey] apiKeyList,
                                        list[Enabled] enabledList,
                                        list[ApiAllowedPrefixes] apiAllowedPrefixesList,
                                        list[ApiBlockedPrefixes] apiBlockedPrefixesList,
                                        list[CommentClause] commentClauseList
                                    )) 
                                    = "ALTER INTEGRATION <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> SET <for(apiAwsArn <- apiAwsArnList) {><prettySnowFlake(apiAwsArn)><}> <for(azureAdApplication <- azureAdApplicationList) {><prettySnowFlake(azureAdApplication)><}> <for(apiKey <- apiKeyList) {><prettySnowFlake(apiKey)><}> <for(enabled <- enabledList) {><prettySnowFlake(enabled)><}> <for(apiAllowedPrefixes <- apiAllowedPrefixesList) {><prettySnowFlake(apiAllowedPrefixes)><}> <for(apiBlockedPrefixes <- apiBlockedPrefixesList) {><prettySnowFlake(apiBlockedPrefixes)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(AlterApiIntegration::alterNoApiSetTags(Identifier id, SetTags setTags)) = "ALTER INTEGRATION <prettySnowFlake(id)> <prettySnowFlake(setTags)>";

public str prettySnowFlake(AlterApiIntegration::alterApiSetTags(Identifier id, SetTags setTags)) = "ALTER API INTEGRATION <prettySnowFlake(id)> <prettySnowFlake(setTags)>";

public str prettySnowFlake(AlterApiIntegration::alterNoApiUnsetTags(Identifier id, UnsetTags unsetTags)) = "ALTER INTEGRATION <prettySnowFlake(id)> <prettySnowFlake(unsetTags)>";

public str prettySnowFlake(AlterApiIntegration::alterApiUnsetTags(Identifier id, UnsetTags unsetTags)) = "ALTER API INTEGRATION <prettySnowFlake(id)> <prettySnowFlake(unsetTags)>";

public str prettySnowFlake(AlterApiIntegration::alterNoApiUnset(list[IfExists] ifExistsList, Identifier id, ApiIntegrationPropertyList apiIntegrationPropertyList)) = "ALTER INTEGRATION <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> UNSET <prettySnowFlake(apiIntegrationPropertyList)>";

public str prettySnowFlake(AlterApiIntegration::alterApiUnset(list[IfExists] ifExistsList, Identifier id, ApiIntegrationPropertyList apiIntegrationPropertyList)) = "ALTER API INTEGRATION <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> UNSET <prettySnowFlake(apiIntegrationPropertyList)>";

public str prettySnowFlake(ApiAwsArn::apiAwsArn(String string)) = "API_AWS_ROLE_ARN = <prettySnowFlake(string)>";

public str prettySnowFlake(AzureAdApplication::azureAdApplication(String string)) = "AZURE_AD_APPLICATION_ID = <prettySnowFlake(string)>";

public str prettySnowFlake(ApiKey::apiKey(String string)) = "API_KEY = <prettySnowFlake(string)>";

public str prettySnowFlake(Enabled::enableTrueOrFalse(Boolean boolVal)) = "ENABLED = <prettySnowFlake(boolVal)>";

public str prettySnowFlake(ApiAllowedPrefixes::apiAllowedPrefixes(String string)) = "API_ALLOWED_PREFIXES = ( <prettySnowFlake(string)> )";

public str prettySnowFlake(ApiBlockedPrefixes::apiBlockedPrefixes(String string)) = "API_BLOCKED_PREFIXES = ( <prettySnowFlake(string)> )";

public str prettySnowFlake(ApiIntegrationPropertyList::apiIntegrationPropertyList(list[ApiIntegrationProperty] apiIntegrationPropList)) = "<intercalate(", ", [ prettySnowFlake(apiIntegrationProp) | apiIntegrationProp <- apiIntegrationPropList ])>";

public str prettySnowFlake(ApiIntegrationProperty::apiKeyIntegrationProp()) = "API_KEY";

public str prettySnowFlake(ApiIntegrationProperty::enabledIntegrationProp()) = "ENABLED";

public str prettySnowFlake(ApiIntegrationProperty::blockedPrefixesIntegrationProp()) = "API_BLOCKED_PREFIXES";

public str prettySnowFlake(ApiIntegrationProperty::commentIntegrationProp()) = "COMMENT";

public str prettySnowFlake(AlterDynamicTable::alterDynamicTable(Identifier id, AlterDynamicOpts alterDynamicOpts)) = "ALTER DYNAMIC TABLE <prettySnowFlake(id)> <prettySnowFlake(alterDynamicOpts)>";

public str prettySnowFlake(AlterDynamicOpts::resumeSuspendDynamicOpt(ResumeSuspend resumeSuspend)) = "<prettySnowFlake(resumeSuspend)>";

public str prettySnowFlake(AlterDynamicOpts::refreshDynamicOpt()) = "REFRESH";

public str prettySnowFlake(AlterDynamicOpts::setDynamicOpt(Identifier id)) = "SET WAREHOUSE = <prettySnowFlake(id)>";

public str prettySnowFlake(AlterFailoverGroup::renameToFailoverGroup(list[IfExists] ifExistsList, Identifier id1, Identifier id2)) = "ALTER FAILOVER GROUP <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id1)> RENAME TO <prettySnowFlake(id2)>";

public str prettySnowFlake(AlterFailoverGroup::setFailoverGroup(list[IfExists] ifExistsList, Identifier id, list[ObjectTypes] objectTypesList, list[ReplicationSchedule] replicationScheduleList)) = "ALTER FAILOVER GROUP <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> SET <for(objectTypes <- objectTypesList) {><prettySnowFlake(objectTypes)><}> <for(replicationSchedule <- replicationScheduleList) {><prettySnowFlake(replicationSchedule)><}>";

public str prettySnowFlake(AlterFailoverGroup::addAllowedFailoverGroup(list[IfExists] ifExistsList, Identifier id, ColumnList columnList)) = "ALTER FAILOVER GROUP <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> ADD <prettySnowFlake(columnList)> TO ALLOWED_DATABASES";

public str prettySnowFlake(AlterFailoverGroup::moveToFailoverGroup(list[IfExists] ifExistsList, Identifier id1, ColumnList columnList, Identifier id2)) = "ALTER FAILOVER GROUP <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id1)> MOVE DATABASES <prettySnowFlake(columnList)> TO FAILOVER GROUP <prettySnowFlake(id2)>";

public str prettySnowFlake(AlterFailoverGroup::removeFromFailoverGroup(list[IfExists] ifExistsList, Identifier id, ColumnList columnList)) = "ALTER FAILOVER GROUP <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> REMOVE <prettySnowFlake(columnList)> FROM ALLOWED_DATABASES";

public str prettySnowFlake(AlterFailoverGroup::allowedSharesFailoverGroup(list[IfExists] ifExistsList, Identifier id, ColumnList columnList)) = "ALTER FAILOVER GROUP <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> ADD <prettySnowFlake(columnList)> TO ALLOWED_SHARES";

public str prettySnowFlake(AlterFailoverGroup::moveSharesFailoverGroup(list[IfExists] ifExistsList, Identifier id1, ColumnList columnList, Identifier id2)) = "ALTER FAILOVER GROUP <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id1)> MOVE SHARES <prettySnowFlake(columnList)> TO FAILOVER GROUP <prettySnowFlake(id2)>";

public str prettySnowFlake(AlterFailoverGroup::removeAllowedSharesFailoverGroup(list[IfExists] ifExistsList, Identifier id, ColumnList columnList)) = "ALTER FAILOVER GROUP <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> REMOVE <prettySnowFlake(columnList)> FROM ALLOWED_SHARES";

public str prettySnowFlake(AlterFailoverGroup::allowedAccountsFailoverGroup(list[IfExists] ifExistsList, Identifier id, ObjectColumnNameOrIdentifier objNameOrId, list[IgnoreEditionCheck] ignoreEditionCheckList)) = "ALTER FAILOVER GROUP <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> ADD <prettySnowFlake(objNameOrId)> TO ALLOWED_ACCOUNTS <for(ignoreEditionCheck <- ignoreEditionCheckList) {><prettySnowFlake(ignoreEditionCheck)><}>";

public str prettySnowFlake(AlterFailoverGroup::removeColumnFailoverGroup(list[IfExists] ifExistsList, Identifier id, ObjectColumnNameOrIdentifier objNameOrId)) = "ALTER FAILOVER GROUP <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> REMOVE <prettySnowFlake(objNameOrId)> FROM ALLOWED_ACCOUNTS";

public str prettySnowFlake(AlterFailoverGroup::failoverOptFailoverGroup(list[IfExists] ifExistsList, Identifier id, AlterFailoverOpts alterFailoverOpts)) = "ALTER FAILOVER GROUP <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> <prettySnowFlake(alterFailoverOpts)>";

public str prettySnowFlake(ObjectTypes::objectTypes(ObjectTypeList objectTypeList)) = "OBJECT_TYPES = <prettySnowFlake(objectTypeList)>";

public str prettySnowFlake(ObjectTypeList::objectTypeList(list[ObjectType] objTypeList)) = "<intercalate(", ", [ prettySnowFlake(objType) | objType <- objTypeList ])>";

public str prettySnowFlake(ObjectType::accountParamObjectType()) = "ACCOUNT PARAMETERS";

public str prettySnowFlake(ObjectType::databasesObjectType()) = "DATABASES";

public str prettySnowFlake(ObjectType::integrationsObjectType()) = "INTEGRATIONS";

public str prettySnowFlake(ObjectType::networkPoliciesObjectType()) = "NETWORK POLICIES";

public str prettySnowFlake(ObjectType::resourceMonitorsObjectType()) = "RESOURCE MONITORS";

public str prettySnowFlake(ObjectType::rolesObjectType()) = "ROLES";

public str prettySnowFlake(ObjectType::sharesObjectType()) = "SHARES";

public str prettySnowFlake(ObjectType::usersObjectType()) = "USERS";

public str prettySnowFlake(ObjectType::warehousesObjectType()) = "WAREHOUSES";

public str prettySnowFlake(ReplicationSchedule::replicationSchedule(String string)) = "REPLICATION_SCHEDULE = <prettySnowFlake(string)>";

public str prettySnowFlake(IgnoreEditionCheck::ignoreEditionCheck()) = "IGNORE EDITION CHECK";

public str prettySnowFlake(AlterFailoverOpts::refreshFailoverOpts()) = "REFRESH";

public str prettySnowFlake(AlterFailoverOpts::primaryFailoverOpts()) = "PRIMARY";

public str prettySnowFlake(AlterFailoverOpts::suspendFailoverOpts()) = "SUSPEND";

public str prettySnowFlake(AlterFailoverOpts::resumeFailoverOpts()) = "RESUME";

public str prettySnowFlake(AlterFileFormat::alterFileRenameTo(list[IfExists] ifExistsList, Identifier id1, Identifier id2)) = "ALTER FILE FORMAT <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id1)> RENAME TO <prettySnowFlake(id2)>";

public str prettySnowFlake(AlterFileFormat::alterFileSet(list[IfExists] ifExistsList, Identifier id, list[FormatTypeOptions] formatTypeOptionsList, list[CommentClause] commentClauseList)) = "ALTER FAILOVER GROUP <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> SET <for(formatTypeOptions <- formatTypeOptionsList) {><prettySnowFlake(formatTypeOptions)> <}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(FormatTypeOptions::fileExtensionFormatOpts(String string)) = "FILE_EXTENSION = <prettySnowFlake(string)>";

public str prettySnowFlake(FormatTypeOptions::skipHeaderFormatOpts(str integer)) = "SKIP_HEADER = <integer>";

public str prettySnowFlake(FormatTypeOptions::skipBlankLinesFormatOpts(Boolean boolVal)) = "SKIP_BLANK_LINES = <prettySnowFlake(boolVal)>";

public str prettySnowFlake(FormatTypeOptions::dateFormatOpts(String string)) = "DATE_FORMAT = <prettySnowFlake(string)>";

public str prettySnowFlake(FormatTypeOptions::timeFormatOpts(String string)) = "TIME_FORMAT = <prettySnowFlake(string)>";

public str prettySnowFlake(FormatTypeOptions::timeStampFormatOpts(String string)) = "TIMESTAMP_FORMAT = <prettySnowFlake(string)>";

public str prettySnowFlake(FormatTypeOptions::binaryFormatOpts(BinaryFormat binaryFormat)) = "BINARY_FORMAT <prettySnowFlake(binaryFormat)>";

public str prettySnowFlake(FormatTypeOptions::escapeCharLiteralFormatOpts(str charLit)) = "ESCAPE = <charLit>";

public str prettySnowFlake(FormatTypeOptions::escapeNoneFormatOpts()) = "ESCAPE = NONE";

public str prettySnowFlake(FormatTypeOptions::escapeNone_qFormatOpts()) = "ESCAPE = \'NONE\'";

public str prettySnowFlake(FormatTypeOptions::escapeEnclosedStringFormatOpts(String string)) = "ESCAPE_UNENCLOSED_FIELD = <prettySnowFlake(string)>";

public str prettySnowFlake(FormatTypeOptions::compressionTypeFormatOpts(Compression compression)) = "<prettySnowFlake(compression)>";

public str prettySnowFlake(FormatTypeOptions::preserveSpaceFormatOpts(Boolean boolVal)) = "PRESERVE_SPACE = <prettySnowFlake(boolVal)>";

public str prettySnowFlake(FormatTypeOptions::stripOuterElementFormatOpts(Boolean boolVal)) = "STRIP_OUTER_ELEMENT = <prettySnowFlake(boolVal)>";

public str prettySnowFlake(FormatTypeOptions::disableSnowFlakeFormatOpts(Boolean boolVal)) = "DISABLE_SNOWFLAKE_DATA = <prettySnowFlake(boolVal)>";

public str prettySnowFlake(FormatTypeOptions::disableAutoConvertFormatOpts(Boolean boolVal)) = "DISABLE_AUTO_CONVERT = <prettySnowFlake(boolVal)>";

public str prettySnowFlake(FormatTypeOptions::ignoreUtf8ErrorsFormatOpts(Boolean boolVal)) = "IGNORE_UTF8_ERRORS = <prettySnowFlake(boolVal)>";

public str prettySnowFlake(FormatTypeOptions::recordDelimiterFormatOpts(String string)) = "RECORD_DELIMITER = <prettySnowFlake(string)>";

public str prettySnowFlake(FormatTypeOptions::fieldDelimiterFormatOpts(String string)) = "FIELD_DELIMITER = <prettySnowFlake(string)>";

public str prettySnowFlake(FormatTypeOptions::trimSpaceFormatOpts(Boolean boolVal)) = "TRIM_SPACE = <prettySnowFlake(boolVal)>";

public str prettySnowFlake(FormatTypeOptions::errorOnMismatchFormatOpts(Boolean boolVal)) = "ERROR_ON_COLUMN_COUNT_MISMATCH = <prettySnowFlake(boolVal)>";

public str prettySnowFlake(FormatTypeOptions::encodingStringFormatOpts(String string)) = "ENCODING = <prettySnowFlake(string)>";

public str prettySnowFlake(FormatTypeOptions::fieldEnclosedByStringFormatOpts(String string)) = "FIELD_OPTIONALLY_ENCLOSED_BY = <prettySnowFlake(string)>";

public str prettySnowFlake(FormatTypeOptions::nullIfFormatOpts(StringList stringList)) = "NULL_IF = ( <prettySnowFlake(stringList)> )";

public str prettySnowFlake(FormatTypeOptions::replaceInvalidCharFormatOpts(Boolean boolVal)) = "REPLACE_INVALID_CHARACTERS = <prettySnowFlake(boolVal)>";

public str prettySnowFlake(BinaryFormat::binaryFormatHex()) = "HEX";

public str prettySnowFlake(BinaryFormat::binaryFormatBase64()) = "BASE64";

public str prettySnowFlake(BinaryFormat::binaryFormatUtf8()) = "UTF8";

public str prettySnowFlake(Compression::compression(CompressionType compressionType)) = "COMPRESSION = <prettySnowFlake(compressionType)>";

public str prettySnowFlake(CompressionType::compressionTypeAuto()) = "AUTO";

public str prettySnowFlake(CompressionType::compressionTypeGZIP()) = "GZIP";

public str prettySnowFlake(CompressionType::compressionTypeBZ2()) = "BZ2";

public str prettySnowFlake(CompressionType::compressionTypeBROTLI()) = "BROTLI";

public str prettySnowFlake(CompressionType::compressionTypeZSTD()) = "ZSTD";

public str prettySnowFlake(CompressionType::compressionTypeDeflate()) = "DEFLATE";

public str prettySnowFlake(CompressionType::compressionTypeRawDeflate()) = "RAW_DEFLATE";

public str prettySnowFlake(CompressionType::compressionTypeNone()) = "NONE";

public str prettySnowFlake(CompressionType::compressionTypeAuto_q()) = "\'AUTO\'";

public str prettySnowFlake(CompressionType::compressionTypeAutoDetect()) = "AUTO_DETECT";

public str prettySnowFlake(AlterWareHouse::alterWareHouse(list[IfExists] ifExistsList, AlterWareHouseOptions alterWareHouseOptions)) = "ALTER WAREHOUSE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(alterWareHouseOptions)>";

public str prettySnowFlake(AlterWareHouseOptions::idSuspendIfAlterWhOpt(list[IdentifierFn] identifierFnList, SuspendResumeIf suspendResumeIf)) = "<for(identifierFn <- identifierFnList) {><prettySnowFlake(identifierFn)><}> <prettySnowFlake(suspendResumeIf)>";

public str prettySnowFlake(AlterWareHouseOptions::idAbortAllAlterWhOpt(list[IdentifierFn] identifierFnList)) = "<for(identifierFn <- identifierFnList) {><prettySnowFlake(identifierFn)><}> ABORT ALL QUERIES";

public str prettySnowFlake(AlterWareHouseOptions::idRenameToAlterWhOpt(IdentifierFn identifierFn, Identifier id)) = "<prettySnowFlake(identifierFn)> RENAME TO <prettySnowFlake(id)>";

public str prettySnowFlake(AlterWareHouseOptions::idSetTagsAlterWhOpt(IdentifierFn identifierFn, SetTags setTags)) = "<prettySnowFlake(identifierFn)> <prettySnowFlake(setTags)>";

public str prettySnowFlake(AlterWareHouseOptions::idUnSetTagsAlterWhOpt(IdentifierFn identifierFn, UnsetTags unsetTags)) = "<prettySnowFlake(identifierFn)> <prettySnowFlake(unsetTags)>";

public str prettySnowFlake(AlterWareHouseOptions::idUnSetColListAlterWhOpt(IdentifierFn identifierFn, ColumnList columnList)) = "<prettySnowFlake(identifierFn)> UNSET <prettySnowFlake(columnList)>";

public str prettySnowFlake(IdentifierFn::objectNameIdentifierFn(ObjectColumnNameOrIdentifier objNameOrId)) = "<prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(IdentifierFn::bracketIdentifierFn(Identifier id)) = "IDENTIFIER( <prettySnowFlake(id)> )";

public str prettySnowFlake(IdentifierFn::stringIdentifierFn(String string)) = "IDENTIFIER( <prettySnowFlake(string)> )";

public str prettySnowFlake(SuspendResumeIf::suspendResumeIfOpt1()) = "SUSPEND";

public str prettySnowFlake(SuspendResumeIf::suspendResumeIfOpt2(list[IfSuspended] ifSuspendedList)) = "RESUME <for(ifSuspended <- ifSuspendedList) {><prettySnowFlake(ifSuspended)><}>";

public str prettySnowFlake(IfSuspended::ifSuspended()) = "IF SUSPENDED";

public str prettySnowFlake(AlterFunction::renameToAlterFunction(AlterFunctionSignature alterFunctionSignature, Identifier id)) = "<prettySnowFlake(alterFunctionSignature)> RENAME TO <prettySnowFlake(id)>";

public str prettySnowFlake(AlterFunction::commentAlterFunction(AlterFunctionSignature alterFunctionSignature, CommentClause commentClause)) = "<prettySnowFlake(alterFunctionSignature)> SET <prettySnowFlake(commentClause)>";

public str prettySnowFlake(AlterFunction::setSecureAlterFunction(AlterFunctionSignature alterFunctionSignature)) = "<prettySnowFlake(alterFunctionSignature)> SET SECURE";

public str prettySnowFlake(AlterFunction::unsetAlterFunction(AlterFunctionSignature alterFunctionSignature, UnsetSecureOrComment unsetSecureOrComment)) = "<prettySnowFlake(alterFunctionSignature)> UNSET <prettySnowFlake(unsetSecureOrComment)>";

public str prettySnowFlake(AlterFunction::apiAlterFunction(AlterFunctionSignature alterFunctionSignature, Identifier id)) = "<prettySnowFlake(alterFunctionSignature)> SET API_INTEGRATION = <prettySnowFlake(id)>";

public str prettySnowFlake(AlterFunction::headersAlterFunction(AlterFunctionSignature alterFunctionSignature, list[HeaderDecl] headerDeclList)) = "<prettySnowFlake(alterFunctionSignature)> SET HEADERS = ( <for(headerDecl <- headerDeclList) {><prettySnowFlake(headerDecl)> <}> )";

public str prettySnowFlake(AlterFunction::contextAlterFunction(AlterFunctionSignature alterFunctionSignature, list[Identifier] idList)) = "<prettySnowFlake(alterFunctionSignature)> SET CONTEXT_HEADERS = ( <for(id <- idList) {><prettySnowFlake(id)> <}> )";

public str prettySnowFlake(AlterFunction::maxBatchAlterFunction(AlterFunctionSignature alterFunctionSignature, str integer)) = "<prettySnowFlake(alterFunctionSignature)> SET MAX_BATCH_ROWS = <integer>";

public str prettySnowFlake(AlterFunction::compressionAlterFunction(AlterFunctionSignature alterFunctionSignature, Compression compression)) = "<prettySnowFlake(alterFunctionSignature)> SET <prettySnowFlake(compression)>";

public str prettySnowFlake(AlterFunction::translatorAlterFunction(AlterFunctionSignature alterFunctionSignature, TranslatorType translatorType, Identifier id)) = "<prettySnowFlake(alterFunctionSignature)> SET <prettySnowFlake(translatorType)> = <prettySnowFlake(id)>";

public str prettySnowFlake(AlterFunction::unsetTypeAlterFunction(AlterFunctionSignature alterFunctionSignature, UnsetType unsetType)) = "<prettySnowFlake(alterFunctionSignature)> UNSET <prettySnowFlake(unsetType)>";

public str prettySnowFlake(AlterFunctionSignature::alterFunctionSignature(list[IfExists] ifExistsList, Identifier id, list[DataTypeList] dataTypeList)) = "ALTER FUNCTION <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> ( <for(dataType <- dataTypeList) {><prettySnowFlake(dataType)><}> )";

public str prettySnowFlake(UnsetSecureOrComment::unsetSecure()) = "SECURE";

public str prettySnowFlake(UnsetSecureOrComment::unsetComment()) = "COMMENT";

public str prettySnowFlake(UnsetSecureOrComment::setSecureOrComment()) = "SET";

public str prettySnowFlake(HeaderDecl::headerDecl(String string1, String string2)) = "<prettySnowFlake(string1)> = <prettySnowFlake(string2)>";

public str prettySnowFlake(TranslatorType::requestTranslatorType()) = "REQUEST_TRANSLATOR";

public str prettySnowFlake(TranslatorType::responseTranslatorType()) = "RESPONSE_TRANSLATOR";

public str prettySnowFlake(UnsetType::unsetCommentType()) = "COMMENT";

public str prettySnowFlake(UnsetType::unsetHeadersType()) = "HEADERS";

public str prettySnowFlake(UnsetType::unsetContextHeadersType()) = "CONTEXT_HEADERS";

public str prettySnowFlake(UnsetType::unsetMaxBatchType()) = "MAX_BATCH_ROWS";

public str prettySnowFlake(UnsetType::unsetCompressionType()) = "COMPRESSION";

public str prettySnowFlake(UnsetType::unsetSecureType()) = "SECURE";

public str prettySnowFlake(UnsetType::unsetTranslatorType(TranslatorType translatorType)) = "<prettySnowFlake(translatorType)>";

public str prettySnowFlake(AlterView::alterViewAlternative1(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId1, ObjectColumnNameOrIdentifier objNameOrId2)) = "ALTER VIEW <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId1)> RENAME TO <prettySnowFlake(objNameOrId2)>";

public str prettySnowFlake(AlterView::alterViewAlternative2(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, CommentClause commentClause)) = "ALTER VIEW <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> SET <prettySnowFlake(commentClause)>";

public str prettySnowFlake(AlterView::alterViewAlternative3(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId)) = "ALTER VIEW <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> UNSET COMMENT";

public str prettySnowFlake(AlterView::alterViewAlternative4(ObjectColumnNameOrIdentifier objNameOrId)) = "ALTER VIEW <prettySnowFlake(objNameOrId)> SET SECURE";

public str prettySnowFlake(AlterView::alterViewAlternative5(ObjectColumnNameOrIdentifier objNameOrId)) = "ALTER VIEW <prettySnowFlake(objNameOrId)> UNSET SECURE";

public str prettySnowFlake(AlterView::alterViewAlternative6(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, SetTags setTags)) = "ALTER VIEW <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> <prettySnowFlake(setTags)>";

public str prettySnowFlake(AlterView::alterViewAlternative7(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, UnsetTags unsetTags)) = "ALTER VIEW <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> <prettySnowFlake(unsetTags)>";

public str prettySnowFlake(AlterView::alterViewAlternative8(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, Identifier id, ColumnListWithBrackets columnListWithBrackets)) = "ALTER VIEW <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> ADD ROW ACCESS POLICY <prettySnowFlake(id)> ON <prettySnowFlake(columnListWithBrackets)>";

public str prettySnowFlake(AlterView::alterViewAlternative9(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, Identifier id)) = "ALTER VIEW <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> DROP ROW ACCESS POLICY <prettySnowFlake(id)>";

public str prettySnowFlake(AlterView::alterViewAlternative10(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, Identifier id1, ColumnListWithBrackets columnListWithBrackets, Identifier id2)) = "ALTER VIEW <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> ADD ROW ACCESS POLICY <prettySnowFlake(id1)> ON <prettySnowFlake(columnListWithBrackets)> , DROP ROW ACCESS POLICY <prettySnowFlake(id2)>";

public str prettySnowFlake(AlterView::alterViewAlternative11(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId)) = "ALTER VIEW <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> DROP ALL ROW ACCESS POLICIES";

public str prettySnowFlake(AlterView::alterViewAlternative12(ObjectColumnNameOrIdentifier objNameOrId, AlterOrModify alterOrModify, Identifier id1, Identifier id2, list[UsingColumnList] usingColumnList)) = "ALTER VIEW <prettySnowFlake(objNameOrId)> <prettySnowFlake(alterOrModify)> <prettySnowFlake(id1)> SET MASKING POLICY <prettySnowFlake(id2)> <for(usingColumn <- usingColumnList) {><prettySnowFlake(usingColumn)><}>";

public str prettySnowFlake(AlterView::alterViewAlternative13(ObjectColumnNameOrIdentifier objNameOrId, AlterOrModify alterOrModify, Identifier id1, Identifier id2, list[UsingColumnList] usingColumnList)) = "ALTER VIEW <prettySnowFlake(objNameOrId)> <prettySnowFlake(alterOrModify)> COLUMN <prettySnowFlake(id1)> SET MASKING POLICY <prettySnowFlake(id2)> <for(usingColumn <- usingColumnList) {><prettySnowFlake(usingColumn)><}>";

public str prettySnowFlake(AlterView::alterViewAlternative14(ObjectColumnNameOrIdentifier objNameOrId, AlterOrModify alterOrModify, Identifier id1, Identifier id2, list[UsingColumnList] usingColumnList)) = "ALTER VIEW <prettySnowFlake(objNameOrId)> <prettySnowFlake(alterOrModify)> <prettySnowFlake(id1)> SET MASKING POLICY <prettySnowFlake(id2)> <for(usingColumn <- usingColumnList) {><prettySnowFlake(usingColumn)><}> FORCE";

public str prettySnowFlake(AlterView::alterViewAlternative15(ObjectColumnNameOrIdentifier objNameOrId, AlterOrModify alterOrModify, Identifier id1, Identifier id2, list[UsingColumnList] usingColumnList)) = "ALTER VIEW <prettySnowFlake(objNameOrId)> <prettySnowFlake(alterOrModify)> COLUMN <prettySnowFlake(id1)> SET MASKING POLICY <prettySnowFlake(id2)> <for(usingColumn <- usingColumnList) {><prettySnowFlake(usingColumn)><}> FORCE";

public str prettySnowFlake(AlterView::alterViewAlternative16(ObjectColumnNameOrIdentifier objNameOrId, AlterOrModify alterOrModify, Identifier id)) = "ALTER VIEW <prettySnowFlake(objNameOrId)> <prettySnowFlake(alterOrModify)> <prettySnowFlake(id)> UNSET MASKING POLICY";

public str prettySnowFlake(AlterView::alterViewAlternative17(ObjectColumnNameOrIdentifier objNameOrId, AlterOrModify alterOrModify, Identifier id)) = "ALTER VIEW <prettySnowFlake(objNameOrId)> <prettySnowFlake(alterOrModify)> COLUMN <prettySnowFlake(id)> UNSET MASKING POLICY";

public str prettySnowFlake(AlterView::alterViewAlternative18(ObjectColumnNameOrIdentifier objNameOrId, AlterOrModify alterOrModify, Identifier id, SetTags setTags)) = "ALTER VIEW <prettySnowFlake(objNameOrId)> <prettySnowFlake(alterOrModify)> <prettySnowFlake(id)> <prettySnowFlake(setTags)>";

public str prettySnowFlake(AlterView::alterViewAlternative19(ObjectColumnNameOrIdentifier objNameOrId, AlterOrModify alterOrModify, Identifier id, SetTags setTags)) = "ALTER VIEW <prettySnowFlake(objNameOrId)> <prettySnowFlake(alterOrModify)> COLUMN <prettySnowFlake(id)> <prettySnowFlake(setTags)>";

public str prettySnowFlake(AlterView::alterViewAlternative20(ObjectColumnNameOrIdentifier objNameOrId, AlterOrModify alterOrModify, Identifier id, UnsetTags unsetTags)) = "ALTER VIEW <prettySnowFlake(objNameOrId)> <prettySnowFlake(alterOrModify)> COLUMN <prettySnowFlake(id)> <prettySnowFlake(unsetTags)>";

public str prettySnowFlake(AlterOrModify::alterOrModifyOpt1()) = "ALTER";

public str prettySnowFlake(AlterOrModify::alterOrModifyOpt2()) = "MODIFY";

public str prettySnowFlake(AlterMaskingPolicy::alterMaskingBody(list[IfExists] ifExistsList, Identifier id, Exp exp)) = "ALTER MASKING POLICY <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> SET BODY -\> <prettySnowFlake(exp)>";

public str prettySnowFlake(AlterMaskingPolicy::alterMaskingRenameTo(list[IfExists] ifExistsList, Identifier id1, Identifier id2)) = "ALTER MASKING POLICY <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id1)> RENAME TO <prettySnowFlake(id2)>";

public str prettySnowFlake(AlterMaskingPolicy::alterMaskingSet(list[IfExists] ifExistsList, Identifier id, CommentClause commentClause)) = "ALTER MASKING POLICY <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> SET <prettySnowFlake(commentClause)>";

public str prettySnowFlake(AlterMaterializedView::alterMaterializedView(Identifier id, AlterMaterializedViewOpts alterMaterializedViewOpts)) = "ALTER MATERIALIZED VIEW <prettySnowFlake(id)> <prettySnowFlake(alterMaterializedViewOpts)>";

public str prettySnowFlake(AlterMaterializedViewOpts::alterMaterializedViewOpt1(Identifier id)) = "RENAME TO <prettySnowFlake(id)>";

public str prettySnowFlake(AlterMaterializedViewOpts::alterMaterializedViewOpt2(ExpListWithBrackets expListWithBrackets)) = "CLUSTER BY <prettySnowFlake(expListWithBrackets)>";

public str prettySnowFlake(AlterMaterializedViewOpts::alterMaterializedViewOpt3()) = "DROP CLUSTERING KEY";

public str prettySnowFlake(AlterMaterializedViewOpts::alterMaterializedOptNoRecluster(ResumeSuspend resumeSuspend)) = "<prettySnowFlake(resumeSuspend)>";

public str prettySnowFlake(AlterMaterializedViewOpts::alterMaterializedOptRecluster(ResumeSuspend resumeSuspend)) = "<prettySnowFlake(resumeSuspend)> RECLUSTER";

public str prettySnowFlake(AlterMaterializedViewOpts::alterMaterializedOptNoSecure(list[CommentClause] commentClauseList)) = "SET <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(AlterMaterializedViewOpts::alterMaterializedOptSecure(list[CommentClause] commentClauseList)) = "SET SECURE <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(AlterMaterializedViewOpts::alterMaterializedViewOpt7(list[UnsetSecureOrComment] unsetSecureOrCommentList)) = "<for(unsetSecureOrComment <- unsetSecureOrCommentList) {><prettySnowFlake(unsetSecureOrComment)> <}>";

public str prettySnowFlake(AlterPipe::alterPipeOpt1(list[IfExists] ifExistsList, Identifier id, list[ObjectProperties] objectPropertiesList, list[CommentClause] commentClauseList)) 
                                = "ALTER PIPE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> SET <for(objectProperties <- objectPropertiesList) {><prettySnowFlake(objectProperties)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(AlterPipe::alterPipeOpt2(Identifier id, SetTags setTags)) = "ALTER PIPE <prettySnowFlake(id)> <prettySnowFlake(setTags)>";

public str prettySnowFlake(AlterPipe::alterPipeOpt3(Identifier id, UnsetTags unsetTags)) = "ALTER PIPE <prettySnowFlake(id)> <prettySnowFlake(unsetTags)>";

public str prettySnowFlake(AlterPipe::alterPipeOpt4(list[IfExists] ifExistsList, Identifier id, Boolean boolVal)) = "ALTER PIPE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> UNSET PIPE_EXECUTION_PAUSED = <prettySnowFlake(boolVal)>";

public str prettySnowFlake(AlterPipe::alterPipeOpt5(list[IfExists] ifExistsList, Identifier id)) = "ALTER PIPE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> UNSET COMMENT";

public str prettySnowFlake(AlterPipe::alterPipeOpt6(list[IfExists] ifExistsList, Identifier id, list[PrefixString] prefixStringList, list[ModifiedAfter] modifiedAfterList)) = "ALTER PIPE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> REFRESH <for(prefixString <- prefixStringList) {><prettySnowFlake(prefixString)><}> <for(modifiedAfter <- modifiedAfterList) {><prettySnowFlake(modifiedAfter)><}>";

public str prettySnowFlake(ObjectProperties::passwordObjectProp(String string)) = "PASSWORD = <prettySnowFlake(string)>";

public str prettySnowFlake(ObjectProperties::loginObjectProp(String string)) = "LOGIN_NAME = <prettySnowFlake(string)>";

public str prettySnowFlake(ObjectProperties::displayNameObjectProp(String string)) = "DISPLAY_NAME = <prettySnowFlake(string)>";

public str prettySnowFlake(ObjectProperties::firstNameObjectProp(String string)) = "FIRST_NAME = <prettySnowFlake(string)>";

public str prettySnowFlake(ObjectProperties::middleNameObjectProp(String string)) = "MIDDLE_NAME = <prettySnowFlake(string)>";

public str prettySnowFlake(ObjectProperties::lastNameObjectProp(String string)) = "LAST_NAME = <prettySnowFlake(string)>";

public str prettySnowFlake(ObjectProperties::emailObjectProp(String string)) = "EMAIL = <prettySnowFlake(string)>";

public str prettySnowFlake(ObjectProperties::mustChangePasswordObjectProp(Boolean boolVal)) = "MUST_CHANGE_PASSWORD = <prettySnowFlake(trueOrFalse)>";

public str prettySnowFlake(ObjectProperties::disabledObjectProp(Boolean boolVal)) = "DISABLED = <prettySnowFlake(trueOrFalse)>";

public str prettySnowFlake(PrefixString::prefixString(String string)) = "PREFIX = <prettySnowFlake(string)>";

public str prettySnowFlake(ModifiedAfter::modifiedAfter(String string)) = "MODIFIED_AFTER = <prettySnowFlake(string)>";

public str prettySnowFlake(AlterNotificationIntegration::alterNotificationIntegrationOpt1(list[IfExists] ifExistsList, Identifier id,
                                                list[Enabled] enabledList,
                                                CloudProviderParamsAuto cloudProviderParamsAuto,
                                                list[CommentClause] commentClauseList
                                                )) 
                                                = "ALTER INTEGRATION <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> SET <for(enabled <- enabledList) {><prettySnowFlake(enabled)><}> <prettySnowFlake(cloudProviderParamsAuto)> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(AlterNotificationIntegration::alterNotificationIntegrationOpt2(list[IfExists] ifExistsList, Identifier id,
                                                list[Enabled] enabledList,
                                                CloudProviderParamsAuto cloudProviderParamsAuto,
                                                list[CommentClause] commentClauseList
                                                )) 
                                                = "ALTER NOTIFICATION INTEGRATION <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> SET <for(enabled <- enabledList) {><prettySnowFlake(enabled)><}> <prettySnowFlake(cloudProviderParamsAuto)> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(AlterNotificationIntegration::alterNotificationIntegrationOpt3(list[IfExists] ifExistsList, Identifier id,
                                                list[Enabled] enabledList,
                                                CloudProviderParamsPush cloudProviderParamsPush,
                                                list[CommentClause] commentClauseList
                                                ))
                                                = "ALTER INTEGRATION <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> SET <for(enabled <- enabledList) {><prettySnowFlake(enabled)><}> <prettySnowFlake(cloudProviderParamsPush)> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(AlterNotificationIntegration::alterNotificationIntegrationOpt4(list[IfExists] ifExistsList, Identifier id,
                                                list[Enabled] enabledList,
                                                CloudProviderParamsPush cloudProviderParamsPush,
                                                list[CommentClause] commentClauseList
                                                )) 
                                                = "ALTER NOTIFICATION INTEGRATION <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> SET <for(enabled <- enabledList) {><prettySnowFlake(enabled)><}> <prettySnowFlake(cloudProviderParamsPush)> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(AlterNotificationIntegration::alterNotificationIntegrationOpt5(Identifier id, SetTags setTags)) = "ALTER INTEGRATION <prettySnowFlake(id)> <prettySnowFlake(setTags)>";

public str prettySnowFlake(AlterNotificationIntegration::alterNotificationIntegrationOpt6(Identifier id, SetTags setTags)) = "ALTER NOTIFICATION INTEGRATION <prettySnowFlake(id)> <prettySnowFlake(setTags)>";

public str prettySnowFlake(AlterNotificationIntegration::alterNotificationIntegrationOpt7(Identifier id, UnsetTags unsetTags)) = "ALTER INTEGRATION <prettySnowFlake(id)> <prettySnowFlake(unsetTags)>";

public str prettySnowFlake(AlterNotificationIntegration::alterNotificationIntegrationOpt8(Identifier id, UnsetTags unsetTags)) = "ALTER NOTIFICATION INTEGRATION <prettySnowFlake(id)> <prettySnowFlake(unsetTags)>";

public str prettySnowFlake(AlterNotificationIntegration::alterNotificationIntegrationOpt9(IfExists ifExists, Identifier id, AlterEnabledOrComment alterEnabledOrComment)) = "ALTER INTEGRATION <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> UNSET <prettySnowFlake(alterEnabledOrComment)>";

public str prettySnowFlake(AlterNotificationIntegration::alterNotificationIntegrationOpt10(IfExists ifExists, Identifier id, AlterEnabledOrComment alterEnabledOrComment)) = "ALTER NOTIFICATION INTEGRATION <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> UNSET <prettySnowFlake(alterEnabledOrComment)>";

public str prettySnowFlake(CloudProviderParamsAuto::googleCloudParamAuto(String string)) = "NOTIFICATION_PROVIDER = GCP_PUBSUB GCP_PUBSUB_SUBSCRIPTION_NAME = <prettySnowFlake(string)>";

public str prettySnowFlake(CloudProviderParamsAuto::microsoftAzureParamAuto(String string1, String string2)) = "NOTIFICATION_PROVIDER = AZURE_EVENT_GRID AZURE_STORAGE_QUEUE_PRIMARY_URI = <prettySnowFlake(string1)> AZURE_TENANT_ID = <prettySnowFlake(string2)>";

public str prettySnowFlake(CloudProviderParamsPush::amazonAwsParamPush(String string1, String string2)) = "NOTIFICATION_PROVIDER = AWS_SNS AWS_SNS_TOPIC_ARN = <prettySnowFlake(string1)> AWS_SNS_ROLE_ARN = <prettySnowFlake(string2)>";

public str prettySnowFlake(CloudProviderParamsPush::googleCloudParamPush(String string)) = "NOTIFICATION_PROVIDER = GCP_PUBSUB GCP_PUBSUB_TOPIC_NAME = <prettySnowFlake(string)>";

public str prettySnowFlake(CloudProviderParamsPush::microsoftAzureParamPush(String string1, String string2)) = "NOTIFICATION_PROVIDER = AZURE_EVENT_GRID AZURE_EVENT_GRID_TOPIC_ENDPOINT = <prettySnowFlake(string1)> AZURE_TENANT_ID = <prettySnowFlake(string2)>";

public str prettySnowFlake(AlterEnabledOrComment::alterEnabled()) = "ENABLED";

public str prettySnowFlake(AlterEnabledOrComment::alterComment()) = "COMMENT";

public str prettySnowFlake(AlterExternalTable::alterExternalTableRefresh(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, list[String] stringList)) = "ALTER EXTERNAL TABLE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> REFRESH <for(string <- stringList) {><prettySnowFlake(string)><}>";

public str prettySnowFlake(AlterExternalTable::alterExternalTableAddFiles(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, StringList strList)) = "ALTER EXTERNAL TABLE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> ADD FILES ( <prettySnowFlake(stringList)> )";

public str prettySnowFlake(AlterExternalTable::alterExternalTableRemoveFiles(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, StringList strList)) = "ALTER EXTERNAL TABLE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> REMOVE FILES ( <prettySnowFlake(stringList)> )";

public str prettySnowFlake(AlterExternalTable::alterExternalTableSet(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier,
                                        list[AutoRefresh] autoRefreshList, 
                                        list[TagDeclList] tagDeclList
                                        )) 
                                        = "ALTER EXTERNAL TABLE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> SET <for(autoRefresh <- autoRefreshList) {><prettySnowFlake(autoRefresh)><}> <for(tagDecl <- tagDeclList) {><prettySnowFlake(tagDecl)><}>";

public str prettySnowFlake(AlterExternalTable::alterExternalTableUnset(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, UnsetTags unsetTags)) = "ALTER EXTERNAL TABLE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> <prettySnowFlake(unsetTags)>";

public str prettySnowFlake(AlterExternalTable::alterExternalTableAddPartition(ObjectColumnNameOrIdentifier objNameOrId, list[IfExists] ifExistsList, ColumnNameStringList columnNameStringList, String string)) = "ALTER EXTERNAL TABLE <prettySnowFlake(objNameOrId)> <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> ADD PARTITION ( <prettySnowFlake(columnNameStringList)> ) LOCATION <prettySnowFlake(string)>";

public str prettySnowFlake(AlterExternalTable::alterExternalTableDropPartition(ObjectColumnNameOrIdentifier objNameOrId, list[IfExists] ifExistsList, String string)) = "ALTER EXTERNAL TABLE <prettySnowFlake(objNameOrId)> <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> DROP PARTITION LOCATION <prettySnowFlake(string)>";

public str prettySnowFlake(AutoRefresh::autoRefresh(Boolean boolVal)) = "AUTO_REFRESH = <prettySnowFlake(trueOrFalse)>";

public str prettySnowFlake(ColumnNameString::columnNameString(ObjectColumnNameOrIdentifier objNameOrId, String string)) = "<prettySnowFlake(objNameOrId)> = <prettySnowFlake(string)>";

public str prettySnowFlake(ColumnNameStringList::columnNameStringList(list[ColumnNameString] columnNameStringList)) = "<intercalate(", ", [ prettySnowFlake(columnNameString) | columnNameString <- columnNameStringList ])>";

public str prettySnowFlake(AlterResourceMonitor::alterResourceMonitor(list[IfExists] ifExistsList, Identifier id, list[SetResourceOpts] setResourceOptsList, list[NotifyTriggers] notifyTriggersList)) = "ALTER RESOURCE MONITOR <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> <for(setResourceOpts <- setResourceOptsList) {><prettySnowFlake(setResourceOpts)><}> <for(notifyTriggers <- notifyTriggersList) {><prettySnowFlake(notifyTriggers)><}>";

public str prettySnowFlake(SetResourceOpts::setResourceOpts(list[CreditQuota] creditQuotaList, list[Frequency] frequencyList, list[StartTimeStamp] startTimeStampList, list[EndTimeStamp] endTimeStampList)) = "SET <for(creditQuota <- creditQuotaList) {><prettySnowFlake(creditQuota)><}> <for(frequency <- frequencyList) {><prettySnowFlake(frequency)><}> <for(startTimeStamp <- startTimeStampList) {><prettySnowFlake(startTimeStamp)><}> <for(endTimeStamp <- endTimeStampList) {><prettySnowFlake(endTimeStamp)><}>";

public str prettySnowFlake(CreditQuota::creditQuota(str integer)) = "CREDIT_QUOTA = <integer>";

public str prettySnowFlake(StartTimeStamp::startTimeStamp(String string)) = "START_TIMESTAMP = <prettySnowFlake(string)>";

public str prettySnowFlake(EndTimeStamp::endTimeStamp(String string)) = "END_TIMESTAMP = <prettySnowFlake(string)>";

public str prettySnowFlake(Frequency::frequency(FrequencyOpts frequencyOpts)) = "FREQUENCY = <prettySnowFlake(frequencyOpts)>";

public str prettySnowFlake(FrequencyOpts::monthlyFrequency()) = "MONTHLY";

public str prettySnowFlake(FrequencyOpts::dailyFrequency()) = "DAILY";

public str prettySnowFlake(FrequencyOpts::weeklyFrequency()) = "WEEKLY";

public str prettySnowFlake(FrequencyOpts::yearlyFrequency()) = "YEARLY";

public str prettySnowFlake(FrequencyOpts::neverFrequency()) = "NEVER";

public str prettySnowFlake(NotifyTriggers::notifyTriggers(NotifyUsers notifyUsers, list[Triggers] triggersList)) = "<prettySnowFlake(notifyUsers)> <for(triggers <- triggersList) {><prettySnowFlake(triggers)><}>";

public str prettySnowFlake(NotifyUsers::notifyUsers(list[Identifier] idList)) = "NOTIFY_USERS = ( <intercalate(", ", [ prettySnowFlake(id) | id <- idList ])> )";

public str prettySnowFlake(Triggers::triggers(list[TriggerDefinition] triggerDefinitionList)) = "TRIGGERS <for(triggerDefinition <- triggerDefinitionList) {><prettySnowFlake(triggerDefinition)> <}>";

public str prettySnowFlake(TriggerDefinition::triggerDefinition(str integer, SuspendType suspendType)) = "ON <integer> PERCENT DO <prettySnowFlake(suspendType)>";

public str prettySnowFlake(SuspendType::suspendTypeOpt1()) = "SUSPEND";

public str prettySnowFlake(SuspendType::suspendTypeOpt2()) = "SUSPEND_IMMEDIATE";

public str prettySnowFlake(SuspendType::suspendTypeOpt3()) = "NOTIFY";

public str prettySnowFlake(AlterSequence::alterSequenceRenameTo(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId1, ObjectColumnNameOrIdentifier objNameOrId2)) = "ALTER SEQUENCE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId1)> RENAME TO <prettySnowFlake(objNameOrId2)>";

public str prettySnowFlake(AlterSequence::alterSequenceSetIncrementBy(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, list[IncrementBy] incrementByList)) = "ALTER SEQUENCE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> SET <for(incrementBy <- incrementByList) {><prettySnowFlake(incrementBy)><}>";

public str prettySnowFlake(AlterSequence::alterSequenceIncrementBy(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId,  list[IncrementBy] incrementByList)) = "ALTER SEQUENCE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> <for(incrementBy <- incrementByList) {><prettySnowFlake(incrementBy)><}>";

public str prettySnowFlake(AlterSequence::alterSequenceSetOrderComment(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, OrderComment orderComment)) = "ALTER SEQUENCE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> SET <prettySnowFlake(orderComment)>";

public str prettySnowFlake(AlterSequence::alterSequenceUnsetComment(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId)) = "ALTER SEQUENCE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> UNSET COMMENT";

public str prettySnowFlake(IncrementBy::incrementByOpt1(str integer)) = "INCREMENT = <integer>";

public str prettySnowFlake(IncrementBy::incrementByOpt2(str integer)) = "INCREMENT BY = <integer>";

public str prettySnowFlake(IncrementBy::incrementByOpt3(str integer)) = "INCREMENT <integer>";

public str prettySnowFlake(IncrementBy::incrementByOpt4(str integer)) = "INCREMENT BY <integer>";

public str prettySnowFlake(OrderComment::orderCommentOpt1(list[OrderNoOrder] orderNoOrderList, CommentClause commentClauseList)) = "<for(orderNoOrder <- orderNoOrderList) {><prettySnowFlake(orderNoOrder)><}> <prettySnowFlake(commentClauseList)>";

public str prettySnowFlake(OrderComment::orderCommentOpt2(OrderNoOrder orderNoOrder)) = "<prettySnowFlake(orderNoOrder)>";

public str prettySnowFlake(OrderNoOrder::orderNoOrder1()) = "ORDER";

public str prettySnowFlake(OrderNoOrder::orderNoOrder2()) = "NOORDER";

// Create Command

public str prettySnowFlake(CreateCommand::createViewCommand(CreateView createView)) = "<prettySnowFlake(createView)>";

public str prettySnowFlake(CreateCommand::createTableCommand(CreateTable createTable)) = "<prettySnowFlake(createTable)>";

public str prettySnowFlake(CreateCommand::createTableAsSelectCommand(CreateTableAsSelect createTableAsSelect)) = "<prettySnowFlake(createTableAsSelect)>";

public str prettySnowFlake(CreateCommand::createTableLikeCommand(CreateTableLike createTableLike)) = "<prettySnowFlake(createTableLike)>";

public str prettySnowFlake(CreateCommand::createDatabaseCommand(CreateDatabase createDatabase)) = "<prettySnowFlake(createDatabase)>";

public str prettySnowFlake(CreateCommand::createSchemaCommand(CreateSchema createSchema)) = "<prettySnowFlake(createSchema)>";

public str prettySnowFlake(CreateCommand::createAccountCommand(CreateAccount createAccount)) = "<prettySnowFlake(createAccount)>";

public str prettySnowFlake(CreateCommand::createFileFormatCommand(CreateFileFormat createFileFormat)) = "<prettySnowFlake(createFileFormat)>";

public str prettySnowFlake(CreateCommand::createUserCommand(CreateUser createUser)) = "<prettySnowFlake(createUser)>";

public str prettySnowFlake(CreateCommand::createConnectionCommand(CreateConnection createConnection)) = "<prettySnowFlake(createConnection)>";

public str prettySnowFlake(CreateCommand::createDynamicTableCommand(CreateDynamicTable createDynamicTable)) = "<prettySnowFlake(createDynamicTable)>";

public str prettySnowFlake(CreateCommand::createEventTableCommand(CreateEventTable createEventTable)) = "<prettySnowFlake(createEventTable)>";

public str prettySnowFlake(CreateCommand::createFailoverGroupCommand(CreateFailoverGroup createFailoverGroup)) = "<prettySnowFlake(createFailoverGroup)>";

public str prettySnowFlake(CreateCommand::createManagedAccountCommand(CreateManagedAccount createManagedAccount)) = "<prettySnowFlake(createManagedAccount)>";

public str prettySnowFlake(CreateCommand::createNetworkPolicyCommand(CreateNetworkPolicy createNetworkPolicy)) = "<prettySnowFlake(createNetworkPolicy)>";

public str prettySnowFlake(CreateCommand::createApiIntegrationCommand(CreateApiIntegration createApiIntegration)) = "<prettySnowFlake(createApiIntegration)>";

public str prettySnowFlake(CreateCommand::createExternalFunctionCommand(CreateExternalFunction createExternalFunction)) = "<prettySnowFlake(createExternalFunction)>";

public str prettySnowFlake(CreateCommand::createExternalTableCommand(CreateExternalTable createExternalTable)) = "<prettySnowFlake(createExternalTable)>";

public str prettySnowFlake(CreateCommand::createFunctionCommand(CreateFunction createFunction)) = "<prettySnowFlake(createFunction)>";

public str prettySnowFlake(CreateCommand::createMaskingPolicyCommand(CreateMaskingPolicy createMaskingPolicy)) = "<prettySnowFlake(createMaskingPolicy)>";

public str prettySnowFlake(CreateCommand::createMaterializedViewCommand(CreateMaterializedView createMaterializedView)) = "<prettySnowFlake(createMaterializedView)>";

public str prettySnowFlake(CreateCommand::createNotificationIntegrationCommand(CreateNotificationIntegration createNotificationIntegration)) = "<prettySnowFlake(createNotificationIntegration)>";

public str prettySnowFlake(CreateCommand::createProcedureCommand(CreateProcedure createProcedure)) = "<prettySnowFlake(createProcedure)>";

public str prettySnowFlake(CreateCommand::createPipeCommand(CreatePipe createPipe)) = "<prettySnowFlake(createPipe)>";

public str prettySnowFlake(CreateCommand::createRoleCommand(CreateRole createRole)) = "<prettySnowFlake(createRole)>";

public str prettySnowFlake(CreateCommand::createRowAccessPolicyCommand(CreateRowAccessPolicy createRowAccessPolicy)) = "<prettySnowFlake(createRowAccessPolicy)>";

public str prettySnowFlake(CreateCommand::createReplicationGroupCommand(CreateReplicationGroup createReplicationGroup)) = "<prettySnowFlake(createReplicationGroup)>";

public str prettySnowFlake(CreateCommand::createResourceMonitorCommand(CreateResourceMonitor createResourceMonitor)) = "<prettySnowFlake(createResourceMonitor)>";

public str prettySnowFlake(CreateCommand::createSequenceCommand(CreateSequence createSequence)) = "<prettySnowFlake(createSequence)>";

public str prettySnowFlake(CreateCommand::createSessionPolicyCommand(CreateSessionPolicy createSessionPolicy)) = "<prettySnowFlake(createSessionPolicy)>";

public str prettySnowFlake(CreateCommand::createShareCommand(CreateShare createShare)) = "<prettySnowFlake(createShare)>";

public str prettySnowFlake(CreateDatabase::createDatabaseWithTransient(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, Identifier id,
                                        list[CloneAtBefore] cloneAtBeforeList,
                                        list[DataRetentionTime] dataRetentionTimeList,
                                        list[MaxDataExtentionTime] maxDataExtentionTimeList,
                                        list[DefaultDdlCollation] defaultDdlCollationList,
                                        list[WithTags] withTagsList,
                                        list[CommentClause] commentClauseList)) 
                                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> TRANSIENT DATABASE <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(id)> <for(cloneAtBefore <- cloneAtBeforeList) {><prettySnowFlake(cloneAtBefore)><}> <for(dataRetentionTime <- dataRetentionTimeList) {><prettySnowFlake(dataRetentionTime)><}> <for(maxDataExtentionTime <- maxDataExtentionTimeList) {><prettySnowFlake(maxDataExtentionTime)><}> <for(defaultDdlCollation <- defaultDdlCollationList) {><prettySnowFlake(defaultDdlCollation)><}> <for(withTags <- withTagsList) {><prettySnowFlake(withTags)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(CreateDatabase::createDatabaseNoTransient(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, Identifier id,
                                        list[CloneAtBefore] cloneAtBeforeList,
                                        list[DataRetentionTime] dataRetentionTimeList,
                                        list[MaxDataExtentionTime] maxDataExtentionTimeList,
                                        list[DefaultDdlCollation] defaultDdlCollationList,
                                        list[WithTags] withTagsList,
                                        list[CommentClause] commentClauseList)) 
                                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> DATABASE <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(id)> <for(cloneAtBefore <- cloneAtBeforeList) {><prettySnowFlake(cloneAtBefore)><}> <for(dataRetentionTime <- dataRetentionTimeList) {><prettySnowFlake(dataRetentionTime)><}> <for(maxDataExtentionTime <- maxDataExtentionTimeList) {><prettySnowFlake(maxDataExtentionTime)><}> <for(defaultDdlCollation <- defaultDdlCollationList) {><prettySnowFlake(defaultDdlCollation)><}> <for(withTags <- withTagsList) {><prettySnowFlake(withTags)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(OrReplace::orReplace()) = "OR REPLACE";

public str prettySnowFlake(IfNotExists::ifNotExists()) = "IF NOT EXISTS";

public str prettySnowFlake(CloneAtBefore::cloneAtBefore(ObjectColumnNameOrIdentifier objNameOrId, list[CloneOptional] cloneOptionalList)) = "CLONE <prettySnowFlake(objNameOrId)> <for(cloneOptional <- cloneOptionalList) {><prettySnowFlake(cloneOptional)><}>";

public str prettySnowFlake(CloneOptional::cloneTimeStamp(AtOrBefore atOrBefore, String string)) = "<prettySnowFlake(atOrBefore)>( TIMESTAMP =\> <prettySnowFlake(string)> )";

public str prettySnowFlake(CloneOptional::cloneOffset(AtOrBefore atOrBefore, String string)) = "<prettySnowFlake(atOrBefore)>( OFFSET =\> <prettySnowFlake(string)> )";

public str prettySnowFlake(CloneOptional::cloneStatement(AtOrBefore atOrBefore, Identifier id)) = "<prettySnowFlake(atOrBefore)>( STATEMENT =\> <prettySnowFlake(id)> )";

public str prettySnowFlake(CloneOptional::cloneStream(AtOrBefore atOrBefore, String string)) = "<prettySnowFlake(atOrBefore)>( STREAM =\> <prettySnowFlake(string)> )";

public str prettySnowFlake(AtOrBefore::atOrBeforeOpt1()) = "AT";

public str prettySnowFlake(AtOrBefore::atOrBeforeOpt2()) = "BEFORE";

public str prettySnowFlake(DataRetentionTime::dataRetentionTime(Number number)) = "DATA_RETENTION_TIME_IN_DAYS = <prettySnowFlake(number)>";

public str prettySnowFlake(MaxDataExtentionTime::maxDataExtentionTime(Number number)) = "MAX_DATA_EXTENSION_TIME_IN_DAYS = <prettySnowFlake(number)>";

public str prettySnowFlake(WithTags::withTags(list[TagDecl] tagDeclList)) = "WITH TAG ( <intercalate(", ", [ prettySnowFlake(tagDecl) | tagDecl <- tagDeclList ])> )";

public str prettySnowFlake(WithTags::withTagsNoWith(list[TagDecl] tagDeclList)) = "TAG ( <intercalate(", ", [ prettySnowFlake(tagDecl) | tagDecl <- tagDeclList ])> )";

public str prettySnowFlake(CreateSchema::createSchemaWithTransient(list[OrReplace] orReplaceList, list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                list[CloneAtBefore] cloneAtBeforeList,
                                list[WithManagedAccess] withManagedAccessList,
                                list[DataRetentionTime] dataRetentionTimeList,
                                list[MaxDataExtentionTime] maxDataExtentionTimeList,
                                list[DefaultDdlCollation] defaultDdlCollationList,
                                list[WithTags] withTagsList,
                                list[CommentClause] commentClauseList)) 
                                = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> TRANSIENT SCHEMA <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> <for(cloneAtBefore <- cloneAtBeforeList) {><prettySnowFlake(cloneAtBefore)><}> <for(withManagedAccess <- withManagedAccessList) {><prettySnowFlake(withManagedAccess)><}> <for(dataRetentionTime <- dataRetentionTimeList) {><prettySnowFlake(dataRetentionTime)><}> <for(maxDataExtentionTime <- maxDataExtentionTimeList) {><prettySnowFlake(maxDataExtentionTime)><}> <for(defaultDdlCollation <- defaultDdlCollationList) {><prettySnowFlake(defaultDdlCollation)><}> <for(withTags <- withTagsList) {><prettySnowFlake(withTags)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(CreateSchema::createSchemaNoTransient(list[OrReplace] orReplaceList, list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                list[CloneAtBefore] cloneAtBeforeList,
                               list[WithManagedAccess] withManagedAccessList,
                                list[DataRetentionTime] dataRetentionTimeList,
                                list[MaxDataExtentionTime] maxDataExtentionTimeList,
                                list[DefaultDdlCollation] defaultDdlCollationList,
                                list[WithTags] withTagsList,
                                list[CommentClause] commentClauseList))
                                = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> SCHEMA <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> <for(cloneAtBefore <- cloneAtBeforeList) {><prettySnowFlake(cloneAtBefore)><}> <for(withManagedAccess <- withManagedAccessList) {><prettySnowFlake(withManagedAccess)><}> <for(dataRetentionTime <- dataRetentionTimeList) {><prettySnowFlake(dataRetentionTime)><}> <for(maxDataExtentionTime <- maxDataExtentionTimeList) {><prettySnowFlake(maxDataExtentionTime)><}> <for(defaultDdlCollation <- defaultDdlCollationList) {><prettySnowFlake(defaultDdlCollation)><}> <for(withTags <- withTagsList) {><prettySnowFlake(withTags)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(WithManagedAccess::withManagedAccess()) = "WITH MANAGED ACCESS";

public str prettySnowFlake(FormatType::csv_()) = "CSV";

public str prettySnowFlake(FormatType::json_()) = "JSON";

public str prettySnowFlake(FormatType::avro_()) = "AVRO";

public str prettySnowFlake(FormatType::orc_()) = "ORC";

public str prettySnowFlake(FormatType::parquet_()) = "PARQUET";

public str prettySnowFlake(FormatType::xml_()) = "XML";

public str prettySnowFlake(FormatType::csv_q()) = "\'CSV\'";

public str prettySnowFlake(FormatType::json_q()) = "\'JSON\'";

public str prettySnowFlake(FormatType::avro_q()) = "\'AVRO\'";

public str prettySnowFlake(FormatType::orc_q()) = "\'ORC\'";

public str prettySnowFlake(FormatType::parquet_q()) = "\'PARQUET\'";

public str prettySnowFlake(FormatType::xml_q()) = "\'XML\'";

public str prettySnowFlake(CreateTable::createTable(list[OrReplace] orReplaceList, list[TableType] tableTypeList, list[IfNotExistsObjectName] ifNotExistsObjectNameList, list[CloneAtBefore] cloneAtBeforeList, list[CreateTableOrCommentClause] createTableOrCommentClauseList)) 
                            = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> <for(tableType <- tableTypeList) {><prettySnowFlake(tableType)><}> TABLE <for(ifNotExistsObjectName <- ifNotExistsObjectNameList) {><prettySnowFlake(ifNotExistsObjectName)><}> <for(cloneAtBefore <- cloneAtBeforeList) {><prettySnowFlake(cloneAtBefore)><}> <for(createTableOrCommentClause <- createTableOrCommentClauseList) {><prettySnowFlake(createTableOrCommentClause)><}>";

public str prettySnowFlake(CreateTableOrCommentClause::createTableOrCommentClauseOpt1(CreateTableClause createTableClause)) = "<prettySnowFlake(createTableClause)>";

public str prettySnowFlake(CreateTableOrCommentClause::createTableOrCommentClauseOpt2(CommentClause commentClause)) = "<prettySnowFlake(commentClause)>";

public str prettySnowFlake(CreateTableClause::createTableClause(ColumnDeclItemListWithBrackets columnDeclItemListWithBrackets,
                                        list[ClusterBy] clusterByList,
                                        list[StageFileFormat] stageFileFormatList,
                                        list[StageCopyEqCopyOptions] stageCopyEqCopyOptionsList,
                                        list[DataRetentionTimeEqInt] dataRetentionTimeEqIntList,
                                        list[MaxDataExtentionTimeEqInt] maxDataExtentionTimeEqIntList,
                                        list[ChangeTracking] changeTrackingList,
                                        list[DefaultDdlCollation] defaultDdlCollationList,
                                        list[CopyGrants] copyGrantsList,
                                        list[WithRowAccessPolicy] withRowAccessPolicyList,
                                        list[WithTags] withTagsList
                        )) 
                        = "<prettySnowFlake(columnDeclItemListWithBrackets)> <for(clusterBy <- clusterByList) {><prettySnowFlake(clusterBy)><}> <for(stageFileFormat <- stageFileFormatList) {><prettySnowFlake(stageFileFormat)><}> <for(stageCopyEqCopyOptions <- stageCopyEqCopyOptionsList) {><prettySnowFlake(stageCopyEqCopyOptions)><}> <for(dataRetentionTimeEqInt <- dataRetentionTimeEqIntList) {><prettySnowFlake(dataRetentionTimeEqInt)><}> <for(maxDataExtentionTimeEqInt <- maxDataExtentionTimeEqIntList) {><prettySnowFlake(maxDataExtentionTimeEqInt)><}> <for(changeTracking <- changeTrackingList) {><prettySnowFlake(changeTracking)><}> <for(defaultDdlCollation <- defaultDdlCollationList) {><prettySnowFlake(defaultDdlCollation)><}> <for(copyGrants <- copyGrantsList) {><prettySnowFlake(copyGrants)><}> <for(withRowAccessPolicy <- withRowAccessPolicyList) {><prettySnowFlake(withRowAccessPolicy)><}> <for(withTags <- withTagsList) {><prettySnowFlake(withTags)><}>";

public str prettySnowFlake(ColumnDeclItem::fullColItem(FullColDecl fullColDecl)) = "<prettySnowFlake(fullColDecl)>";

public str prettySnowFlake(ColumnDeclItem::outOfLineConstraintItem(OutOfLineConstraint outOfLineConstraint)) = "<prettySnowFlake(outOfLineConstraint)>";

public str prettySnowFlake(ColumnDeclItemList::columnDeclItemList(list[ColumnDeclItem] colDeclItemList)) = "<intercalate(", ", [ prettySnowFlake(colDeclItem) | colDeclItem <- colDeclItemList ])>";

public str prettySnowFlake(ColumnDeclItemListWithBrackets::columnDeclItemListWithBrackets(ColumnDeclItemList columnDeclarationItemList)) = "( <prettySnowFlake(columnDeclarationItemList)> )";

public str prettySnowFlake(FullColDecl::fullColDecl(ColDecl colDecl, list[FullColDeclOptionals] fullColDeclOptionalsList, list[WithMaskingPolicy] withMaskingPolicyList, list[WithTags] withTagsList, list[CommentString] commentStringList)) = "<prettySnowFlake(colDecl)> <for(fullColDeclOptionals <- fullColDeclOptionalsList) {><prettySnowFlake(fullColDeclOptionals)> <}> <for(withMaskingPolicy <- withMaskingPolicyList) {><prettySnowFlake(withMaskingPolicy)><}> <for(withTags <- withTagsList) {><prettySnowFlake(withTags)><}> <for(commentString <- commentStringList) {><prettySnowFlake(commentString)><}>";

public str prettySnowFlake(OutOfLineConstraint::outOfLineConstraint(list[ConstraintId] constraintIdList, OutOfLineConstraintOptionals outOfLineConstraintOptionals)) = "<for(constraintId <- constraintIdList) {><prettySnowFlake(constraintId)><}> <prettySnowFlake(outOfLineConstraintOptionals)>";

public str prettySnowFlake(ColDecl::colDecl(IdentifierType idType, DataType dataType)) = "<prettySnowFlake(idType)> <prettySnowFlake(dataType)>";

public str prettySnowFlake(FullColDeclOptionals::fullColDeclOptCollate(Collate collate)) = "<prettySnowFlake(collate)>";

public str prettySnowFlake(FullColDeclOptionals::fullColDeclOptInline(InlineConstraint inlineConstraint)) = "<prettySnowFlake(inlineConstraint)>";

public str prettySnowFlake(FullColDeclOptionals::fullColDeclOptDefault(DefaultValue defaultValue)) = "<prettySnowFlake(defaultValue)>";

public str prettySnowFlake(FullColDeclOptionals::fullColDeclOptNullNotNull(NullNotNull nullNotNull)) = "<prettySnowFlake(nullNotNull)>";

public str prettySnowFlake(InlineConstraint::inlineConstraintUnique(list[ConstraintId] constraintIdList, UniquePrimaryKey uniquePrimaryKey, list[CommonConstraintProperties] commonConstraintPropertiesList)) = "<for(constraintId <- constraintIdList) {><prettySnowFlake(constraintId)><}> <prettySnowFlake(uniquePrimaryKey)> <for(commonConstraintProperties <- commonConstraintPropertiesList) {><prettySnowFlake(commonConstraintProperties)> <}>";

public str prettySnowFlake(InlineConstraint::inlineConstraintForeign(list[NullNotNull] nullNotNullList, list[ConstraintId] constraintIdList, ForeignKey foreignKey, ObjectColumnNameOrIdentifier objNameOrId, list[ColumnNameWithBrackets] columnNameWithBracketsList, ConstraintProperties constraintProperties)) = "<for(nullNotNull <- nullNotNullList) {><prettySnowFlake(nullNotNull)><}> <for(constraintId <- constraintIdList) {><prettySnowFlake(constraintId)><}> <prettySnowFlake(foreignKey)> REFERENCES <prettySnowFlake(objNameOrId)> <for(columnNameWithBrackets <- columnNameWithBracketsList) {><prettySnowFlake(columnNameWithBrackets)><}> <prettySnowFlake(constraintProperties)>";

public str prettySnowFlake(ConstraintId::constraintId(Identifier id)) = "CONSTRAINT <prettySnowFlake(id)>";

public str prettySnowFlake(UniquePrimaryKey::uniquePrimaryKeyOpt1()) = "UNIQUE";

public str prettySnowFlake(UniquePrimaryKey::uniquePrimaryKeyOpt2(PrimaryKey primaryKey)) = "<prettySnowFlake(primaryKey)>";

public str prettySnowFlake(PrimaryKey::primaryKey()) = "PRIMARY KEY";

public str prettySnowFlake(ForeignKey::foreignKey()) = "FOREIGN KEY";

public str prettySnowFlake(CommonConstraintProperties::enforcedConstraintProp(EnforcedNotEnforced enforcedNotEnforced, list[ValidateNoValidate] validateNoValidateList)) = "<prettySnowFlake(enforcedNotEnforced)> <for(validateNoValidate <- validateNoValidateList) {><prettySnowFlake(validateNoValidate)><}>";

public str prettySnowFlake(CommonConstraintProperties::defferableConstraintProp(DeferrableNotDeferrable deferrableNotDeferrable)) = "<prettySnowFlake(deferrableNotDeferrable)>";

public str prettySnowFlake(CommonConstraintProperties::initiallyConstraintProp(InitiallyDeferredOrImmediate initiallyDeferredOrImmediate)) = "<prettySnowFlake(initiallyDeferredOrImmediate)>";

public str prettySnowFlake(CommonConstraintProperties::enableConstraintProp(EnableDisable enableDisable, list[ValidateNoValidate] validateNoValidateList)) = "<prettySnowFlake(enableDisable)> <for(validateNoValidate <- validateNoValidateList) {><prettySnowFlake(validateNoValidate)><}>";

public str prettySnowFlake(CommonConstraintProperties::relyConstraintProp()) = "RELY";

public str prettySnowFlake(CommonConstraintProperties::norelyConstraintProp()) = "NORELY";

public str prettySnowFlake(EnforcedNotEnforced::enforcedNotEnforced()) = "NOT ENFORCED";

public str prettySnowFlake(EnforcedNotEnforced::enforcedNotEnforcedNoNot()) = "ENFORCED";

public str prettySnowFlake(DeferrableNotDeferrable::deferrableNotDeferrable()) = "NOT DEFERRABLE";

public str prettySnowFlake(DeferrableNotDeferrable::deferrableNotDeferrableNoNot()) = "DEFERRABLE";

public str prettySnowFlake(ValidateNoValidate::validateNoValidateOpt1()) = "VALIDATE";

public str prettySnowFlake(ValidateNoValidate::validateNoValidateOpt2()) = "NOVALIDATE";

public str prettySnowFlake(InitiallyDeferredOrImmediate::initiallyDeferred()) = "INITIALLY DEFERRED";

public str prettySnowFlake(InitiallyDeferredOrImmediate::initiallyImmediate()) = "INITIALLY IMMEDIATE";

public str prettySnowFlake(ColumnNameWithBrackets::columnNameWithBrackets(ObjectColumnNameOrIdentifier objNameOrId)) = "( <prettySnowFlake(objNameOrId)> )";

public str prettySnowFlake(ConstraintProperties::constraintPropStar(list[CommonConstraintProperties] commonConstraintPropertiesList)) = "<for(commonConstraintProperties <- commonConstraintPropertiesList) {><prettySnowFlake(commonConstraintProperties)> <}>";

public str prettySnowFlake(ConstraintProperties::constraintPropForeign(list[ForeignKeyOnActionToggle] foreignKeyOnActionToggleList)) = "<for(foreignKeyOnActionToggle <- foreignKeyOnActionToggleList) {><prettySnowFlake(foreignKeyOnActionToggle)> <}>";

public str prettySnowFlake(ForeignKeyOnActionToggle::foreignKeyOnActionToggleOpt1(ForeignKeyMatch foreignKeyMatch)) = "<prettySnowFlake(foreignKeyMatch)>";

public str prettySnowFlake(ForeignKeyOnActionToggle::foreignKeyOnActionToggleOpt2(OnUpdate onUpdate)) = "<prettySnowFlake(onUpdate)>";

public str prettySnowFlake(ForeignKeyOnActionToggle::foreignKeyOnActionToggleOpt3(OnDelete onDelete)) = "<prettySnowFlake(onDelete)>";

public str prettySnowFlake(ForeignKeyMatch::matchFull()) = "MATCH FULL";

public str prettySnowFlake(ForeignKeyMatch::matchPartial()) = "MATCH PARTIAL";

public str prettySnowFlake(ForeignKeyMatch::matchSimple()) = "MATCH SIMPLE";

public str prettySnowFlake(OnUpdate::onUpdate(OnAction onAction)) = "ON UPDATE <prettySnowFlake(onAction)>";

public str prettySnowFlake(OnDelete::onDelete(OnAction onAction)) = "ON DELETE <prettySnowFlake(onAction)>";

public str prettySnowFlake(OnAction::cascadeAction()) = "CASCADE";

public str prettySnowFlake(OnAction::setNullAction()) = "SET NULL";

public str prettySnowFlake(OnAction::setDefaultAction()) = "SET DEFAULT";

public str prettySnowFlake(OnAction::restrictAction()) = "RESTRICT";

public str prettySnowFlake(OnAction::noAction()) = "NO ACTION";

public str prettySnowFlake(DefaultValue::defaultExpVal(Exp exp)) = "DEFAULT <prettySnowFlake(exp)>";

public str prettySnowFlake(DefaultValue::autoIncrementVal(list[StartWithIncrementBy] startWithIncrementByList, list[OrderNoOrder] orderNoOrderList)) = "AUTOINCREMENT <for(startWithIncrementBy <- startWithIncrementByList) {><prettySnowFlake(startWithIncrementBy)><}> <for(orderNoOrder <- orderNoOrderList) {><prettySnowFlake(orderNoOrder)><}>";

public str prettySnowFlake(DefaultValue::identityVal(list[StartWithIncrementBy] startWithIncrementByList, list[OrderNoOrder] orderNoOrderList)) = "IDENTITY <for(startWithIncrementBy <- startWithIncrementByList) {><prettySnowFlake(startWithIncrementBy)><}> <for(orderNoOrder <- orderNoOrderList) {><prettySnowFlake(orderNoOrder)><}>";

public str prettySnowFlake(StartWithIncrementBy::startWithIncrementByOpt1(ListOfIntWithBracket listOfIntWithBracket)) = "<prettySnowFlake(listOfIntWithBracket)>";

public str prettySnowFlake(StartWithIncrementBy::startWithIncrementByOpt2(StartWith startWith)) = "<prettySnowFlake(startWith)>";

public str prettySnowFlake(StartWithIncrementBy::startWithIncrementByOpt3(IncrementBy incrementBy)) = "<prettySnowFlake(incrementBy)>";

public str prettySnowFlake(StartWithIncrementBy::startWithIncrementByOpt4(StartWith startWith, IncrementBy incrementBy)) = "<prettySnowFlake(startWith)> <prettySnowFlake(incrementBy)>";

public str prettySnowFlake(StartWith::startWithOpt1(str integer)) = "START <integer>";

public str prettySnowFlake(StartWith::startWithOpt2(str integer)) = "START WITH = <integer>";

public str prettySnowFlake(StartWith::startWithOpt3(str integer)) = "START = <integer>";

public str prettySnowFlake(StartWith::startWithOpt4(str integer)) = "START WITH <integer>";

public str prettySnowFlake(WithMaskingPolicy::withMaskingPolicy(Identifier id, list[UsingColumnList] usingColumnList)) = "WITH MASKING POLICY <prettySnowFlake(id)> <for(usingColumn <- usingColumnList) {><prettySnowFlake(usingColumn)><}>";

public str prettySnowFlake(WithMaskingPolicy::withMaskingPolicyNoWith(Identifier id, list[UsingColumnList] usingColumnList)) = "MASKING POLICY <prettySnowFlake(id)> <for(usingColumn <- usingColumnList) {><prettySnowFlake(usingColumn)><}>";

public str prettySnowFlake(CommentString::commentString(String string)) = "COMMENT <prettySnowFlake(string)>";

public str prettySnowFlake(OutOfLineConstraintOptionals::outOfLineConstraintUnique(UniquePrimaryKey uniquePrimaryKey, ColumnListWithBrackets columnListWithBrackets, list[CommonConstraintProperties] commonConstraintPropertiesList)) = "<prettySnowFlake(uniquePrimaryKey)> <prettySnowFlake(columnListWithBrackets)> <for(commonConstraintProperties <- commonConstraintPropertiesList) {><prettySnowFlake(commonConstraintProperties)> <}>";

public str prettySnowFlake(OutOfLineConstraintOptionals::outOfLineConstraintForeign(ForeignKey foreignKey, ColumnListWithBrackets columnListWithBrackets1, ObjectColumnNameOrIdentifier objNameOrId, ColumnListWithBrackets columnListWithBrackets2, ConstraintProperties constraintProperties)) = "<prettySnowFlake(foreignKey)> <prettySnowFlake(columnListWithBrackets1)> REFERENCES <prettySnowFlake(objNameOrId)> <prettySnowFlake(columnListWithBrackets2)> <prettySnowFlake(constraintProperties)>";

public str prettySnowFlake(ClusterBy::clusterBy(ExpListWithBrackets expListWithBrackets)) = "CLUSTER BY <prettySnowFlake(expListWithBrackets)>";

public str prettySnowFlake(StageFileFormat::stageFileFormatOpt1(String string)) = "STAGE_FILE_FORMAT = ( FORMAT_NAME = <prettySnowFlake(string)> )";

public str prettySnowFlake(StageFileFormat::stageFileFormatOpt2(FormatType formatType, list[FormatTypeOptions] formatTypeOptionsList)) = "STAGE_FILE_FORMAT = ( TYPE = <prettySnowFlake(formatType)> <for(formatTypeOptions <- formatTypeOptionsList) {><prettySnowFlake(formatTypeOptions)> <}> )";

public str prettySnowFlake(StageCopyEqCopyOptions::stageCopyEqCopyOptions(CopyOptions copyOptions)) = "STAGE_COPY_OPTIONS = ( <prettySnowFlake(copyOptions)> )";

public str prettySnowFlake(CopyOptions::onErrorOpts(OnErrorAction onErrorAction)) = "ON_ERROR = <prettySnowFlake(onErrorAction)>";

public str prettySnowFlake(CopyOptions::sizeLimitInt(str integer)) = "SIZE_LIMIT = <integer>";

public str prettySnowFlake(CopyOptions::purgeTrueOrFalse(Boolean boolVal)) = "PURGE = <prettySnowFlake(trueOrFalse)>";

public str prettySnowFlake(CopyOptions::returnedFailedOnly(Boolean boolVal)) = "RETURN_FAILED_ONLY = <prettySnowFlake(trueOrFalse)>";

public str prettySnowFlake(CopyOptions::matchByColName(Sensitivity sensitivity)) = "MATCH_BY_COLUMN_NAME = <prettySnowFlake(sensitivity)>";

public str prettySnowFlake(CopyOptions::enforceLength(Boolean boolVal)) = "ENFORCE_LENGTH = <prettySnowFlake(trueOrFalse)>";

public str prettySnowFlake(CopyOptions::truncateCol(Boolean boolVal)) = "TRUNCATECOLUMNS = <prettySnowFlake(trueOrFalse)>";

public str prettySnowFlake(CopyOptions::forceTrueOrFalse(Boolean boolVal)) = "FORCE = <prettySnowFlake(trueOrFalse)>";

public str prettySnowFlake(OnErrorAction::continueAction()) = "CONTINUE";

public str prettySnowFlake(OnErrorAction::skipFile()) = "SKIP_FILE";

public str prettySnowFlake(OnErrorAction::skipFileInt(str integer)) = "SKIP_FILE_<integer>";

public str prettySnowFlake(OnErrorAction::skipFileAbort(str integer)) = "SKIP_FILE_<integer> ABORT_STATEMENT";

public str prettySnowFlake(Sensitivity::sensitivityOpt1()) = "CASE_SENSITIVE";

public str prettySnowFlake(Sensitivity::sensitivityOpt2()) = "CASE_INSENSITIVE";

public str prettySnowFlake(Sensitivity::sensitivityOpt3()) = "NONE";

public str prettySnowFlake(ChangeTracking::changeTracking(Boolean boolVal)) = "CHANGE_TRACKING = <prettySnowFlake(trueOrFalse)>";

public str prettySnowFlake(CopyGrants::copyGrants()) = "COPY GRANTS";

public str prettySnowFlake(WithRowAccessPolicy::withRowAccessPolicy(Identifier id, list[ObjectColumnNameOrIdentifier] objNameOrIdList)) = "WITH ROW ACCESS POLICY <prettySnowFlake(id)> ON ( <intercalate(", ", [ prettySnowFlake(objNameOrId) | objNameOrId <- objNameOrIdList ])> )";

public str prettySnowFlake(WithRowAccessPolicy::withRowAccessPolicyNoWith(Identifier id, list[ObjectColumnNameOrIdentifier] objNameOrIdList)) = "ROW ACCESS POLICY <prettySnowFlake(id)> ON ( <intercalate(", ", [ prettySnowFlake(objNameOrId) | objNameOrId <- objNameOrIdList ])> )";

public str prettySnowFlake(TableType::volatileType(list[LocalGlobal] localGlobalList)) = "<for(localGlobal <- localGlobalList) {><prettySnowFlake(localGlobal)><}> VOLATILE";

public str prettySnowFlake(TableType::temporaryType(list[LocalGlobal] localGlobalList, Temporary temporary)) = "<for(localGlobal <- localGlobalList) {><prettySnowFlake(localGlobal)><}> <prettySnowFlake(temporary)>";

public str prettySnowFlake(TableType::transientType()) = "TRANSIENT";

public str prettySnowFlake(LocalGlobal::local()) = "LOCAL";

public str prettySnowFlake(LocalGlobal::global()) = "GLOBAL";

public str prettySnowFlake(Temporary::temp()) = "TEMP";

public str prettySnowFlake(Temporary::temporary()) = "TEMPORARY";

public str prettySnowFlake(IfNotExistsObjectName::ifNotExistsObjectName(list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objNameOrId)) = "<for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(IfNotExistsObjectName::objectNameIfNotExists(ObjectColumnNameOrIdentifier objNameOrId, IfNotExists ifNotExists)) = "<prettySnowFlake(objNameOrId)> <prettySnowFlake(ifNotExists)>";

public str prettySnowFlake(InternalOrExternalStage::stageAtId(Identifier id)) = "@<prettySnowFlake(id)>/";

public str prettySnowFlake(InternalOrExternalStage::stageAtIdNoSlash(Identifier id)) = "@<prettySnowFlake(id)>";

public str prettySnowFlake(InternalOrExternalStage::externallocation(ExternalLocation externalLocation)) = "<prettySnowFlake(externalLocation)>";

public str prettySnowFlake(ExternalLocation::externalLocationOpt1(S3OrGovAwsPath s3OrGovAwsPath)) = "<prettySnowFlake(s3OrGovAwsPath)>";

public str prettySnowFlake(ExternalLocation::externalLocationOpt2(GcsPath gcsPath)) = "<prettySnowFlake(gcsPath)>";

public str prettySnowFlake(ExternalLocation::externalLocationOpt3(AzurePath azurePath)) = "<prettySnowFlake(azurePath)>";

public str prettySnowFlake(S3OrGovAwsPath::s3Path(str uri)) = "\'s3://<uri>\'";

public str prettySnowFlake(S3OrGovAwsPath::s3govPath(str uri)) = "\'s3gov://<uri>\'";

public str prettySnowFlake(GcsPath::gcsPath(str uri)) = "\'gcs://<uri>\'";

public str prettySnowFlake(AzurePath::azurePath(str uri)) = "\'azure://<uri>\'";

public str prettySnowFlake(FileFormat::fileFormat(FormatNameOrTypeFormat formatNameOrTypeFormat)) = "FILE_FORMAT = ( <prettySnowFlake(formatNameOrTypeFormat)> )";

public str prettySnowFlake(FormatNameOrTypeFormat::formatNameOrTypeFormatOpt1(FormatName formatName)) = "<prettySnowFlake(formatName)>";

public str prettySnowFlake(FormatNameOrTypeFormat::formatNameOrTypeFormatOpt2(TypeFormat typeFormat)) = "<prettySnowFlake(typeFormat)>";

public str prettySnowFlake(FormatName::formatName(String string)) = "FORMAT_NAME = <prettySnowFlake(string)>";

public str prettySnowFlake(TypeFormat::typeFormat(FormatType formatType, list[FormatTypeOptions] formatTypeOptionsList)) = "TYPE = <prettySnowFlake(formatType)> <for(formatTypeOptions <- formatTypeOptionsList) {><prettySnowFlake(formatTypeOptions)> <}>";

public str prettySnowFlake(BracketColumnListWithComment::bracketColumnListWithComment(ColumnListWithComment colListWithComment)) = "( <prettySnowFlake(colListWithComment)> )";

public str prettySnowFlake(ColumnListWithComment::columnListWithComment(list[ColumnNameWithComment] columnNameWithCommentList)) = "<intercalate(", ", [ prettySnowFlake(columnNameWithComment) | columnNameWithComment <- columnNameWithCommentList ])>";

public str prettySnowFlake(ColumnNameWithComment::columnNameWithComment(ObjectColumnNameOrIdentifier objNameOrId, list[CommentString] commentStringList)) = "<prettySnowFlake(objNameOrId)> <for(commentString <- commentStringList) {><prettySnowFlake(commentString)><}>";

public str prettySnowFlake(ViewCol::viewCol(ObjectColumnNameOrIdentifier objNameOrId, WithMaskingPolicy withMaskingPolicy, WithTags withTags)) = "<prettySnowFlake(objNameOrId)> <prettySnowFlake(withMaskingPolicy)> <prettySnowFlake(withTags)>";

public str prettySnowFlake(CopyIntoTable::copyIntoTableFromStage(ObjectColumnNameOrIdentifier objNameOrId, InternalOrExternalStage internalOrExternalStage,
                                list[Files] filesList, list[Pattern] patternList,
                                list[FileFormat] fileFormatList,
                                list[CopyOptions] copyOptionsList,
                                list[ValidationMode] validationModeList
                        )) 
                        = "COPY INTO <prettySnowFlake(objNameOrId)> FROM <prettySnowFlake(internalOrExternalStage)> <for(files <- filesList) {><prettySnowFlake(files)><}> <for(pattern <- patternList) {><prettySnowFlake(pattern)><}> <for(fileFormat <- fileFormatList) {><prettySnowFlake(fileFormat)><}> <for(copyOptions <- copyOptionsList) {><prettySnowFlake(copyOptions)> <}> <for(validationMode <- validationModeList) {><prettySnowFlake(validationMode)><}>";

public str prettySnowFlake(CopyIntoTable::copyIntoTable(ObjectColumnNameOrIdentifier objNameOrId, list[ColumnListWithBrackets] columnListWithBrackets,
                                list[Files] filesList, list[Pattern] patternList,
                                list[FileFormat] fileFormatList,
                                list[CopyOptions] copyOptionsList
                        ))
                        = "COPY INTO <prettySnowFlake(objNameOrId)> <for(columnWithBrackets <- columnListWithBrackets) {><prettySnowFlake(columnWithBrackets)><}> <for(files <- filesList) {><prettySnowFlake(files)><}> <for(pattern <- patternList) {><prettySnowFlake(pattern)><}> <for(fileFormat <- fileFormatList) {><prettySnowFlake(fileFormat)><}> <for(copyOptions <- copyOptionsList) {><prettySnowFlake(copyOptions)> <}>";

public str prettySnowFlake(Files::fileEq(list[String] stringList)) = "FILES = (  <intercalate(", ", [ prettySnowFlake(string) | string <- stringList ])> )";

public str prettySnowFlake(ValidationMode::validationMode(ReturnValidationType returnValidationType)) = "VALIDATION_MODE = <prettySnowFlake(returnValidationType)>";

public str prettySnowFlake(ReturnValidationType::returnValidationTypeOpt1(str integer)) = "RETURN_<integer>_ROWS";

public str prettySnowFlake(ReturnValidationType::returnValidationTypeOpt2()) = "RETURN_ERRORS";

public str prettySnowFlake(ReturnValidationType::returnValidationTypeOpt3()) = "RETURN_ALL_ERRORS";

public str prettySnowFlake(CreateTableAsSelect::createTableAsSelect(list[OrReplace] orReplaceList, list[TableType] tableTypeList, IfNotExistsObjectName ifNotExistsObjectName,
                                        list[ColumnDeclItemListWithBrackets] columnDeclItemListWithBrackets,
                                        list[ClusterBy] clusterByList, list[CopyGrants] copyGrantsList,
                                        list[WithRowAccessPolicy] withRowAccessPolicyList, list[WithTags] withTagsList,
                                        list[CommentClause] commentClauseList, Query query
                                )) 
                            = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> <for(tableType <- tableTypeList) {><prettySnowFlake(tableType)><}> TABLE <prettySnowFlake(ifNotExistsObjectName)> <for(columnDeclItemWithBrackets <- columnDeclItemListWithBrackets) {><prettySnowFlake(columnDeclItemWithBrackets)><}> <for(clusterBy <- clusterByList) {><prettySnowFlake(clusterBy)><}> <for(copyGrants <- copyGrantsList) {><prettySnowFlake(copyGrants)><}> <for(withRowAccessPolicy <- withRowAccessPolicyList) {><prettySnowFlake(withRowAccessPolicy)><}> <for(withTags <- withTagsList) {><prettySnowFlake(withTags)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}> AS <prettySnowFlake(query)>";
                            
public str prettySnowFlake(CreateTableLike::createTableLike(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId1, ObjectColumnNameOrIdentifier objNameOrId2,
                                list[ClusterBy] clusterByList, list[CopyGrants] copyGrantsList
                        )) 
                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> TRANSIENT TABLE <prettySnowFlake(objNameOrId1)> LIKE <prettySnowFlake(objNameOrId2)> <for(clusterBy <- clusterByList) {><prettySnowFlake(clusterBy)><}> <for(copyGrants <- copyGrantsList) {><prettySnowFlake(copyGrants)><}>";

public str prettySnowFlake(CreateTableLike::createTableLikeNoTransient(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId1, ObjectColumnNameOrIdentifier objNameOrId2,
                                list[ClusterBy] clusterByList, list[CopyGrants] copyGrantsList
                        )) 
                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> TABLE <prettySnowFlake(objNameOrId1)> LIKE <prettySnowFlake(objNameOrId2)> <for(clusterBy <- clusterByList) {><prettySnowFlake(clusterBy)><}> <for(copyGrants <- copyGrantsList) {><prettySnowFlake(copyGrants)><}>";

public str prettySnowFlake(CreateView::createViewOpt1(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                list[BracketColumnListWithComment] bracketColumnListWithComment, list[ViewCol] viewColList,
                                list[WithRowAccessPolicy] withRowAccessPolicyList, list[WithTags] withTagsList,
                                list[CopyGrants] copyGrantsList, list[CommentClause] commentClauseList,
                                Query query
                        )) 
                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> SECURE RECURSIVE VIEW <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(objNameOrId)> <for(bracketColumnListWith <- bracketColumnListWithComment) {><prettySnowFlake(bracketColumnListWith)><}> <for(viewCol <- viewColList) {><prettySnowFlake(viewCol)> <}> <for(withRowAccessPolicy <- withRowAccessPolicyList) {><prettySnowFlake(withRowAccessPolicy)><}> <for(withTags <- withTagsList) {><prettySnowFlake(withTags)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}> AS <prettySnowFlake(query)>";

public str prettySnowFlake(CreateView::createViewOpt2(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                list[BracketColumnListWithComment] bracketColumnListWithComment, list[ViewCol] viewColList,
                                list[WithRowAccessPolicy] withRowAccessPolicyList, list[WithTags] withTagsList,
                                list[CopyGrants] copyGrantsList, list[CommentClause] commentClauseList,
                                Query query
                        )) 
                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> VIEW <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(objNameOrId)> <for(bracketColumnListWith <- bracketColumnListWithComment) {><prettySnowFlake(bracketColumnListWith)><}> <for(viewCol <- viewColList) {><prettySnowFlake(viewCol)> <}> <for(withRowAccessPolicy <- withRowAccessPolicyList) {><prettySnowFlake(withRowAccessPolicy)><}> <for(withTags <- withTagsList) {><prettySnowFlake(withTags)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}> AS <prettySnowFlake(query)>";

public str prettySnowFlake(CreateView::createViewOpt3(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                list[BracketColumnListWithComment] bracketColumnListWithComment, list[ViewCol] viewColList,
                                list[WithRowAccessPolicy] withRowAccessPolicyList, list[WithTags] withTagsList,
                                list[CopyGrants] copyGrantsList, list[CommentClause] commentClauseList,
                                Query query
                        )) 
                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> RECURSIVE VIEW <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(objNameOrId)> <for(bracketColumnListWith <- bracketColumnListWithComment) {><prettySnowFlake(bracketColumnListWith)><}> <for(viewCol <- viewColList) {><prettySnowFlake(viewCol)> <}> <for(withRowAccessPolicy <- withRowAccessPolicyList) {><prettySnowFlake(withRowAccessPolicy)><}> <for(withTags <- withTagsList) {><prettySnowFlake(withTags)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}> AS <prettySnowFlake(query)>";

public str prettySnowFlake(CreateView::createViewOpt4(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                list[BracketColumnListWithComment] bracketColumnListWithComment, list[ViewCol] viewColList,
                                list[WithRowAccessPolicy] withRowAccessPolicyList, list[WithTags] withTagsList,
                                list[CopyGrants] copyGrantsList, list[CommentClause] commentClauseList,
                                Query query
                        ))
                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> SECURE VIEW <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(objNameOrId)> <for(bracketColumnListWith <- bracketColumnListWithComment) {><prettySnowFlake(bracketColumnListWith)><}> <for(viewCol <- viewColList) {><prettySnowFlake(viewCol)> <}> <for(withRowAccessPolicy <- withRowAccessPolicyList) {><prettySnowFlake(withRowAccessPolicy)><}> <for(withTags <- withTagsList) {><prettySnowFlake(withTags)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}> AS <prettySnowFlake(query)>";

public str prettySnowFlake(CreateAccount::createAccount(Identifier id1, Identifier id2, String string1, list[FirstName] firstNameList, list[LastName] lastNameList, 
                                String string2, list[MustChangePassword] mustChangePasswordList, EditionType editionType, list[RegionGroup] regionGroupList,
                                list[SnowflakeRegion] snowflakeRegionList, list[CommentClause] commentClauseList
                                ))
                        = "CREATE ACCOUNT <prettySnowFlake(id1)> ADMIN_NAME = <prettySnowFlake(id2)> ADMIN_PASSWORD = <prettySnowFlake(string1)> <for(firstName <- firstNameList) {><prettySnowFlake(firstName)><}> <for(lastName <- lastNameList) {><prettySnowFlake(lastName)> <}> EMAIL = <prettySnowFlake(string2)> <for(mustChangePassword <- mustChangePasswordList) {><prettySnowFlake(mustChangePassword)><}> EDITION = <prettySnowFlake(editionType)> <for(regionGroup <- regionGroupList) {><prettySnowFlake(regionGroup)><}> <for(snowflakeRegion <- snowflakeRegionList) {><prettySnowFlake(snowflakeRegion)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(CreateFileFormat::createFileFormat(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                        list[TypeEqFormatType] typeEqFormatTypeList, list[FormatTypeOptions] formatTypeOptionsList, list[CommentClause] commentClauseList
                                 ))
                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> FILE FORMAT <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(objNameOrId)> <for(typeEqFormat <- typeEqFormatTypeList) {><prettySnowFlake(typeEqFormat)> <}> <for(formatTypeOptions <- formatTypeOptionsList) {><prettySnowFlake(formatTypeOptions)> <}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(TypeEqFormatType::typeEqFormatType(FormatType formatType)) = "TYPE = <prettySnowFlake(formatType)>";

public str prettySnowFlake(MustChangePassword::mustChangePassword(Boolean boolVal)) = "MUST_CHANGE_PASSWORD = <prettySnowFlake(boolVal)>";

public str prettySnowFlake(FirstName::firstName(Identifier id)) = "FIRST_NAME = <prettySnowFlake(id)>";

public str prettySnowFlake(LastName::lastName(Identifier id)) = "LAST_NAME = <prettySnowFlake(id)>";

public str prettySnowFlake(EditionType::standard()) = "STANDARD";

public str prettySnowFlake(EditionType::enterprise()) = "ENTERPRISE";

public str prettySnowFlake(EditionType::businessCritical()) = "BUSINESS_CRITICAL";

public str prettySnowFlake(RegionGroup::regionGroup(Identifier id)) = "REGION_GROUP = <prettySnowFlake(id)>";

public str prettySnowFlake(SnowflakeRegion::snowflakeRegion(Identifier id)) = "REGION = <prettySnowFlake(id)>";

public str prettySnowFlake(CreateUser::createUser(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, Identifier id, list[ObjectProperties] objectPropertiesList, list[ObjectParams] objectParamsList, list[SessionParams] sessionParamsList))
                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> USER <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(id)> <for(objectProperties <- objectPropertiesList) {><prettySnowFlake(objectProperties)> <}> <for(objectParams <- objectParamsList) {><prettySnowFlake(objectParams)> <}> <for(sessionParams <- sessionParamsList) {><prettySnowFlake(sessionParams)><}>";

public str prettySnowFlake(CreateConnection::createConnection(list[IfNotExists] ifNotExistsList, Identifier id, list[AsReplicaOfObjectName] asReplicaOfObjectNameList, list[CommentClause] commentClauseList))
                        = "CREATE CONNECTION <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(id)> <for(asReplicaOfObjectName <- asReplicaOfObjectNameList) {><prettySnowFlake(asReplicaOfObjectName)> <}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)> <}>";

public str prettySnowFlake(AsReplicaOfObjectName::asReplicaOfObjectName(ObjectColumnNameOrIdentifier objNameOrId)) = "AS REPLICA OF <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(CreateDynamicTable::createDynamicTable(list[OrReplace] orReplaceList, Identifier id1, String string, Identifier id2, Query qry))
                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> DYNAMIC TABLE <prettySnowFlake(id1)> TARGET_LAG = <prettySnowFlake(string)> WAREHOUSE = <prettySnowFlake(id2)> AS <prettySnowFlake(qry)>";

public str prettySnowFlake(CreateEventTable::createEventTable(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, Identifier id,
                                list[ClusterBy] clusterByList, 
                                list[DataRetentionTimeEqInt] dataRetentionTimeEqIntList,
                                list[MaxDataExtentionTimeEqInt] maxDataExtentionTimeEqIntList, 
                                list[ChangeTracking] changeTrackingList, 
                                list[DefaultDdlCollation] defaultDdlCollationList,
                                list[CopyGrants] copyGrantsList, 
                                list[WithRowAccessPolicy] withRowAccessPolicyList, 
                                list[WithTags] withTagsList, 
                                list[WithCommentClause] withCommentClauseList
                                ))
                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> EVENT TABLE <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(id)> <for(clusterBy <- clusterByList) {><prettySnowFlake(clusterBy)> <}> <for(dataRetentionTimeEqInt <- dataRetentionTimeEqIntList) {><prettySnowFlake(dataRetentionTimeEqInt)> <}> <for(maxDataExtentionTimeEqInt <- maxDataExtentionTimeEqIntList) {><prettySnowFlake(maxDataExtentionTimeEqInt)><}> <for(changeTracking <- changeTrackingList) {><prettySnowFlake(changeTracking)><}> <for(defaultDdlCollation <- defaultDdlCollationList) {><prettySnowFlake(defaultDdlCollation)><}> <for(copyGrants <- copyGrantsList) {><prettySnowFlake(copyGrants)><}> <for(withRowAccessPolicy <- withRowAccessPolicyList) {><prettySnowFlake(withRowAccessPolicy)><}> <for(withTags <- withTagsList) {><prettySnowFlake(withTags)><}> <for(withCommentClause <- withCommentClauseList) {><prettySnowFlake(withCommentClause)><}>";

public str prettySnowFlake(WithCommentClause::withCommentClauseNoWith(CommentClause commentClause)) = "<prettySnowFlake(commentClause)>";

public str prettySnowFlake(WithCommentClause::withCommentClause(CommentClause commentClause)) = "WITH <prettySnowFlake(commentClause)>";

public str prettySnowFlake(CreateFailoverGroup::createFailoverGroupAsReplica(list[IfNotExists] ifNotExistsList, Identifier id, AsReplicaOfObjectName asReplicaOfObjectName))
                        = "CREATE FAILOVER GROUP <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(id)> <prettySnowFlake(asReplicaOfObjectName)>";

public str prettySnowFlake(CreateFailoverGroup::createFailoverGroupObjectTypes(list[IfNotExists] ifNotExistsList, Identifier id, 
                                        ObjectTypeList objectTypeList,
                                        list[AllowedDatabases] allowedDatabasesList,
                                        list[AllowedShares] allowedSharesList, 
                                        list[AllowedIntegrationTypes] allowedIntegrationTypesList,
                                        ObjectColumnNameOrIdentifier objNameOrId, 
                                        list[IgnoreEditionCheck] ignoreEditionCheckList, 
                                        list[ReplicationSchedule] replicationScheduleList
                                ))
                        = "CREATE FAILOVER GROUP <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(id)> OBJECT_TYPES = <prettySnowFlake(objectTypeList)> <for(allowedDatabases <- allowedDatabasesList) {><prettySnowFlake(allowedDatabases)> <}> <for(allowedShares <- allowedSharesList) {><prettySnowFlake(allowedShares)><}> <for(allowedIntegrationTypes <- allowedIntegrationTypesList) {><prettySnowFlake(allowedIntegrationTypes)><}> ALLOWED_ACCOUNTS = <prettySnowFlake(objNameOrId)> <for(ignoreEditionCheck <- ignoreEditionCheckList) {><prettySnowFlake(ignoreEditionCheck)><}> <for(replicationSchedule <- replicationScheduleList) {><prettySnowFlake(replicationSchedule)><}>";

public str prettySnowFlake(AllowedDatabases::allowedDatabases(list[Identifier] idList)) = "ALLOWED_DATABASES = <intercalate(", ", [ prettySnowFlake(id) | id <- idList ])>";

public str prettySnowFlake(AllowedShares::allowedShares(list[Identifier] idList)) = "ALLOWED_SHARES = <intercalate(", ", [ prettySnowFlake(id) | id <- idList ])>";

public str prettySnowFlake(AllowedIntegrationTypes::allowedIntegrationTypes(list[IntegrationTypeName] integrationTypeNameList)) = "ALLOWED_INTEGRATION_TYPES =  <intercalate(", ", [ prettySnowFlake(integrationTypeName) | integrationTypeName <- integrationTypeNameList ])>";

public str prettySnowFlake(IntegrationTypeName::securityIntegrations()) = "SECURITY INTEGRATIONS";

public str prettySnowFlake(IntegrationTypeName::apiIntegrations()) = "API INTEGRATIONS";

public str prettySnowFlake(WithCommentClause::withCommentClauseNoWith(CommentClause commentClause)) = "<prettySnowFlake(commentClause)>";

public str prettySnowFlake(CreateManagedAccount::createManagedAccount(Identifier id1, Identifier id2, String string, list[CommaCommentClause] commaCommentClauselist))
                        = "CREATE MANAGED ACCOUNT <prettySnowFlake(id1)> ADMIN_NAME = <prettySnowFlake(id2)>, ADMIN_PASSWORD = <prettySnowFlake(string)>, TYPE = READER <for(commaCommentClause <- commaCommentClauselist) {><prettySnowFlake(commaCommentClause)><}>";

public str prettySnowFlake(CommaCommentClause::commaCommentClause(CommentClause commentClause)) = ", <prettySnowFlake(commentClause)>";

public str prettySnowFlake(CreateNetworkPolicy::createNetworkPolicy(list[OrReplace] orReplaceList, Identifier id, 
                                        AllowedIPList allowedIP,
                                        list[BlockedIPList] blockedIPList,
                                        list[CommentClause] commentClauselist
                                ))
                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> NETWORK POLICY <prettySnowFlake(id)> <prettySnowFlake(allowedIP)> <for(blockedIP <- blockedIPList) {><prettySnowFlake(blockedIP)><}> <for(commentClause <- commentClauselist) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(CreateApiIntegration::apiAwsRole(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, Identifier id1, Identifier id2,
                                        String string1, list[ApiKey] apiKeyList, String string2,
                                        list[ApiBlockedPrefixes] apiBlockedPrefixesList, Enabled enabled, list[CommentClause] commentClauselist
                                ))
                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> API INTEGRATION <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(id1)> API_PROVIDER = <prettySnowFlake(id2)> API_AWS_ROLE_ARN = <prettySnowFlake(string1)> <for(apiKey <- apiKeyList) {><prettySnowFlake(apiKey)><}> API_ALLOWED_PREFIXES = ( <prettySnowFlake(string2)> ) <for(apiBlockedPrefixes <- apiBlockedPrefixesList) {><prettySnowFlake(apiBlockedPrefixes)><}> <prettySnowFlake(enabled)> <for(commentClause <- commentClauselist) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(CreateApiIntegration::azureTenant(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, Identifier id1,
                                        Identifier id2, String string1, String string2, list[ApiKey] apiKeyList,
                                        String string3, list[ApiBlockedPrefixes] apiBlockedPrefixesList,
                                        Enabled enabled, list[CommentClause] commentClauselist
                                ))
                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> API INTEGRATION <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(id1)> API_PROVIDER = <prettySnowFlake(id2)> AZURE_TENANT_ID = <prettySnowFlake(string1)> AZURE_AD_APPLICATION_ID = <prettySnowFlake(string2)> <for(apiKey <- apiKeyList) {><prettySnowFlake(apiKey)><}> API_ALLOWED_PREFIXES = ( <prettySnowFlake(string3)> ) <for(apiBlockedPrefixes <- apiBlockedPrefixesList) {><prettySnowFlake(apiBlockedPrefixes)><}> <prettySnowFlake(enabled)> <for(commentClause <- commentClauselist) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(CreateApiIntegration::googleAudience(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, Identifier id1, 
                                        Identifier id2, String string2, String string3, list[ApiBlockedPrefixes] apiBlockedPrefixesList,
                                        Enabled enabled, list[CommentClause] commentClauselist
                                ))
                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> API INTEGRATION <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(id1)> API_PROVIDER = <prettySnowFlake(id2)> GOOGLE_AUDIENCE = <prettySnowFlake(string1)> API_ALLOWED_PREFIXES = ( <prettySnowFlake(string2)> ) <for(apiBlockedPrefixes <- apiBlockedPrefixesList) {><prettySnowFlake(apiBlockedPrefixes)><}> <prettySnowFlake(enabled)> <for(commentClause <- commentClauselist) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(CreateExternalFunction::createExternalFunction(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId, list[ArgDataTypeList] argDataTypeList,
                                        DataType dataType, list[NullNotNull] nullNotNullList, list[CalledReturnsOrStrict] calledReturnsOrStrictList,
                                        list[VolatileOrImmutable] volatileOrImmutableList, list[CommentClause] commentClauselist, Identifier id, 
                                        list[Headers] headersList, list[ContextHeaders] contextHeadersList, list[MaxBatchRows] maxBatchRowsList, list[Compression] compressionList, 
                                        list[RequestTranslator] requestTranslatorList, list[ResponseTranslator] responseTranslatorList, String string
                                        ))
                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> SECURE EXTERNAL FUNCTION <prettySnowFlake(objNameOrId)> ( <for(argDataType <- argDataTypeList) {><prettySnowFlake(argDataType)><}> ) RETURNS <prettySnowFlake(dataType)> <for(nullNotNull <- nullNotNullList) {><prettySnowFlake(nullNotNull)><}> <for(calledReturnsOrStrict <- calledReturnsOrStrictList) {><prettySnowFlake(calledReturnsOrStrict)><}> <for(volatileOrImmutable <- volatileOrImmutableList) {><prettySnowFlake(volatileOrImmutable)><}> <for(commentClause <- commentClauselist) {><prettySnowFlake(commentClause)><}> API_INTEGRATION = <prettySnowFlake(id)> <for(headers <- headersList) {><prettySnowFlake(headers)><}> <for(contextHeaders <- contextHeadersList) {><prettySnowFlake(contextHeaders)><}> <for(maxBatchRows <- maxBatchRowsList) {><prettySnowFlake(maxBatchRows)><}> <for(compression <- compressionList) {><prettySnowFlake(compression)><}> <for(requestTranslator <- requestTranslatorList) {><prettySnowFlake(requestTranslator)><}> <for(responseTranslator <- responseTranslatorList) {><prettySnowFlake(responseTranslator)><}> AS <prettySnowFlake(string)>";

public str prettySnowFlake(CreateExternalFunction::createExternalFunctionNoSecure(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId, list[ArgDataTypeList] argDataTypeList,
                                        DataType dataType, list[NullNotNull] nullNotNullList, list[CalledReturnsOrStrict] calledReturnsOrStrictList,
                                        list[VolatileOrImmutable] volatileOrImmutableList, list[CommentClause] commentClauselist, Identifier id, 
                                        list[Headers] headersList, list[ContextHeaders] contextHeadersList, list[MaxBatchRows] maxBatchRowsList, list[Compression] compressionList, 
                                        list[RequestTranslator] requestTranslatorList, list[ResponseTranslator] responseTranslatorList, String string
                                        ))
                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> EXTERNAL FUNCTION <prettySnowFlake(objNameOrId)> ( <for(argDataType <- argDataTypeList) {><prettySnowFlake(argDataType)><}> ) RETURNS <prettySnowFlake(dataType)> <for(nullNotNull <- nullNotNullList) {><prettySnowFlake(nullNotNull)><}> <for(calledReturnsOrStrict <- calledReturnsOrStrictList) {><prettySnowFlake(calledReturnsOrStrict)><}> <for(volatileOrImmutable <- volatileOrImmutableList) {><prettySnowFlake(volatileOrImmutable)><}> <for(commentClause <- commentClauselist) {><prettySnowFlake(commentClause)><}> API_INTEGRATION = <prettySnowFlake(id)> <for(headers <- headersList) {><prettySnowFlake(headers)><}> <for(contextHeaders <- contextHeadersList) {><prettySnowFlake(contextHeaders)><}> <for(maxBatchRows <- maxBatchRowsList) {><prettySnowFlake(maxBatchRows)><}> <for(compression <- compressionList) {><prettySnowFlake(compression)><}> <for(requestTranslator <- requestTranslatorList) {><prettySnowFlake(requestTranslator)><}> <for(responseTranslator <- responseTranslatorList) {><prettySnowFlake(responseTranslator)><}> AS <prettySnowFlake(string)>";

public str prettySnowFlake(ArgDataTypeList::argDataTypeList(list[ArgDataType] argDataTypeList)) = "<intercalate(", ", [ prettySnowFlake(argDataType) | argDataType <- argDataTypeList ])>";

public str prettySnowFlake(ArgDataType::argDataType(Identifier id1, Identifier id2)) = "<prettySnowFlake(id1)> <prettySnowFlake(id2)>";

public str prettySnowFlake(VolatileOrImmutable::volatileOpt()) = "VOLATILE";

public str prettySnowFlake(VolatileOrImmutable::immutableOpt()) = "IMMUTABLE";

public str prettySnowFlake(Headers::headers(list[HeaderDecl] headerDeclList)) = "HEADERS = ( <intercalate(", ", [ prettySnowFlake(headerDecl) | headerDecl <- headerDeclList ])> )";

public str prettySnowFlake(ContextHeaders::contextHeaders(Identifier idList)) = "CONTEXT_HEADERS = (<intercalate(", ", [ prettySnowFlake(id) | id <- idList ])> )";

public str prettySnowFlake(MaxBatchRows::maxBatchRows(Int integer)) = "MAX_BATCH_ROWS = <prettySnowFlake(integer)>";

public str prettySnowFlake(ResponseTranslator::responseTranslator(Identifier id)) = "RESPONSE_TRANSLATOR = <prettySnowFlake(id)>";

public str prettySnowFlake(RequestTranslator::requestTranslator(Identifier id)) = "REQUEST_TRANSLATOR = <prettySnowFlake(id)>";

public str prettySnowFlake(CreateExternalTable::createExternalTableAuto(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, 
                                        ObjectColumnNameOrIdentifier objNameOrId, ExternalTableColumnDeclList externalTableColumnDeclList, 
                                        list[CloudProviderParam] cloudProviderParamList, list[PartitionBy] partitionByList, 
                                        LocationEqInternalOrExternalStage locationEqInternalOrExternalStage, list[RefreshOnCreate] refreshOnCreateList, 
                                        list[AutoRefresh] autoRefreshList, list[Pattern] patternList, FileFormat fileFormat, list[AwsSNSTopic] awsSNSTopicList, 
                                        list[CopyGrants] copyGrantsList, list[WithRowAccessPolicy] withRowAccessPolicyList, list[WithTags] withTagsList, list[CommentClause] commentClauseList
                                        ))
                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> EXTERNAL TABLE <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(objNameOrId)> ( <prettySnowFlake(externalTableColumnDeclList)> ) <for(cloudProviderParam <- cloudProviderParamList) {><prettySnowFlake(cloudProviderParam)><}> <for(partitionBy <- partitionByList) {><prettySnowFlake(partitionBy)><}> <prettySnowFlake(locationEqInternalOrExternalStage)> <for(refreshOnCreate <- refreshOnCreateList) {><prettySnowFlake(refreshOnCreate)><}> <for(autoRefresh <- autoRefreshList) {><prettySnowFlake(autoRefresh)><}> <for(pattern <- patternList) {><prettySnowFlake(pattern)><}> <prettySnowFlake(fileFormat)> <for(awsSNSTopic <- awsSNSTopicList) {><prettySnowFlake(awsSNSTopic)><}> <for(copyGrants <- copyGrantsList) {><prettySnowFlake(copyGrants)><}> <for(withRowAccessPolicy <- withRowAccessPolicyList) {><prettySnowFlake(withRowAccessPolicy)><}> <for(withTags <- withTagsList) {><prettySnowFlake(withTags)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(CreateExternalTable::createExternalTableManual(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, 
                                        ObjectColumnNameOrIdentifier objNameOrId, ExternalTableColumnDeclList externalTableColumnDeclList, 
                                        list[CloudProviderParam] cloudProviderParamList, list[PartitionBy] partitionByList, 
                                        LocationEqInternalOrExternalStage locationEqInternalOrExternalStage, PartitionType partitionType, FileFormat fileFormat, list[CopyGrants] copyGrantsList,
                                        list[WithRowAccessPolicy] withRowAccessPolicyList, list[WithTags] withTagsList, list[CommentClause] commentClauseList
                                ))
                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> EXTERNAL TABLE <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(objNameOrId)> ( <prettySnowFlake(externalTableColumnDeclList)> ) <for(cloudProviderParam <- cloudProviderParamList) {><prettySnowFlake(cloudProviderParam)><}> <for(partitionBy <- partitionByList) {><prettySnowFlake(partitionBy)><}> <prettySnowFlake(locationEqInternalOrExternalStage)> <prettySnowFlake(partitionType)> <prettySnowFlake(fileFormat)> <for(copyGrants <- copyGrantsList) {><prettySnowFlake(copyGrants)><}> <for(withRowAccessPolicy <- withRowAccessPolicyList) {><prettySnowFlake(withRowAccessPolicy)><}> <for(withTags <- withTagsList) {><prettySnowFlake(withTags)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(CreateExternalTable::createExternalTableDeltaLake(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, 
                                        ObjectColumnNameOrIdentifier objNameOrId, ExternalTableColumnDeclList externalTableColumnDeclList, 
                                        list[CloudProviderParam] cloudProviderParamList, list[PartitionBy] partitionByList, 
                                        LocationEqInternalOrExternalStage locationEqInternalOrExternalStage, PartitionType partitionType, FileFormat FileFormat, list[TableFormatEqDelta] tableFormatEqDeltaList, 
                                        list[CopyGrants] copyGrantsList, list[WithRowAccessPolicy] withRowAccessPolicyList, list[WithTags] withTagsList, list[CommentClause] commentClauseList
                                ))
                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> EXTERNAL TABLE <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(objNameOrId)> ( <prettySnowFlake(externalTableColumnDeclList)> ) <for(cloudProviderParam <- cloudProviderParamList) {><prettySnowFlake(cloudProviderParam)><}> <for(partitionBy <- partitionByList) {><prettySnowFlake(partitionBy)><}> <prettySnowFlake(locationEqInternalOrExternalStage)> <prettySnowFlake(partitionType)> <prettySnowFlake(fileFormat)> <for(tableFormatEqDelta <- tableFormatEqDeltaList) {><prettySnowFlake(tableFormatEqDelta)><}>  <for(copyGrants <- copyGrantsList) {><prettySnowFlake(copyGrants)><}> <for(withRowAccessPolicy <- withRowAccessPolicyList) {><prettySnowFlake(withRowAccessPolicy)><}> <for(withTags <- withTagsList) {><prettySnowFlake(withTags)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(ExternalTableColumnDeclList::externalTableColumnDeclList(list[ExternalTableColumnDecl] externalTableColumnDeclList)) = "<intercalate(", ", [ prettySnowFlake(externalTableColumnDecl) | externalTableColumnDecl <- externalTableColumnDeclList ])>";

public str prettySnowFlake(ExternalTableColumnDecl::externalTableColumnDecl(ObjectColumnNameOrIdentifier objNameOrId, DataType dataType, Exp exp, list[InlineConstraint] inlineConstraintList)) = "<prettySnowFlake(objNameOrId)> <prettySnowFlake(dataType)> AS <prettySnowFlake(exp)> <for(inlineConstraint <- inlineConstraintList) {><prettySnowFlake(inlineConstraint)><}>";

public str prettySnowFlake(CloudProviderParam::cloudProviderParamAws(String string, list[StorageAwsObject] storageAwsObjectList)) = "STORAGE_PROVIDER = \'S3\' STORAGE_AWS_ROLE_ARN = <prettySnowFlake(string)> <for(storageAwsObject <- storageAwsObjectList) {><prettySnowFlake(storageAwsObject)><}>";

public str prettySnowFlake(CloudProviderParam::cloudProviderParamGCS()) = "STORAGE_PROVIDER = GCS";

public str prettySnowFlake(CloudProviderParam::cloudProviderParamAzure(String string)) = "STORAGE_PROVIDER = AZURE AZURE_TENANT_ID = <prettySnowFlake(string)>";

public str prettySnowFlake(StorageAwsObject::storageAwsObject(String string)) = "STORAGE_AWS_OBJECT_ACL = <prettySnowFlake(string)>";

public str prettySnowFlake(LocationEqInternalOrExternalStage::withLocation(InternalOrExternalStage internalOrExternalStage)) = "WITH LOCATION = <prettySnowFlake(internalOrExternalStage)>";

public str prettySnowFlake(LocationEqInternalOrExternalStage::noWithLocation(InternalOrExternalStage internalOrExternalStage)) = "LOCATION = <prettySnowFlake(internalOrExternalStage)>";

public str prettySnowFlake(RefreshOnCreate::refreshOnCreate(Boolean boolVal)) = "REFRESH_ON_CREATE = <prettySnowFlake(boolVal)>";

public str prettySnowFlake(AwsSNSTopic::awsSNSTopic(String string)) = "AWS_SNS_TOPIC = <prettySnowFlake(string)>";

public str prettySnowFlake(PartitionType::partitionType()) = "PARTITION_TYPE = USER_SPECIFIED";

public str prettySnowFlake(TableFormatEqDelta::tableFormatEqDelta()) = "TABLE_FORMAT = DELTA";

public str prettySnowFlake(CreateNotificationIntegration::createNotificationAuto(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, Identifier id,
                                        Boolean boolVal, CloudProviderParamsAuto cloudProviderParamsAuto, list[CommentClause] commentClauseList
                                        )) 
                                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> NOTIFICATION INTEGRATION <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(id)> ENABLED = <prettySnowFlake(boolVal)> TYPE = QUEUE <prettySnowFlake(cloudProviderParamsAuto)> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(CreateNotificationIntegration::createNotificationPush(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, Identifier id,
                                        Boolean boolVal, CloudProviderParamsPush cloudProviderParamsPush, list[CommentClause] commentClauseList
                                )) 
                                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> NOTIFICATION INTEGRATION <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(id)> ENABLED = <prettySnowFlake(boolVal)> DIRECTION = OUTBOUND TYPE = QUEUE <prettySnowFlake(cloudProviderParamsPush)> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(CreateProcedure::createProcedureLangSQL(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId, list[ArgDataTypeList] argDataTypeList,
                                ReturnsType returnsType, list[NullNotNull] nullNotNullList, list[CalledReturnsOrStrict] calledReturnsOrStrictList,
                                list[VolatileOrImmutable] volatileOrImmutableList, list[CommentClause] commentClauseList,
                                list[ExecuteAs] executeAsList, String string
                                )) 
                                = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> PROCEDURE <prettySnowFlake(objNameOrId)> ( <for(argDataType <- argDataTypeList) {><prettySnowFlake(argDataType)><}> ) RETURNS <prettySnowFlake(returnsType)> <for(nullNotNull <- nullNotNullList) {><prettySnowFlake(nullNotNull)><}> LANGUAGE SQL <for(calledReturnsOrStrict <- calledReturnsOrStrictList) {><prettySnowFlake(calledReturnsOrStrict)><}> <for(volatileOrImmutable <- volatileOrImmutableList) {><prettySnowFlake(volatileOrImmutable)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}> <for(executeAs <- executeAsList) {><prettySnowFlake(executeAs)><}> AS <prettySnowFlake(string)>";

public str prettySnowFlake(CreateProcedure::createProcedureLangJavascript(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId, list[ArgDataTypeList] argDataTypeList,
                                ReturnsType returnsType, list[CalledReturnsOrStrict] calledReturnsOrStrictList,
                                list[VolatileOrImmutable] volatileOrImmutableList, list[CommentClause] commentClauseList,
                                list[ExecuteAs] executeAsList, String string
                        )) 
                                = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> SECURE PROCEDURE <prettySnowFlake(objNameOrId)> ( <for(argDataType <- argDataTypeList) {><prettySnowFlake(argDataType)><}> ) RETURNS <prettySnowFlake(returnsType)> LANGUAGE JAVASCRIPT <for(calledReturnsOrStrict <- calledReturnsOrStrictList) {><prettySnowFlake(calledReturnsOrStrict)><}> <for(volatileOrImmutable <- volatileOrImmutableList) {><prettySnowFlake(volatileOrImmutable)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}> <for(executeAs <- executeAsList) {><prettySnowFlake(executeAs)><}> AS <prettySnowFlake(string)>";

public str prettySnowFlake(CreateProcedure::createProcedureLangJavascriptNoSecure(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId, list[ArgDataTypeList] argDataTypeList,
                                ReturnsType returnsType, list[CalledReturnsOrStrict] calledReturnsOrStrictList,
                                list[VolatileOrImmutable] volatileOrImmutableList, list[CommentClause] commentClauseList,
                                list[ExecuteAs] executeAsList, String string
                        )) 
                                = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> PROCEDURE <prettySnowFlake(objNameOrId)> ( <for(argDataType <- argDataTypeList) {><prettySnowFlake(argDataType)><}> ) RETURNS <prettySnowFlake(returnsType)> LANGUAGE JAVASCRIPT <for(calledReturnsOrStrict <- calledReturnsOrStrictList) {><prettySnowFlake(calledReturnsOrStrict)><}> <for(volatileOrImmutable <- volatileOrImmutableList) {><prettySnowFlake(volatileOrImmutable)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}> <for(executeAs <- executeAsList) {><prettySnowFlake(executeAs)><}> AS <prettySnowFlake(string)>";

public str prettySnowFlake(ExecuteAs::executeAs(CallerOwner callerOwner)) = "EXECUTE AS <prettySnowFlake(callerOwner)>";

public str prettySnowFlake(CreatePipe::createPipe(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                list[AutoIngest] autoIngestList, list[ErrorIntegration] errorIntegrationList,
                                list[AwsSNSTopic] awsSNSTopicList,
                                list[IntegrationString] integrationStringList,
                                list[CommentClause] commentClauseList,
                                CopyIntoTable copyIntoTable
                                )) 
                                = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> PIPE <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(objNameOrId)> <for(autoIngest <- autoIngestList) {><prettySnowFlake(autoIngest)><}> <for(errorIntegration <- errorIntegrationList) {><prettySnowFlake(errorIntegration)><}> <for(awsSNSTopic <- awsSNSTopicList) {><prettySnowFlake(awsSNSTopic)><}> <for(integrationString <- integrationStringList) {><prettySnowFlake(integrationString)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}> AS <prettySnowFlake(copyIntoTable)>";

public str prettySnowFlake(AutoIngest::autoIngest(Boolean boolVal)) = "AUTO_INGEST = <prettySnowFlake(boolVal)>";

public str prettySnowFlake(ErrorIntegration::errorIntegration(Identifier id)) = "ERROR_INTEGRATION = <prettySnowFlake(id)>";

public str prettySnowFlake(IntegrationString::integrationString(String string)) = "INTEGRATION = <prettySnowFlake(string)>";

public str prettySnowFlake(CreateRole::createRole(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, Identifier id, list[WithTags] withTagsList, list[CommentClause] commentClauseList)) 
                                                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> ROLE <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(id)> <for(withTags <- withTagsList) {><prettySnowFlake(withTags)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(CreateRowAccessPolicy::createRowAccessPolicy(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, Identifier id,
                                        list[ArgDataTypeList] argDataTypeList, Exp exp, list[CommentClause] commentClauseList
                                        )) 
                                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> ROW ACCESS POLICY <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(id)> AS ( <for(argDataType <- argDataTypeList) {><prettySnowFlake(argDataType)><}> ) RETURNS BOOLEAN -\> <prettySnowFlake(exp)> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(CreateReplicationGroup::replicationGroupAllowed(list[IfNotExists] ifNotExistsList, Identifier id, ObjectTypes objectTypes,
                                        list[AllowedDatabases] allowedDatabasesList, list[AllowedShares] allowedSharesList, list[AllowedIntegrationTypes] allowedIntegrationTypesList,
                                        ObjectColumnNameOrIdentifier objNameOrId, list[IgnoreEditionCheck] ignoreEditionCheckList, list[ReplicationSchedule] replicationScheduleList
                                        )) 
                                        = "CREATE REPLICATION GROUP <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(id)> <prettySnowFlake(objectTypes)> <for(allowedDatabases <- allowedDatabasesList) {><prettySnowFlake(allowedDatabases)><}> <for(allowedShares <- allowedSharesList) {><prettySnowFlake(allowedShares)><}> <for(allowedIntegrationTypes <- allowedIntegrationTypesList) {><prettySnowFlake(allowedIntegrationTypes)><}> <for(allowedIntegrationTypes <- allowedIntegrationTypesList) {><prettySnowFlake(allowedIntegrationTypes)><}> ALLOWED_ACCOUNTS = <prettySnowFlake(objNameOrId)> <for(ignoreEditionCheck <- ignoreEditionCheckList) {><prettySnowFlake(ignoreEditionCheck)><}> <for(replicationSchedule <- replicationScheduleList) {><prettySnowFlake(replicationSchedule)><}>";

public str prettySnowFlake(CreateReplicationGroup::replicationGroupReplica(list[IfNotExists] ifNotExistsList, Identifier id, AsReplicaOfObjectName asReplicaOfObjectName
                                        )) 
                                        = "CREATE REPLICATION GROUP <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(id)> <prettySnowFlake(asReplicaOfObjectName)>";

public str prettySnowFlake(CreateResourceMonitor::createResourceMonitor(list[OrReplace] orReplaceList, Identifier id, list[CreditQuota] creditQuotaList, list[Frequency] frequencyList,
                                        list[StartTimeStamp] startTimeStampList, list[EndTimeStamp] endTimeStampList, list[NotifyUsers] notifyUsersList, list[Triggers] triggersList
                                )) 
                                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> RESOURCE MONITOR <prettySnowFlake(id)> WITH <for(creditQuota <- creditQuotaList) {><prettySnowFlake(creditQuota)><}> <for(frequency <- frequencyList) {><prettySnowFlake(frequency)><}> <for(startTimeStamp <- startTimeStampList) {><prettySnowFlake(startTimeStamp)><}> <for(endTimeStamp <- endTimeStampList) {><prettySnowFlake(endTimeStamp)><}> <for(notifyUsers <- notifyUsersList) {><prettySnowFlake(notifyUsers)><}> <for(triggers <- triggersList) {><prettySnowFlake(triggers)><}>";

public str prettySnowFlake(CreateSequence::createSequence(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                list[StartWith] startWithList, list[IncrementBy] incrementByList, list[OrderNoOrder] orderNoOrderList, list[CommentClause] commentClauseList
                                )) 
                                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> SEQUENCE <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(objNameOrId)> WITH <for(startWith <- startWithList) {><prettySnowFlake(startWith)><}> <for(incrementBy <- incrementByList) {><prettySnowFlake(incrementBy)><}> <for(orderNoOrder <- orderNoOrderList) {><prettySnowFlake(orderNoOrder)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(CreateSequence::createSequenceNoWith(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                list[StartWith] startWithList, list[IncrementBy] incrementByList, list[OrderNoOrder] orderNoOrderList, list[CommentClause] commentClauseList
                                )) 
                                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> SEQUENCE <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(objNameOrId)> <for(startWith <- startWithList) {><prettySnowFlake(startWith)><}> <for(incrementBy <- incrementByList) {><prettySnowFlake(incrementBy)><}> <for(orderNoOrder <- orderNoOrderList) {><prettySnowFlake(orderNoOrder)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(CreateSessionPolicy::createSessionPolicy(list[OrReplace] orReplaceList, list[IfExists] ifExistsList, Identifier id,
                                        list[SessionIdleTimeOut] sessionIdleTimeOutList, list[SessionUIIdleTimeOut] sessionUIIdleTimeOutList, list[CommentClause] commentClauseList
                                )) 
                                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> SESSION POLICY <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> <for(sessionIdleTimeOut <- sessionIdleTimeOutList) {><prettySnowFlake(sessionIdleTimeOut)><}> <for(sessionUIIdleTimeOut <- sessionUIIdleTimeOutList) {><prettySnowFlake(sessionUIIdleTimeOut)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(SessionIdleTimeOut::sessionIdleTimeOut(Int integer)) = "SESSION_IDLE_TIMEOUT_MINS = <prettySnowFlake(integer)>";

public str prettySnowFlake(SessionUIIdleTimeOut::sessionUIIdleTimeOut(Int integer)) = "SESSION_UI_IDLE_TIMEOUT_MINS = <prettySnowFlake(integer)>";

public str prettySnowFlake(CreateShare::createShare(list[OrReplace] orReplaceList, Identifier id, list[CommentClause] commentClauseList)) = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> SHARE <prettySnowFlake(id)> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(CreateFunction::createFunctionOpt1(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId, list[ArgDataTypeList] argDataTypeList,
                                ReturnsType returnsType, list[NullNotNull] nullNotNullList, list[CalledReturnsOrStrict] calledReturnsOrStrictList,
                                list[VolatileOrImmutable] volatileOrImmutableList, list[CommentClause] commentClauseList,  String string
                                )) 
                                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> FUNCTION <prettySnowFlake(objNameOrId)> ( <for(argDataType <- argDataTypeList) {><prettySnowFlake(argDataType)><}> ) RETURNS <prettySnowFlake(returnsType)> <for(nullNotNull <- nullNotNullList) {><prettySnowFlake(nullNotNull)><}> LANGUAGE JAVASCRIPT <for(calledReturnsOrStrict <- calledReturnsOrStrictList) {><prettySnowFlake(calledReturnsOrStrict)><}> <for(volatileOrImmutable <- volatileOrImmutableList) {><prettySnowFlake(volatileOrImmutable)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}> AS <prettySnowFlake(string)>";

public str prettySnowFlake(CreateFunction::createFunctionOpt2(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId, list[ArgDataTypeList] argDataTypeList,
                                ReturnsType returnsType, list[NullNotNull] nullNotNullList, list[CalledReturnsOrStrict] calledReturnsOrStrictList,
                                list[VolatileOrImmutable] volatileOrImmutableList, list[CommentClause] commentClauseList,  String string
                                )) 
                                = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> SECURE FUNCTION <prettySnowFlake(objNameOrId)> ( <for(argDataType <- argDataTypeList) {><prettySnowFlake(argDataType)><}> ) RETURNS <prettySnowFlake(returnsType)> <for(nullNotNull <- nullNotNullList) {><prettySnowFlake(nullNotNull)><}> LANGUAGE JAVASCRIPT <for(calledReturnsOrStrict <- calledReturnsOrStrictList) {><prettySnowFlake(calledReturnsOrStrict)><}> <for(volatileOrImmutable <- volatileOrImmutableList) {><prettySnowFlake(volatileOrImmutable)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}> AS <prettySnowFlake(string)>";

public str prettySnowFlake(CreateFunction::createFunctionOpt3(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId, list[ArgDataTypeList] argDataTypeList,
                                ReturnsType returnsType, list[NullNotNull] nullNotNullList, list[CalledReturnsOrStrict] calledReturnsOrStrictList,
                                list[VolatileOrImmutable] volatileOrImmutableList, list[CommentClause] commentClauseList,  String string
                                )) 
                                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> FUNCTION <prettySnowFlake(objNameOrId)> ( <for(argDataType <- argDataTypeList) {><prettySnowFlake(argDataType)><}> ) RETURNS <prettySnowFlake(returnsType)> <for(nullNotNull <- nullNotNullList) {><prettySnowFlake(nullNotNull)><}> <for(calledReturnsOrStrict <- calledReturnsOrStrictList) {><prettySnowFlake(calledReturnsOrStrict)><}> <for(volatileOrImmutable <- volatileOrImmutableList) {><prettySnowFlake(volatileOrImmutable)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}> AS <prettySnowFlake(string)>";

public str prettySnowFlake(CreateFunction::createFunctionOpt4(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId, list[ArgDataTypeList] argDataTypeList,
                                ReturnsType returnsType, list[NullNotNull] nullNotNullList, list[CalledReturnsOrStrict] calledReturnsOrStrictList,
                                list[VolatileOrImmutable] volatileOrImmutableList, list[CommentClause] commentClauseList,  String string
                                )) 
                                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> FUNCTION <prettySnowFlake(objNameOrId)> ( <for(argDataType <- argDataTypeList) {><prettySnowFlake(argDataType)><}> ) RETURNS <prettySnowFlake(returnsType)> <for(nullNotNull <- nullNotNullList) {><prettySnowFlake(nullNotNull)><}> <for(calledReturnsOrStrict <- calledReturnsOrStrictList) {><prettySnowFlake(calledReturnsOrStrict)><}> <for(volatileOrImmutable <- volatileOrImmutableList) {><prettySnowFlake(volatileOrImmutable)><}> MEMOIZABLE <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}> AS <prettySnowFlake(string)>";

public str prettySnowFlake(CreateFunction::createFunctionOpt5(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId, list[ArgDataTypeList] argDataTypeList,
                                ReturnsType returnsType, list[NullNotNull] nullNotNullList, list[CalledReturnsOrStrict] calledReturnsOrStrictList,
                                list[VolatileOrImmutable] volatileOrImmutableList, list[CommentClause] commentClauseList,  String string
                                )) 
                                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> SECURE FUNCTION <prettySnowFlake(objNameOrId)> ( <for(argDataType <- argDataTypeList) {><prettySnowFlake(argDataType)><}> ) RETURNS <prettySnowFlake(returnsType)> <for(nullNotNull <- nullNotNullList) {><prettySnowFlake(nullNotNull)><}> <for(calledReturnsOrStrict <- calledReturnsOrStrictList) {><prettySnowFlake(calledReturnsOrStrict)><}> <for(volatileOrImmutable <- volatileOrImmutableList) {><prettySnowFlake(volatileOrImmutable)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}> AS <prettySnowFlake(string)>";

public str prettySnowFlake(CreateFunction::createFunctionOpt6(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId, list[ArgDataTypeList] argDataTypeList,
                                ReturnsType returnsType, list[NullNotNull] nullNotNullList, list[CalledReturnsOrStrict] calledReturnsOrStrictList,
                                list[VolatileOrImmutable] volatileOrImmutableList, list[CommentClause] commentClauseList,  String string
                                )) 
                                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> SECURE FUNCTION <prettySnowFlake(objNameOrId)> ( <for(argDataType <- argDataTypeList) {><prettySnowFlake(argDataType)><}> ) RETURNS <prettySnowFlake(returnsType)> <for(nullNotNull <- nullNotNullList) {><prettySnowFlake(nullNotNull)><}> <for(calledReturnsOrStrict <- calledReturnsOrStrictList) {><prettySnowFlake(calledReturnsOrStrict)><}> <for(volatileOrImmutable <- volatileOrImmutableList) {><prettySnowFlake(volatileOrImmutable)><}> MEMOIZABLE <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}> AS <prettySnowFlake(string)>";

public str prettySnowFlake(ReturnsType::returnsDataType(DataType dataType)) = "<prettySnowFlake(dataType)>";

public str prettySnowFlake(ReturnsType::returnsTable(list[ColDeclList] colDeclList)) = "TABLE ( <for(colDecl <- colDeclList) {><prettySnowFlake(colDecl)><}> )";

public str prettySnowFlake(CalledReturnsOrStrict::calledOnNull()) = "CALLED ON NULL INPUT";

public str prettySnowFlake(CalledReturnsOrStrict::returnsNull()) = "RETURNS NULL ON NULL INPUT";

public str prettySnowFlake(CalledReturnsOrStrict::returnsStrict()) = "STRICT";

public str prettySnowFlake(ColDeclList::colDeclList(list[ColDecl] colDeclList)) = "<intercalate(", ", [ prettySnowFlake(colDecl) | colDecl <- colDeclList ])>";

public str prettySnowFlake(CreateMaskingPolicy::createMaskingPolicy(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                        list[ArgDataTypeList] argDataTypeList, Identifier id, Exp exp, list[CommentClause] commentClauseList
                                        )) 
                                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> MASKING POLICY <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(objNameOrId)> AS ( <for(argDataType <- argDataTypeList) {><prettySnowFlake(argDataType)><}> ) RETURNS <prettySnowFlake(id)> -\> <prettySnowFlake(exp)> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}>";

public str prettySnowFlake(CreateMaterializedView::createMaterializedViewNoSecure(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                        list[BracketColumnListWithComment] bracketColumnListWithComment,
                                        list[ViewCol] viewColList,
                                        list[WithRowAccessPolicy] withRowAccessPolicyList,
                                        list[WithTags] withTagsList, 
                                        list[CopyGrants] copyGrantsList, 
                                        list[CommentClause] commentClauseList,
                                        list[ClusterBy] clusterByList, SelectStatement selectStatement
                                        )) 
                                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> MATERIALIZED VIEW <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(objNameOrId)> <for(bracketColumnWithComment <- bracketColumnListWithComment) {><prettySnowFlake(bracketColumnWithComment)><}> <for(viewCol <- viewColList) {><prettySnowFlake(viewCol)> <}> <for(withRowAccessPolicy <- withRowAccessPolicyList) {><prettySnowFlake(withRowAccessPolicy)><}> <for(withTags <- withTagsList) {><prettySnowFlake(withTags)><}> <for(copyGrants <- copyGrantsList) {><prettySnowFlake(copyGrants)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}> <for(clusterBy <- clusterByList) {><prettySnowFlake(clusterBy)><}> AS <prettySnowFlake(selectStatement)>";

public str prettySnowFlake(CreateMaterializedView::createMaterializedViewSecure(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                       list[BracketColumnListWithComment] bracketColumnListWithComment,
                                        list[ViewCol] viewColList,
                                        list[WithRowAccessPolicy] withRowAccessPolicyList,
                                        list[WithTags] withTagsList, 
                                        list[CopyGrants] copyGrantsList, 
                                        list[CommentClause] commentClauseList,
                                        list[ClusterBy] clusterByList, SelectStatement selectStatement
                                        )) 
                                        = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> SECURE MATERIALIZED VIEW <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(objNameOrId)> <for(bracketColumnWithComment <- bracketColumnListWithComment) {><prettySnowFlake(bracketColumnWithComment)><}> <for(viewCol <- viewColList) {><prettySnowFlake(viewCol)> <}> <for(withRowAccessPolicy <- withRowAccessPolicyList) {><prettySnowFlake(withRowAccessPolicy)><}> <for(withTags <- withTagsList) {><prettySnowFlake(withTags)><}> <for(copyGrants <- copyGrantsList) {><prettySnowFlake(copyGrants)><}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}> <for(clusterBy <- clusterByList) {><prettySnowFlake(clusterBy)><}> AS <prettySnowFlake(selectStatement)>";

public str prettySnowFlake(WhSize::sizeXsmall()) = "XSMALL";

public str prettySnowFlake(WhSize::sizeSmall()) = "SMALL";

public str prettySnowFlake(WhSize::sizeMedium()) = "MEDIUM";

public str prettySnowFlake(WhSize::sizeLarge()) = "LARGE";

public str prettySnowFlake(WhSize::sizeXlarge()) = "XLARGE";

public str prettySnowFlake(WhSize::sizeXxlarge()) = "XXLARGE";

public str prettySnowFlake(WhSize::sizeXxxlarge()) = "XXXLARGE";

public str prettySnowFlake(WhSize::sizeX4large()) = "X4LARGE";

public str prettySnowFlake(WhSize::sizeX5large()) = "X5LARGE";

public str prettySnowFlake(WhSize::sizeX6large()) = "X6LARGE";

public str prettySnowFlake(Call::callClause(ObjectColumnNameOrIdentifier objNameOrId, list[ExpList] expListList)) = "CALL <prettySnowFlake(objNameOrId)>( <for(expList <- expListList) {><prettySnowFlake(expList)><}> )";

public str prettySnowFlake(DropCommand::dropDatabaseCommand(DropDatabase dropDatabase)) = "<prettySnowFlake(dropDatabase)>";

public str prettySnowFlake(DropCommand::dropAlertCommand(DropAlert dropAlert)) = "<prettySnowFlake(dropAlert)>";

public str prettySnowFlake(DropCommand::dropConnectionCommand(DropConnection dropConnection)) = "<prettySnowFlake(dropConnection)>";

public str prettySnowFlake(DropCommand::dropObjectCommand(DropObject dropObject)) = "<prettySnowFlake(dropObject)>";

public str prettySnowFlake(DropCommand::dropRoleCommand(DropRole dropRole)) = "<prettySnowFlake(dropRole)>";

public str prettySnowFlake(DropCommand::dropTableCommand(DropTable dropTable)) = "<prettySnowFlake(dropTable)>";

public str prettySnowFlake(DropCommand::dropDynamicTableCommand(DropDynamicTable dropDynamicTable)) = "<prettySnowFlake(dropDynamicTable)>";

public str prettySnowFlake(DropCommand::dropExternalTableCommand(DropExternalTable dropExternalTable)) = "<prettySnowFlake(dropExternalTable)>";

public str prettySnowFlake(DropCommand::dropFailoverGroupCommand(DropFailoverGroup dropFailoverGroup)) = "<prettySnowFlake(dropFailoverGroup)>";

public str prettySnowFlake(DropCommand::dropFileFormatCommand(DropFileFormat dropFileFormat)) = "<prettySnowFlake(dropFileFormat)>";

public str prettySnowFlake(DropCommand::dropFunctionCommand(DropFunction dropFunction)) = "<prettySnowFlake(dropFunction)>";

public str prettySnowFlake(DropCommand::dropIntegrationCommand(DropIntegration dropIntegration)) = "<prettySnowFlake(dropIntegration)>";

public str prettySnowFlake(DropCommand::dropManagedAccountCommand(DropManagedAccount dropManagedAccount)) = "<prettySnowFlake(dropManagedAccount)>";

public str prettySnowFlake(DropCommand::dropMaskingPolicyCommand(DropMaskingPolicy dropMaskingPolicy)) = "<prettySnowFlake(dropMaskingPolicy)>";

public str prettySnowFlake(DropCommand::dropMaterializedViewsCommand(DropMaterializedViews dropMaterializedViews)) = "<prettySnowFlake(dropMaterializedViews)>";

public str prettySnowFlake(DropCommand::dropPipeCommand(DropPipe dropPipe)) = "<prettySnowFlake(dropPipe)>";

public str prettySnowFlake(DropCommand::dropReplicationGroupCommand(DropReplicationGroup dropReplicationGroup)) = "<prettySnowFlake(dropReplicationGroup)>";

public str prettySnowFlake(DropCommand::dropResourceMonitorCommand(DropResourceMonitor dropResourceMonitor)) = "<prettySnowFlake(dropResourceMonitor)>";

public str prettySnowFlake(DropCommand::dropShareCommand(DropShare dropShare)) = "<prettySnowFlake(dropShare)>";

public str prettySnowFlake(DropCommand::dropTaskCommand(DropTask dropTask)) = "<prettySnowFlake(dropTask)>";

public str prettySnowFlake(DropCommand::dropTagCommand(DropTag dropTag)) = "<prettySnowFlake(dropTag)>";

public str prettySnowFlake(DropCommand::dropUserCommand(DropUser dropUser)) = "<prettySnowFlake(dropUser)>";

public str prettySnowFlake(DropCommand::dropViewCommand(DropView dropView)) = "<prettySnowFlake(dropView)>";

public str prettySnowFlake(DropCommand::dropWareHouseCommand(DropWareHouse dropWareHouse)) = "<prettySnowFlake(dropWareHouse)>";

public str prettySnowFlake(DropCommand::dropNetworkPolicyCommand(DropNetworkPolicy dropNetworkPolicy)) = "<prettySnowFlake(dropNetworkPolicy)>";

public str prettySnowFlake(DropCommand::dropProcedureCommand(DropProcedure dropProcedure)) = "<prettySnowFlake(dropProcedure)>";

public str prettySnowFlake(DropCommand::dropRowAccessPolicyCommand(DropRowAccessPolicy dropRowAccessPolicy)) = "<prettySnowFlake(dropRowAccessPolicy)>";

public str prettySnowFlake(DropCommand::dropSchemaCommand(DropSchema dropSchema)) = "<prettySnowFlake(dropSchema)>";

public str prettySnowFlake(DropCommand::dropSequenceCommand(DropSequence dropSequence)) = "<prettySnowFlake(dropSequence)>";

public str prettySnowFlake(DropCommand::dropSessionPolicyCommand(DropSessionPolicy dropSessionPolicy)) = "<prettySnowFlake(dropSessionPolicy)>";

public str prettySnowFlake(DropCommand::dropStageCommand(DropStage dropStage)) = "<prettySnowFlake(dropStage)>";

public str prettySnowFlake(DropCommand::dropSchemaCommand(DropSchema dropSchema)) = "<prettySnowFlake(dropSchema)>";

public str prettySnowFlake(DropCommand::dropStreamCommand(DropStream dropStream)) = "<prettySnowFlake(dropStream)>";

public str prettySnowFlake(DropDatabase::dropDatabase(list[IfExists] ifExistsList, Identifier id, list[CascadeRestrict] cascadeRestrictList)) = "DROP DATABASE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> <for(cascadeRestrict <- cascadeRestrictList) {><prettySnowFlake(cascadeRestrict)><}>";

public str prettySnowFlake(CascadeRestrict::cascadeRestrictOpt1()) = "CASCADE";

public str prettySnowFlake(CascadeRestrict::cascadeRestrictOpt2()) = "RESTRICT";

public str prettySnowFlake(DropAlert::dropAlert(Identifier id)) = "DROP ALERT <prettySnowFlake(id)>";

public str prettySnowFlake(DropConnection::dropConnection(list[IfExists] ifExistsList, Identifier id)) = "DROP CONNECTION <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)>";

public str prettySnowFlake(DropObject::dropObject(ObjectType objectTypeList, IfExists ifExists, Identifier id, list[CascadeRestrict] cascadeRestrictList)) = "DROP OBJECT <for(objectType <- objectTypeList) {><prettySnowFlake(objectType)><}> <prettySnowFlake(ifExists)> <prettySnowFlake(id)> <for(cascadeRestrict <- cascadeRestrictList) {><prettySnowFlake(cascadeRestrict)><}>";

public str prettySnowFlake(DropRole::dropRole(list[IfExists] ifExistsList, Identifier id)) = "DROP ROLE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)>";

public str prettySnowFlake(DropTable::dropTable(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, list[CascadeRestrict] cascadeRestrictList)) = "DROP TABLE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> <for(cascadeRestrict <- cascadeRestrictList) {><prettySnowFlake(cascadeRestrict)><}>";

public str prettySnowFlake(DropDynamicTable::dropDynamicTable(Identifier id)) = "DROP DYNAMIC TABLE <prettySnowFlake(id)>";

public str prettySnowFlake(DropExternalTable::dropExternalTable(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, list[CascadeRestrict] cascadeRestrictList)) = "DROP EXTERNAL TABLE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> <for(cascadeRestrict <- cascadeRestrictList) {><prettySnowFlake(cascadeRestrict)><}>";

public str prettySnowFlake(DropFailoverGroup::dropFailoverGroup(list[IfExists] ifExistsList, Identifier id)) = "DROP FAILOVER GROUP <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)>";

public str prettySnowFlake(DropFileFormat::dropFileFormat(list[IfExists] ifExistsList, Identifier id)) = "DROP FILE FORMAT <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)>";

public str prettySnowFlake(DropFunction::dropFunction(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, ArgTypes argTypes)) = "DROP FUNCTION <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> <prettySnowFlake(argTypes)>";

public str prettySnowFlake(ArgTypes::argTypes(list[DataTypeList] dataTypeList)) = "( <for(dataType <- dataTypeList) {><prettySnowFlake(dataType)><}> )";

public str prettySnowFlake(DropIntegration::dropIntegration(list[IntegrationsOptionals] integrationsOptionalsList, list[IfExists] ifExistsList, Identifier id)) = "DROP <for(integrationsOptionals <- integrationsOptionalsList) {><prettySnowFlake(integrationsOptionals)><}> INTEGRATION <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)>";

public str prettySnowFlake(IntegrationsOptionals::apiIntegrationsOpt()) = "API";

public str prettySnowFlake(IntegrationsOptionals::notificationIntegrationsOpt()) = "NOTIFICATION";

public str prettySnowFlake(IntegrationsOptionals::securityIntegrationsOpt()) = "SECURITY";

public str prettySnowFlake(IntegrationsOptionals::storageIntegrationsOpt()) = "STORAGE";

public str prettySnowFlake(DropManagedAccount::dropManagedAccount(Identifier id)) = "DROP MANAGED ACCOUNT <prettySnowFlake(id)>";

public str prettySnowFlake(DropMaskingPolicy::dropMaskingPolicy(Identifier id)) = "DROP MASKING POLICY <prettySnowFlake(id)>";

public str prettySnowFlake(DropMaterializedViews::dropMaterializedViews(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId)) = "DROP MATERIALIZED VIEW <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(DropPipe::dropPipe(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId)) = "DROP PIPE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(DropReplicationGroup::dropReplicationGroup(list[IfExists] ifExistsList, Identifier id)) = "DROP REPLICATION GROUP <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)>";

public str prettySnowFlake(DropResourceMonitor::dropResourceMonitor(Identifier id)) = "DROP RESOURCE MONITOR <prettySnowFlake(id)>";

public str prettySnowFlake(DropShare::dropShare(Identifier id)) = "DROP SHARE <prettySnowFlake(id)>";

public str prettySnowFlake(DropTask::dropTask(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId)) = "DROP TASK <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(DropTag::dropTag(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId)) = "DROP TAG <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(DropUser::dropUser(list[IfExists] ifExistsList, Identifier id)) = "DROP USER <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)>";

public str prettySnowFlake(DropView::dropView(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId)) = "DROP VIEW <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(DropWareHouse::dropWareHouse(list[IfExists] ifExistsList, IdentifierFn identifierFn)) = "DROP WAREHOUSE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(identifierFn)>";

public str prettySnowFlake(DropNetworkPolicy::dropNetworkPolicy(list[IfExists] ifExistsList, Identifier id)) = "DROP NETWORK POLICY <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)>";

public str prettySnowFlake(DropProcedure::dropProcedure(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, ArgTypes argTypes)) = "DROP PROCEDURE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> <prettySnowFlake(argTypes)>";

public str prettySnowFlake(DropRowAccessPolicy::dropRowAccessPolicy(list[IfExists] ifExistsList, Identifier id)) = "DROP ROW ACCESS POLICY <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)>";

public str prettySnowFlake(DropSchema::dropSchema(list[IfExists] ifExistsList, Identifier id, list[CascadeRestrict] cascadeRestrictList)) = "DROP SCHEMA <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> <for(cascadeRestrict <- cascadeRestrictList) {><prettySnowFlake(cascadeRestrict)><}>";

public str prettySnowFlake(DropSequence::dropSequence(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, list[CascadeRestrict] cascadeRestrictList)) = "DROP SEQUENCE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)> <for(cascadeRestrict <- cascadeRestrictList) {><prettySnowFlake(cascadeRestrict)><}>";

public str prettySnowFlake(DropSessionPolicy::dropSessionPolicy(list[IfExists] ifExistsList, Identifier id)) = "DROP SESSION POLICY <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)>";

public str prettySnowFlake(DropStage::dropStage(list[IfExists] ifExistsList, IdentifierType idType)) = "DROP STAGE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(idType)>";

public str prettySnowFlake(DropStream::dropStream(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId)) = "DROP STREAM <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(UndropCommand::undropDatabaseCommand(UndropDatabase undropDatabase)) = "<prettySnowFlake(undropDatabase)>";

public str prettySnowFlake(UndropCommand::undropSchemaCommand(UndropSchema undropSchema)) = "<prettySnowFlake(undropSchema)>";

public str prettySnowFlake(UndropCommand::undropTableCommand(UndropTable undropTable)) = "<prettySnowFlake(undropTable)>";

public str prettySnowFlake(UndropCommand::undropTagCommand(UndropTag undropTag)) = "<prettySnowFlake(undropTag)>";

public str prettySnowFlake(UndropDatabase::undropDatabase(Identifier id)) = "UNDROP DATABASE <prettySnowFlake(id)>";

public str prettySnowFlake(UndropSchema::undropSchema(ObjectColumnNameOrIdentifier objNameOrId)) = "UNDROP SCHEMA <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(UndropTable::undropTable(ObjectColumnNameOrIdentifier objNameOrId)) = "UNDROP TABLE <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(UndropTag::undropTag(ObjectColumnNameOrIdentifier objNameOrId)) = "UNDROP TAG <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(OtherCommand::copyIntoTableCommand(CopyIntoTable copyIntoTable)) = "<prettySnowFlake(copyIntoTable)>";

public str prettySnowFlake(OtherCommand::beginTransactionCommand(BeginTransaction beginTransaction)) = "<prettySnowFlake(beginTransaction)>";

public str prettySnowFlake(OtherCommand::copyIntoLocationCommand(CopyIntoLocation copyIntoLocation)) = "<prettySnowFlake(copyIntoLocation)>";

public str prettySnowFlake(OtherCommand::commentCommand(Comment comment)) = "<prettySnowFlake(comment)>";

public str prettySnowFlake(OtherCommand::commitCommand(Commit commit)) = "<prettySnowFlake(commit)>";

public str prettySnowFlake(OtherCommand::executeImmediateCommand(ExecuteImmediate executeImmediate)) = "<prettySnowFlake(executeImmediate)>";

public str prettySnowFlake(OtherCommand::executeTaskCommand(ExecuteTask executeTask)) = "<prettySnowFlake(executeTask)>";

public str prettySnowFlake(OtherCommand::getDMLCommand(GetDML getDML)) = "<prettySnowFlake(getDML)>";

public str prettySnowFlake(OtherCommand::listCommand(List listCom)) = "<prettySnowFlake(listCom)>";

public str prettySnowFlake(OtherCommand::removeCommand(Remove remove)) = "<prettySnowFlake(remove)>";

public str prettySnowFlake(OtherCommand::setCommand(Set setCom)) = "<prettySnowFlake(setCom)>";

public str prettySnowFlake(OtherCommand::unsetCommand(Unset unset)) = "<prettySnowFlake(unset)>";

public str prettySnowFlake(OtherCommand::truncateTableCommand(TruncateTable truncateTable)) = "<prettySnowFlake(truncateTable)>";

public str prettySnowFlake(OtherCommand::truncateMaterializedViewCommand(TruncateMaterializedView truncateMaterializedView)) = "<prettySnowFlake(truncateMaterializedView)>";

public str prettySnowFlake(OtherCommand::revokeRoleCommand(RevokeRole revokeRole)) = "<prettySnowFlake(revokeRole)>";

public str prettySnowFlake(OtherCommand::callCommand(Call call)) = "<prettySnowFlake(call)>";

public str prettySnowFlake(OtherCommand::putCommand(Put put)) = "<prettySnowFlake(put)>";

public str prettySnowFlake(OtherCommand::rollbackCommand(Rollback rollback)) = "<prettySnowFlake(rollback)>";

public str prettySnowFlake(ShowCommand::showAlertsCommand(ShowAlerts showAlerts)) = "<prettySnowFlake(showAlerts)>";

public str prettySnowFlake(ShowCommand::showChannelsCommand(ShowChannels showChannels)) = "<prettySnowFlake(showChannels)>";

public str prettySnowFlake(ShowCommand::showColumnsCommand(ShowColumns showColumns)) = "<prettySnowFlake(showColumns)>";

public str prettySnowFlake(ShowCommand::showConnectionsCommand(ShowConnections showConnections)) = "<prettySnowFlake(showConnections)>";

public str prettySnowFlake(ShowCommand::showDatabasesCommand(ShowDatabases showDatabases)) = "<prettySnowFlake(showDatabases)>";

public str prettySnowFlake(ShowCommand::showDatabasesInFailoverGroupCommand(ShowDatabasesInFailoverGroup showDatabasesInFailoverGroup)) = "<prettySnowFlake(showDatabasesInFailoverGroup)>";

public str prettySnowFlake(ShowCommand::showDatabasesInReplicationGroupCommand(ShowDatabasesInReplicationGroup showDatabasesInReplicationGroup)) = "<prettySnowFlake(showDatabasesInReplicationGroup)>";

public str prettySnowFlake(ShowCommand::showDelegatedAuthorizationsCommand(ShowDelegatedAuthorizations showDelegatedAuthorizations)) = "<prettySnowFlake(showDelegatedAuthorizations)>";

public str prettySnowFlake(ShowCommand::showDynamicTablesCommand(ShowDynamicTables showDynamicTables)) = "<prettySnowFlake(showDynamicTables)>";

public str prettySnowFlake(ShowCommand::showEventTablesCommand(ShowEventTables showEventTables)) = "<prettySnowFlake(showEventTables)>";

public str prettySnowFlake(ShowCommand::showExternalFunctionsCommand(ShowExternalFunctions showExternalFunctions)) = "<prettySnowFlake(showExternalFunctions)>";

public str prettySnowFlake(ShowCommand::showExternalTablesCommand(ShowExternalTables showExternalTables)) = "<prettySnowFlake(showExternalTables)>";

public str prettySnowFlake(ShowCommand::showFailoverGroupsCommand(ShowFailoverGroups showFailoverGroups)) = "<prettySnowFlake(showFailoverGroups)>";

public str prettySnowFlake(ShowCommand::showFileFormatsCommand(ShowFileFormats showFileFormats)) = "<prettySnowFlake(showFileFormats)>";

public str prettySnowFlake(ShowCommand::showFunctionsCommand(ShowFunctions showFunctions)) = "<prettySnowFlake(showFunctions)>";

public str prettySnowFlake(ShowCommand::showGlobalAccountsCommand(ShowGlobalAccounts showGlobalAccounts)) = "<prettySnowFlake(showGlobalAccounts)>";

public str prettySnowFlake(ShowCommand::showGrantsCommand(ShowGrants showGrants)) = "<prettySnowFlake(showGrants)>";

public str prettySnowFlake(ShowCommand::showIntegrationsCommand(ShowIntegrations showIntegrations)) = "<prettySnowFlake(showIntegrations)>";

public str prettySnowFlake(ShowCommand::showLocksCommand(ShowLocks showLocks)) = "<prettySnowFlake(showLocks)>";

public str prettySnowFlake(ShowCommand::showManagedAccountsCommand(ShowManagedAccounts showManagedAccounts)) = "<prettySnowFlake(showManagedAccounts)>";

public str prettySnowFlake(ShowCommand::showMaskingPoliciesCommand(ShowMaskingPolicies showMaskingPolicies)) = "<prettySnowFlake(showMaskingPolicies)>";

public str prettySnowFlake(ShowCommand::showMaterializedViewsCommand(ShowMaterializedViews showMaterializedViews)) = "<prettySnowFlake(showMaterializedViews)>";

public str prettySnowFlake(ShowCommand::showNetworkPoliciesCommand(ShowNetworkPolicies showNetworkPolicies)) = "<prettySnowFlake(showNetworkPolicies)>";

public str prettySnowFlake(ShowCommand::showObjectsCommand(ShowObjects showObjects)) = "<prettySnowFlake(showObjects)>";

public str prettySnowFlake(ShowCommand::showOrganizationAccountsCommand(ShowOrganizationAccounts showOrganizationAccounts)) = "<prettySnowFlake(showOrganizationAccounts)>";

public str prettySnowFlake(ShowCommand::showParametersCommand(ShowParameters showParameters)) = "<prettySnowFlake(showParameters)>";

public str prettySnowFlake(ShowCommand::showPipesCommand(ShowPipes showPipes)) = "<prettySnowFlake(showPipes)>";

public str prettySnowFlake(ShowCommand::showPrimaryKeysCommand(ShowPrimaryKeys showPrimaryKeys)) = "<prettySnowFlake(showPrimaryKeys)>";

public str prettySnowFlake(ShowCommand::showProceduresCommand(ShowProcedures showProcedures)) = "<prettySnowFlake(showProcedures)>";

public str prettySnowFlake(ShowCommand::showRegionsCommand(ShowRegions showRegions)) = "<prettySnowFlake(showRegions)>";

public str prettySnowFlake(ShowCommand::showReplicationAccountsCommand(ShowReplicationAccounts showReplicationAccounts)) = "<prettySnowFlake(showReplicationAccounts)>";

public str prettySnowFlake(ShowCommand::showReplicationDatabasesCommand(ShowReplicationDatabases showReplicationDatabases)) = "<prettySnowFlake(showReplicationDatabases)>";

public str prettySnowFlake(ShowCommand::showReplicationGroupsCommand(ShowReplicationGroups showReplicationGroups)) = "<prettySnowFlake(showReplicationGroups)>";

public str prettySnowFlake(ShowCommand::showResourceMonitorsCommand(ShowResourceMonitors showResourceMonitors)) = "<prettySnowFlake(showResourceMonitors)>";

public str prettySnowFlake(ShowCommand::showRolesCommand(ShowRoles showRoles)) = "<prettySnowFlake(showRoles)>";

public str prettySnowFlake(ShowCommand::showRowAccessPoliciesCommand(ShowRowAccessPolicies showRowAccessPolicies)) = "<prettySnowFlake(showRowAccessPolicies)>";

public str prettySnowFlake(ShowCommand::showSchemasCommand(ShowSchemas showSchemas)) = "<prettySnowFlake(showSchemas)>";

public str prettySnowFlake(ShowCommand::showSequencesCommand(ShowSequences showSequences)) = "<prettySnowFlake(showSequences)>";

public str prettySnowFlake(ShowCommand::showSessionPoliciesCommand(ShowSessionPolicies showSessionPolicies)) = "<prettySnowFlake(showSessionPolicies)>";

public str prettySnowFlake(ShowCommand::showSharesCommand(ShowShares showShares)) = "<prettySnowFlake(showShares)>";

public str prettySnowFlake(ShowCommand::showSharesInFailoverGroupCommand(ShowSharesInFailoverGroup showSharesInFailoverGroup)) = "<prettySnowFlake(showSharesInFailoverGroup)>";

public str prettySnowFlake(ShowCommand::showSharesInReplicationGroupCommand(ShowSharesInReplicationGroup showSharesInReplicationGroup)) = "<prettySnowFlake(showSharesInReplicationGroup)>";

public str prettySnowFlake(ShowCommand::showStagesCommand(ShowStages showStages)) = "<prettySnowFlake(showStages)>";

public str prettySnowFlake(ShowCommand::showStreamsCommand(ShowStreams showStreams)) = "<prettySnowFlake(showStreams)>";

public str prettySnowFlake(ShowCommand::showTablesCommand(ShowTables showTables)) = "<prettySnowFlake(showTables)>";

public str prettySnowFlake(ShowCommand::showTagsCommand(ShowTags showTags)) = "<prettySnowFlake(showTags)>";

public str prettySnowFlake(ShowCommand::showTasksCommand(ShowTasks showTasks)) = "<prettySnowFlake(showTasks)>";

public str prettySnowFlake(ShowCommand::showTransactionsCommand(ShowTransactions showTransactions)) = "<prettySnowFlake(showTransactions)>";

public str prettySnowFlake(ShowCommand::showUserFunctionsCommand(ShowUserFunctions showUserFunctions)) = "<prettySnowFlake(showUserFunctions)>";

public str prettySnowFlake(ShowCommand::showUsersCommand(ShowUsers showUsers)) = "<prettySnowFlake(showUsers)>";

public str prettySnowFlake(ShowCommand::showVariablesCommand(ShowVariables showVariables)) = "<prettySnowFlake(showVariables)>";

public str prettySnowFlake(ShowCommand::showViewsCommand(ShowViews showViews)) = "<prettySnowFlake(showViews)>";

public str prettySnowFlake(ShowCommand::showWareHousesCommand(ShowWareHouses showWareHouses)) = "<prettySnowFlake(showWareHouses)>";

public str prettySnowFlake(ShowAlerts::showAlerts(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)) = "SHOW TERSE ALERTS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}> <for(startsWith <- startsWithList) {><prettySnowFlake(startsWith)><}> <for(limitRows <- limitRowsList) {><prettySnowFlake(limitRows)><}>";

public str prettySnowFlake(ShowAlerts::showAlertsNoTerse(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)) = "SHOW ALERTS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}> <for(startsWith <- startsWithList) {><prettySnowFlake(startsWith)><}> <for(limitRows <- limitRowsList) {><prettySnowFlake(limitRows)><}>";

public str prettySnowFlake(LikePattern::likePattern(String string)) = "LIKE <prettySnowFlake(string)>";

public str prettySnowFlake(InShowOptionals::inShowOptionals(ShowOptionals showOptionals)) = "IN <prettySnowFlake(showOptionals)>";

public str prettySnowFlake(ShowOptionals::accountIdShowOpt(list[Identifier] idList)) = "ACCOUNT <for(id <- idList) {><prettySnowFlake(id)><}>";

public str prettySnowFlake(ShowOptionals::databaseIdShowOpt(list[Identifier] idList)) = "DATABASE <for(id <- idList) {><prettySnowFlake(id)><}>";

public str prettySnowFlake(ShowOptionals::tableNameShowOpt(list[ObjectColumnNameOrIdentifier] objNameOrIdList)) = "TABLE <for(objNameOrId <- objNameOrIdList) {><prettySnowFlake(objNameOrId)><}>";

public str prettySnowFlake(ShowOptionals::viewNameShowOpt(list[ObjectColumnNameOrIdentifier] objNameOrIdList)) = "VIEW <for(objNameOrId <- objNameOrIdList) {><prettySnowFlake(objNameOrId)><}>";

public str prettySnowFlake(ShowOptionals::schemaNameShowOpt(list[ObjectColumnNameOrIdentifier] objNameOrIdList)) = "SCHEMA <for(objNameOrId <- objNameOrIdList) {><prettySnowFlake(objNameOrId)><}>";

public str prettySnowFlake(ShowOptionals::objNameShowOpt(ObjectColumnNameOrIdentifier objNameOrId)) = "<prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(StartsWith::startsWith(String string)) = "STARTS WITH <prettySnowFlake(string)>";

public str prettySnowFlake(LimitRows::limitRows(str integer, list[FromString] fromStringList)) = "LIMIT <integer> <for(fromString <- fromStringList) {><prettySnowFlake(fromString)><}>";

public str prettySnowFlake(FromString::fromString(String string)) = "FROM <prettySnowFlake(string)>";

public str prettySnowFlake(ShowChannels::showChannels(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList)) = "SHOW CHANNELS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}>";

public str prettySnowFlake(ShowColumns::showColumns(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList)) = "SHOW COLUMNS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}>";

public str prettySnowFlake(ShowConnections::showConnections(list[LikePattern] likePatternList)) = "SHOW CONNECTIONS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}>";

public str prettySnowFlake(ShowDatabases::showDatabasesOpt1(list[LikePattern] likePatternList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)) = "SHOW TERSE DATABASES HISTORY <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(startsWith <- startsWithList) {><prettySnowFlake(startsWith)><}> <for(limitRows <- limitRowsList) {><prettySnowFlake(limitRows)><}>";

public str prettySnowFlake(ShowDatabases::showDatabasesOpt2(list[LikePattern] likePatternList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)) = "SHOW DATABASES <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(startsWith <- startsWithList) {><prettySnowFlake(startsWith)><}> <for(limitRows <- limitRowsList) {><prettySnowFlake(limitRows)><}>";

public str prettySnowFlake(ShowDatabases::showDatabasesOpt3(list[LikePattern] likePatternList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)) = "SHOW DATABASES HISTORY <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(startsWith <- startsWithList) {><prettySnowFlake(startsWith)><}> <for(limitRows <- limitRowsList) {><prettySnowFlake(limitRows)><}>";

public str prettySnowFlake(ShowDatabases::showDatabasesOpt4(list[LikePattern] likePatternList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)) = "SHOW TERSE DATABASES <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(startsWith <- startsWithList) {><prettySnowFlake(startsWith)><}> <for(limitRows <- limitRowsList) {><prettySnowFlake(limitRows)><}>";

public str prettySnowFlake(ShowDatabasesInFailoverGroup::showDatabasesInFailoverGroup(Identifier id)) = "SHOW DATABASES IN FAILOVER GROUP <prettySnowFlake(id)>";

public str prettySnowFlake(ShowDatabasesInReplicationGroup::showDatabasesInReplicationGroup(Identifier id)) = "SHOW DATABASES IN REPLICATION GROUP <prettySnowFlake(id)>";

public str prettySnowFlake(ShowDelegatedAuthorizations::showDelegatedAuthorizations()) = "SHOW DELEGATED AUTHORIZATIONS";

public str prettySnowFlake(ShowDelegatedAuthorizations::showDelegatedAuthorizationsByUser(Identifier id)) = "SHOW DELEGATED AUTHORIZATIONS BY USER <prettySnowFlake(id)>";

public str prettySnowFlake(ShowDelegatedAuthorizations::showDelegatedAuthorizationsToSecurity(Identifier id)) = "SHOW DELEGATED AUTHORIZATIONS TO SECURITY INTEGRATION <prettySnowFlake(id)>";

public str prettySnowFlake(ShowDynamicTables::showDynamicTables(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)) = "SHOW DYNAMIC TABLES <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}> <for(startsWith <- startsWithList) {><prettySnowFlake(startsWith)><}> <for(limitRows <- limitRowsList) {><prettySnowFlake(limitRows)><}>";

public str prettySnowFlake(ShowEventTables::showEventTables(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)) = "SHOW TERSE EVENT TABLES <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}> <for(startsWith <- startsWithList) {><prettySnowFlake(startsWith)><}> <for(limitRows <- limitRowsList) {><prettySnowFlake(limitRows)><}>";

public str prettySnowFlake(ShowEventTables::showEventTablesNoTerse(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)) = "SHOW EVENT TABLES <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}> <for(startsWith <- startsWithList) {><prettySnowFlake(startsWith)><}> <for(limitRows <- limitRowsList) {><prettySnowFlake(limitRows)><}>";

public str prettySnowFlake(ShowExternalFunctions::showExternalFunctions(list[LikePattern] likePatternList)) = "SHOW EXTERNAL FUNCTIONS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}>";

public str prettySnowFlake(ShowExternalTables::showExternalTables(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)) = "SHOW TERSE EXTERNAL TABLES <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}> <for(startsWith <- startsWithList) {><prettySnowFlake(startsWith)><}> <for(limitRows <- limitRowsList) {><prettySnowFlake(limitRows)><}>";

public str prettySnowFlake(ShowExternalTables::showExternalTablesNoTerse(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)) = "SHOW EXTERNAL TABLES <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}> <for(startsWith <- startsWithList) {><prettySnowFlake(startsWith)><}> <for(limitRows <- limitRowsList) {><prettySnowFlake(limitRows)><}>";

public str prettySnowFlake(ShowFailoverGroups::showFailoverGroups(list[InShowOptionals] inShowOptionalsList)) = "SHOW FAILOVER GROUPS <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}>";

public str prettySnowFlake(ShowFileFormats::showFileFormats(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList)) = "SHOW FILE FORMATS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}>";

public str prettySnowFlake(ShowFunctions::showFunctions(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList)) = "SHOW FUNCTIONS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}>";

public str prettySnowFlake(ShowGlobalAccounts::showGlobalAccounts(list[LikePattern] likePatternList)) = "SHOW GLOBAL ACCOUNTS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}>";

public str prettySnowFlake(ShowGrants::showGrantsOptionals(list[ShowGrantOptionals] showGrantOptionalsList)) = "SHOW GRANTS <for(showGrantOptionals <- showGrantOptionalsList) {><prettySnowFlake(showGrantOptionals)><}>";

public str prettySnowFlake(ShowGrants::showGrantsInSchema(ObjectColumnNameOrIdentifier objNameOrId)) = "SHOW FUTURE GRANTS IN SCHEMA <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(ShowGrants::showGrantsInDatabase(Identifier id)) = "SHOW FUTURE GRANTS IN DATABASE <prettySnowFlake(id)>";

public str prettySnowFlake(ShowGrantOptionals::onAccountShowGrantOpt()) = "ON ACCOUNT";

public str prettySnowFlake(ShowGrantOptionals::onObjectNameShowGrantOpt(ObjectType objectType, ObjectColumnNameOrIdentifier objNameOrId)) = "ON <prettySnowFlake(objectType)> <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(ShowGrantOptionals::toRoleShareShowGrantOpt(RoleUserOrShareId roleUserOrShareId)) = "TO <prettySnowFlake(roleUserOrShareId)>";

public str prettySnowFlake(ShowGrantOptionals::ofRoleShowGrantOpt(Identifier id)) = "OF ROLE <prettySnowFlake(id)>";

public str prettySnowFlake(ShowGrantOptionals::ofShareShowGrantOpt(Identifier id)) = "OF SHARE <prettySnowFlake(id)>";

public str prettySnowFlake(RoleUserOrShareId::roleId(Identifier id)) = "ROLE <prettySnowFlake(id)>";

public str prettySnowFlake(RoleUserOrShareId::userId(Identifier id)) = "USER <prettySnowFlake(id)>";

public str prettySnowFlake(RoleUserOrShareId::shareId(Identifier id)) = "SHARE <prettySnowFlake(id)>";

public str prettySnowFlake(ShowIntegrations::showIntegrations(list[IntegrationsOptionals] integrationsOptionalsList, list[LikePattern] likePatternList)) = "SHOW <for(integrationsOptionals <- integrationsOptionalsList) {><prettySnowFlake(integrationsOptionals)><}> INTEGRATIONS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}>";

public str prettySnowFlake(ShowLocks::showLocks(list[InAccount] inAccountList)) = "SHOW LOCKS <for(inAccount <- inAccountList) {><prettySnowFlake(inAccount)><}>";

public str prettySnowFlake(InAccount::inAccount()) = "IN ACCOUNT";

public str prettySnowFlake(ShowManagedAccounts::showManagedAccounts(list[LikePattern] likePatternList)) = "SHOW MANAGED ACCOUNTS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}>";

public str prettySnowFlake(ShowMaskingPolicies::showMaskingPolicies(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList)) = "SHOW MASKING POLICIES <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}>";

public str prettySnowFlake(ShowMaterializedViews::showMaterializedViews(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList)) = "SHOW MATERIALIZED VIEWS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}>";

public str prettySnowFlake(ShowNetworkPolicies::showNetworkPolicies()) = "SHOW NETWORK POLICIES";

public str prettySnowFlake(ShowObjects::showObjects(list[LikePattern] likePatternList, list[ShowOptionals] showOptionalsList)) = "SHOW OBJECTS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(showOptionals <- showOptionalsList) {><prettySnowFlake(showOptionals)><}>";

public str prettySnowFlake(ShowOrganizationAccounts::showOrganizationAccounts(list[LikePattern] likePatternList)) = "SHOW ORGANIZATION ACCOUNTS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}>";

public str prettySnowFlake(ShowParameters::showParameters(list[LikePattern] likePatternList, list[InOrForShowParameter] inOrForShowParameterList)) = "SHOW PARAMETERS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inOrForShowParameter <- inOrForShowParameterList) {><prettySnowFlake(inOrForShowParameter)><}>";

public str prettySnowFlake(InOrForShowParameter::inOrForShowParameter(InOrFor inOrFor, ShowParameterOptionals showParameterOptionals)) = "<prettySnowFlake(inOrFor)> <prettySnowFlake(showParameterOptionals)>";

public str prettySnowFlake(InOrFor::inOrForOpt1()) = "IN";

public str prettySnowFlake(InOrFor::inOrForOpt2()) = "FOR";

public str prettySnowFlake(ShowParameterOptionals::sessionShowParameterOpt()) = "SESSION";

public str prettySnowFlake(ShowParameterOptionals::accountShowParameterOpt()) = "ACCOUNT";

public str prettySnowFlake(ShowParameterOptionals::userIdShowParameterOpt(list[Identifier] idList)) = "USER <for(id <- idList) {><prettySnowFlake(id)><}>";

public str prettySnowFlake(ShowParameterOptionals::paramObjShowParameterOpt(ShowParameterObjects showParameterObjects)) = "<prettySnowFlake(showParameterObjects)>";

public str prettySnowFlake(ShowParameterOptionals::tableNameShowParameterOpt(ObjectColumnNameOrIdentifier objNameOrId)) = "TABLE <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(ShowParameterObjects::warehouseIdShowParameterObj(list[Identifier] idList)) = "WAREHOUSE <for(id <- idList) {><prettySnowFlake(id)><}>";

public str prettySnowFlake(ShowParameterObjects::databaseidShowParameterObj(list[Identifier] idList)) = "DATABASE <for(id <- idList) {><prettySnowFlake(id)><}>";

public str prettySnowFlake(ShowParameterObjects::schemaIdShowParameterObj(list[Identifier] idList)) = "SCHEMA <for(id <- idList) {><prettySnowFlake(id)><}>";

public str prettySnowFlake(ShowParameterObjects::taskIdShowParameterObj(list[Identifier] idList)) = "TASK <for(id <- idList) {><prettySnowFlake(id)><}>";

public str prettySnowFlake(ShowPipes::showPipes(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList)) = "SHOW PIPES <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}>";

public str prettySnowFlake(ShowPrimaryKeys::showPrimaryKeysNoTerse(list[InShowOptionals] inShowOptionalsList)) = "SHOW PRIMARY KEYS <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}>";

public str prettySnowFlake(ShowPrimaryKeys::showPrimaryKeys(list[InShowOptionals] inShowOptionalsList)) = "SHOW TERSE PRIMARY KEYS <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}>";

public str prettySnowFlake(ShowProcedures::showProcedures(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList)) = "SHOW PROCEDURES <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}>";

public str prettySnowFlake(ShowRegions::showRegions(list[LikePattern] likePatternList)) = "SHOW REGIONS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}>";

public str prettySnowFlake(ShowReplicationAccounts::showReplicationAccounts(list[LikePattern] likePatternList)) = "SHOW REPLICATION ACCOUNTS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}>";

public str prettySnowFlake(ShowReplicationDatabases::showReplicationDatabases(list[LikePattern] likePatternList, list[WithPrimaryColName] withPrimaryColNameList)) = "SHOW REPLICATION DATABASES <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(withPrimaryColName <- withPrimaryColNameList) {><prettySnowFlake(withPrimaryColName)><}>";

public str prettySnowFlake(WithPrimaryColName::withPrimaryColName(ObjectColumnNameOrIdentifier objNameOrId)) = "WITH PRIMARY <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(ShowReplicationGroups::showReplicationGroups(list[InShowOptionals] inShowOptionalsList)) = "SHOW REPLICATION GROUPS <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}>";

public str prettySnowFlake(ShowResourceMonitors::showResourceMonitors(list[LikePattern] likePatternList)) = "SHOW RESOURCE MONITORS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}>";

public str prettySnowFlake(ShowRoles::showRoles(list[LikePattern] likePatternList)) = "SHOW ROLES <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}>";

public str prettySnowFlake(ShowRowAccessPolicies::showRowAccessPolicies(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList)) = "SHOW ROW ACCESS POLICIES <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}>";

public str prettySnowFlake(ShowSchemas::showSchemasOpt1(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)) = "SHOW TERSE SCHEMAS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}> <for(startsWith <- startsWithList) {><prettySnowFlake(startsWith)><}> <for(limitRows <- limitRowsList) {><prettySnowFlake(limitRows)><}>";

public str prettySnowFlake(ShowSchemas::showSchemasOpt2(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)) = "SHOW TERSE SCHEMAS HISTORY <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}> <for(startsWith <- startsWithList) {><prettySnowFlake(startsWith)><}> <for(limitRows <- limitRowsList) {><prettySnowFlake(limitRows)><}>";

public str prettySnowFlake(ShowSchemas::showSchemasOpt3(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)) = "SHOW SCHEMAS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}> <for(startsWith <- startsWithList) {><prettySnowFlake(startsWith)><}> <for(limitRows <- limitRowsList) {><prettySnowFlake(limitRows)><}>";

public str prettySnowFlake(ShowSchemas::showSchemasOpt4(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)) = "SHOW SCHEMAS HISTORY <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}> <for(startsWith <- startsWithList) {><prettySnowFlake(startsWith)><}> <for(limitRows <- limitRowsList) {><prettySnowFlake(limitRows)><}>";

public str prettySnowFlake(ShowSequences::showSequences(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList)) = "SHOW SEQUENCES <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}>";

public str prettySnowFlake(ShowSessionPolicies::showSessionPolicies()) = "SHOW SESSION POLICIES";

public str prettySnowFlake(ShowShares::showShares(list[LikePattern] likePatternList)) = "SHOW SHARES <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}>";

public str prettySnowFlake(ShowSharesInFailoverGroup::showSharesInFailoverGroup(Identifier id)) = "SHOW SHARES IN FAILOVER GROUP <prettySnowFlake(id)>";

public str prettySnowFlake(ShowSharesInReplicationGroup::showSharesInReplicationGroup(Identifier id)) = "SHOW SHARES IN REPLICATION GROUP <prettySnowFlake(id)>";

public str prettySnowFlake(ShowStages::showStages(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList)) = "SHOW STAGES <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}>";

public str prettySnowFlake(ShowStreams::showStreams(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList)) = "SHOW STREAMS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}>";

public str prettySnowFlake(ShowTables::showTables(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList)) = "SHOW TABLES <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}>";

public str prettySnowFlake(ShowTags::showTags(list[LikePattern] likePatternList, list[ShowTagsOptionals] showTagsOptionalsList)) = "SHOW TAGS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(showTagsOptionals <- showTagsOptionalsList) {><prettySnowFlake(showTagsOptionals)><}>";

public str prettySnowFlake(ShowTagsOptionals::inAccountShowTagsOpt(InAccount inAccount)) = "<prettySnowFlake(inAccount)>";

public str prettySnowFlake(ShowTagsOptionals::databaseIdShowTagsOpt(list[Identifier] idList)) = "DATABASE <for(id <- idList) {><prettySnowFlake(id)><}>";

public str prettySnowFlake(ShowTagsOptionals::schemaIdShowTagsOpt(list[Identifier] idList)) = "SCHEMA <for(id <- idList) {><prettySnowFlake(id)><}>";

public str prettySnowFlake(ShowTagsOptionals::idShowTagsOpt(Identifier id)) = "<prettySnowFlake(id)>";

public str prettySnowFlake(ShowTasks::showTasks(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)) = "SHOW TERSE TASKS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}> <for(startsWith <- startsWithList) {><prettySnowFlake(startsWith)><}> <for(limitRows <- limitRowsList) {><prettySnowFlake(limitRows)><}>";

public str prettySnowFlake(ShowTasks::showTasksNoTerse(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)) = "SHOW TASKS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}> <for(startsWith <- startsWithList) {><prettySnowFlake(startsWith)><}> <for(limitRows <- limitRowsList) {><prettySnowFlake(limitRows)><}>";

public str prettySnowFlake(ShowTransactions::showTransactions(list[InAccount] inAccountList)) = "SHOW TRANSACTIONS <for(inAccount <- inAccountList) {><prettySnowFlake(inAccount)><}>";

public str prettySnowFlake(ShowUserFunctions::showUserFunctions(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList)) = "SHOW USER FUNCTIONS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}>";

public str prettySnowFlake(ShowUsers::showUsers(list[LikePattern] likePatternList, list[StartsWith] startsWithList, list[LimitInt] limitIntList, list[FromString] fromStringList)) = "SHOW TERSE USERS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(startsWith <- startsWithList) {><prettySnowFlake(startsWith)><}> <for(limitInt <- limitIntList) {><prettySnowFlake(limitInt)><}> <for(fromString <- fromStringList) {><prettySnowFlake(fromString)><}>";

public str prettySnowFlake(ShowUsers::showUsersNoTerse(list[LikePattern] likePatternList, list[StartsWith] startsWithList, list[LimitInt] limitIntList, list[FromString] fromStringList)) = "SHOW USERS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(startsWith <- startsWithList) {><prettySnowFlake(startsWith)><}> <for(limitInt <- limitIntList) {><prettySnowFlake(limitInt)><}> <for(fromString <- fromStringList) {><prettySnowFlake(fromString)><}>";

public str prettySnowFlake(LimitInt::limitInt(str integer)) = "LIMIT <integer>";

public str prettySnowFlake(ShowVariables::showVariables(list[LikePattern] likePatternList)) = "SHOW VARIABLES <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}>";

public str prettySnowFlake(ShowViews::showViews(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)) = "SHOW TERSE VIEWS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}> <for(startsWith <- startsWithList) {><prettySnowFlake(startsWith)><}> <for(limitRows <- limitRowsList) {><prettySnowFlake(limitRows)><}>";

public str prettySnowFlake(ShowViews::showViewsNoTerse(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)) = "SHOW VIEWS <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}> <for(inShowOptionals <- inShowOptionalsList) {><prettySnowFlake(inShowOptionals)><}> <for(startsWith <- startsWithList) {><prettySnowFlake(startsWith)><}> <for(limitRows <- limitRowsList) {><prettySnowFlake(limitRows)><}>";

public str prettySnowFlake(ShowWareHouses::showWareHouses(list[LikePattern] likePatternList)) = "SHOW WAREHOUSES <for(likePattern <- likePatternList) {><prettySnowFlake(likePattern)><}>";

public str prettySnowFlake(UseCommand::useDatabaseCommand(UseDatabase useDatabase)) = "<prettySnowFlake(useDatabase)>";

public str prettySnowFlake(UseCommand::useRoleCommand(UseRole useRole)) = "<prettySnowFlake(useRole)>";

public str prettySnowFlake(UseCommand::useSchemaCommand(UseSchema useSchema)) = "<prettySnowFlake(useSchema)>";

public str prettySnowFlake(UseCommand::useSecondaryRolesCommand(UseSecondaryRoles useSecondaryRoles)) = "<prettySnowFlake(useSecondaryRoles)>";

public str prettySnowFlake(UseCommand::useWarehouseCommand(UseWarehouse useWarehouse)) = "<prettySnowFlake(useWarehouse)>";

public str prettySnowFlake(UseDatabase::useDatabase(Identifier id)) = "USE DATABASE <prettySnowFlake(id)>";

public str prettySnowFlake(UseRole::useRole(Identifier id)) = "USE ROLE <prettySnowFlake(id)>";

public str prettySnowFlake(UseSchema::useSchema(ObjectColumnNameOrIdentifier objNameOrId)) = "USE SCHEMA <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(UseSchema::useNoSchema(ObjectColumnNameOrIdentifier objNameOrId)) = "USE <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(UseSecondaryRoles::useSecondaryRoles(AllOrNone allOrNone)) = "USE SECONDARY ROLES <prettySnowFlake(allOrNone)>";

public str prettySnowFlake(AllOrNone::allOrNoneOpt1()) = "ALL";

public str prettySnowFlake(AllOrNone::allOrNoneOpt2()) = " NONE";

public str prettySnowFlake(UseWarehouse::useWarehouse(IdentifierFn idFn)) = "USE WAREHOUSE <prettySnowFlake(idFn)>";

public str prettySnowFlake(DescribeCommand::describeAlertCommand(DescribeAlert describeAlert)) = "<prettySnowFlake(describeAlert)>";

public str prettySnowFlake(DescribeCommand::describeDatabaseCommand(DescribeDatabase describeDatabase)) = "<prettySnowFlake(describeDatabase)>";

public str prettySnowFlake(DescribeCommand::describeDynamicTableCommand(DescribeDynamicTable describeDynamicTable)) = "<prettySnowFlake(describeDynamicTable)>";

public str prettySnowFlake(DescribeCommand::describeEventTableCommand(DescribeEventTable describeEventTable)) = "<prettySnowFlake(describeEventTable)>";

public str prettySnowFlake(DescribeCommand::describeExternalTableCommand(DescribeExternalTable describeExternalTable)) = "<prettySnowFlake(describeExternalTable)>";

public str prettySnowFlake(DescribeCommand::describeFileFormatCommand(DescribeFileFormat describeFileFormat)) = "<prettySnowFlake(describeFileFormat)>";

public str prettySnowFlake(DescribeCommand::describeFunctionCommand(DescribeFunction describeFunction)) = "<prettySnowFlake(describeFunction)>";

public str prettySnowFlake(DescribeCommand::describeIntegrationCommand(DescribeIntegration describeIntegration)) = "<prettySnowFlake(describeIntegration)>";

public str prettySnowFlake(DescribeCommand::describeMaskingPolicyCommand(DescribeMaskingPolicy describeMaskingPolicy)) = "<prettySnowFlake(describeMaskingPolicy)>";

public str prettySnowFlake(DescribeCommand::describeMaterializedViewCommand(DescribeMaterializedView describeMaterializedView)) = "<prettySnowFlake(describeMaterializedView)>";

public str prettySnowFlake(DescribeCommand::describeNetworkPolicyCommand(DescribeNetworkPolicy describeNetworkPolicy)) = "<prettySnowFlake(describeNetworkPolicy)>";

public str prettySnowFlake(DescribeCommand::describePipeCommand(DescribePipe describePipe)) = "<prettySnowFlake(describePipe)>";

public str prettySnowFlake(DescribeCommand::describeProcedureCommand(DescribeProcedure describeProcedure)) = "<prettySnowFlake(describeProcedure)>";

public str prettySnowFlake(DescribeCommand::describeResultCommand(DescribeResult describeResult)) = "<prettySnowFlake(describeResult)>";

public str prettySnowFlake(DescribeCommand::describeRowAccessPolicyCommand(DescribeRowAccessPolicy describeRowAccessPolicy)) = "<prettySnowFlake(describeRowAccessPolicy)>";

public str prettySnowFlake(DescribeCommand::describeSchemaCommand(DescribeSchema describeSchema)) = "<prettySnowFlake(describeSchema)>";

public str prettySnowFlake(DescribeCommand::describeSearchOptimizationCommand(DescribeSearchOptimization describeSearchOptimization)) = "<prettySnowFlake(describeSearchOptimization)>";

public str prettySnowFlake(DescribeCommand::describeSequenceCommand(DescribeSequence describeSequence)) = "<prettySnowFlake(describeSequence)>";

public str prettySnowFlake(DescribeCommand::describeSessionPolicyCommand(DescribeSessionPolicy describeSessionPolicy)) = "<prettySnowFlake(describeSessionPolicy)>";

public str prettySnowFlake(DescribeCommand::describeShareCommand(DescribeShare describeShare)) = "<prettySnowFlake(describeShare)>";

public str prettySnowFlake(DescribeCommand::describeStageCommand(DescribeStage describeStage)) = "<prettySnowFlake(describeStage)>";

public str prettySnowFlake(DescribeCommand::describeStreamCommand(DescribeStream describeStream)) = "<prettySnowFlake(describeStream)>";

public str prettySnowFlake(DescribeCommand::describeTableCommand(DescribeTable describeTable)) = "<prettySnowFlake(describeTable)>";

public str prettySnowFlake(DescribeCommand::describeTaskCommand(DescribeTask describeTask)) = "<prettySnowFlake(describeTask)>";

public str prettySnowFlake(DescribeCommand::describeTransactionCommand(DescribeTransaction describeTransaction)) = "<prettySnowFlake(describeTransaction)>";

public str prettySnowFlake(DescribeCommand::describeUserCommand(DescribeUser describeUser)) = "<prettySnowFlake(describeUser)>";

public str prettySnowFlake(DescribeCommand::describeViewCommand(DescribeView describeView)) = "<prettySnowFlake(describeView)>";

public str prettySnowFlake(DescribeCommand::describeWareHouseCommand(DescribeWareHouse describeWareHouse)) = "<prettySnowFlake(describeWareHouse)>";

public str prettySnowFlake(DescribeAlert::describeAlert(Describe describe, Identifier id)) = "<prettySnowFlake(describe)> ALERT <prettySnowFlake(id)>";

public str prettySnowFlake(Describe::describeOpt1()) = "DESC";

public str prettySnowFlake(Describe::describeOpt2()) = "DESCRIBE";

public str prettySnowFlake(DescribeDatabase::describeDatabase(Describe describe, Identifier id)) = "<prettySnowFlake(describe)> DATABASE <prettySnowFlake(id)>";

public str prettySnowFlake(DescribeDynamicTable::describeDynamicTable(Describe describe, Identifier id)) = "<prettySnowFlake(describe)> DYNAMIC TABLE <prettySnowFlake(id)>";

public str prettySnowFlake(DescribeEventTable::describeEventTable(Describe describe, Identifier id)) = "<prettySnowFlake(describe)> EVENT TABLE <prettySnowFlake(id)>";

public str prettySnowFlake(DescribeExternalTable::describeExternalTable(Describe describe, ObjectColumnNameOrIdentifier objNameOrId, list[DescribeTableType] describeTableTypeList)) = "<prettySnowFlake(describe)> EXTERNAL TABLE <prettySnowFlake(objNameOrId)> <for(describeTableType <- describeTableTypeList) {><prettySnowFlake(describeTableType)><}>";

public str prettySnowFlake(DescribeTableType::describeTypeColumns()) = "TYPE = COLUMNS";

public str prettySnowFlake(DescribeTableType::describeTypeStage()) = "TYPE = STAGE";

public str prettySnowFlake(DescribeFileFormat::describeFileFormat(Describe describe, Identifier id)) = "<prettySnowFlake(describe)> FILE FORMAT <prettySnowFlake(id)>";

public str prettySnowFlake(DescribeFunction::describeFunction(Describe describe, ObjectColumnNameOrIdentifier objNameOrId, ArgTypes argTypes)) = "<prettySnowFlake(describe)> FUNCTION <prettySnowFlake(objNameOrId)> <prettySnowFlake(argTypes)>";

public str prettySnowFlake(DescribeIntegration::describeIntegration(Describe describe, list[IntegrationsOptionals] integrationsOptionalsList, Identifier id)) = "<prettySnowFlake(describe)> <for(integrationsOptionals <- integrationsOptionalsList) {><prettySnowFlake(integrationsOptionals)><}> INTEGRATION <prettySnowFlake(id)>";

public str prettySnowFlake(DescribeMaskingPolicy::describeMaskingPolicy(Describe describe, Identifier id)) = "<prettySnowFlake(describe)> MASKING POLICY <prettySnowFlake(id)>";

public str prettySnowFlake(DescribeMaterializedView::describeMaterializedView(Describe describe, ObjectColumnNameOrIdentifier objNameOrId)) = "<prettySnowFlake(describe)> MATERIALIZED VIEW <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(DescribeNetworkPolicy::describeNetworkPolicy(Describe describe, Identifier id)) = "<prettySnowFlake(describe)> NETWORK POLICY <prettySnowFlake(id)>";

public str prettySnowFlake(DescribePipe::describePipe(Describe describe, ObjectColumnNameOrIdentifier objNameOrId)) = "<prettySnowFlake(describe)> PIPE <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(DescribeProcedure::describeProcedure(Describe describe, ObjectColumnNameOrIdentifier objNameOrId, ArgTypes argTypes)) = "<prettySnowFlake(describe)> PROCEDURE <prettySnowFlake(objNameOrId)> <prettySnowFlake(argTypes)>";

public str prettySnowFlake(DescribeResult::describeResultStr(Describe describe, String string)) = "<prettySnowFlake(describe)> RESULT <prettySnowFlake(string)>";

public str prettySnowFlake(DescribeResult::describeResultLastQuery(Describe describe)) = "<prettySnowFlake(describe)> RESULT LAST_QUERY_ID()";

public str prettySnowFlake(DescribeRowAccessPolicy::describeRowAccessPolicy(Describe describe, Identifier id)) = "<prettySnowFlake(describe)> ROW ACCESS POLICY <prettySnowFlake(id)>";

public str prettySnowFlake(DescribeSchema::describeSchema(Describe describe, ObjectColumnNameOrIdentifier objNameOrId)) = "<prettySnowFlake(describe)> SCHEMA <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(DescribeSearchOptimization::describeSearchOptimization(Describe describe, ObjectColumnNameOrIdentifier objNameOrId)) = "<prettySnowFlake(describe)> SEARCH OPTIMIZATION ON <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(DescribeSequence::describeSequence(Describe describe, ObjectColumnNameOrIdentifier objNameOrId)) = "<prettySnowFlake(describe)> SEQUENCE <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(DescribeSessionPolicy::describeSessionPolicy(Describe describe, Identifier id)) = "<prettySnowFlake(describe)> SESSION POLICY <prettySnowFlake(id)>";

public str prettySnowFlake(DescribeShare::describeShare(Describe describe, Identifier id)) = "<prettySnowFlake(describe)> SHARE <prettySnowFlake(id)>";

public str prettySnowFlake(DescribeStage::describeStage(Describe describe, IdentifierFn idFn)) = "<prettySnowFlake(describe)> STAGE <prettySnowFlake(idFn)>";

public str prettySnowFlake(DescribeStream::describeStream(Describe describe, ObjectColumnNameOrIdentifier objNameOrId)) = "<prettySnowFlake(describe)> STREAM <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(DescribeTable::describeTable(Describe describe, ObjectColumnNameOrIdentifier objNameOrId, list[DescribeTableType] describeTableTypeList)) = "<prettySnowFlake(describe)> TABLE <prettySnowFlake(objNameOrId)> <for(describeTableType <- describeTableTypeList) {><prettySnowFlake(describeTableType)><}>";

public str prettySnowFlake(DescribeTask::describeTask(Describe describe, ObjectColumnNameOrIdentifier objNameOrId)) = "<prettySnowFlake(describe)> TASK <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(DescribeTransaction::describeTransaction(Describe describe, str integer)) = "<prettySnowFlake(describe)> TRANSACTION <integer>";

public str prettySnowFlake(DescribeUser::describeUser(Describe describe, Identifier id)) = "<prettySnowFlake(describe)> USER <prettySnowFlake(id)>";

public str prettySnowFlake(DescribeView::describeView(Describe describe, ObjectColumnNameOrIdentifier objNameOrId)) = "<prettySnowFlake(describe)> VIEW <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(DescribeWareHouse::describeWareHouse(Describe describe, Identifier id)) = "<prettySnowFlake(describe)> WAREHOUSE <prettySnowFlake(id)>";

public str prettySnowFlake(BeginTransaction::beginTransaction(list[WorkOrTransaction] workOrTransactionList, list[NameId] nameIdList)) = "BEGIN <for(workOrTransaction <- workOrTransactionList) {><prettySnowFlake(workOrTransaction)><}> <for(nameId <- nameIdList) {><prettySnowFlake(nameId)><}>";

public str prettySnowFlake(BeginTransaction::startTransaction(list[NameId] nameIdList)) = "START TRANSACTION <for(nameId <- nameIdList) {><prettySnowFlake(nameId)><}>";

public str prettySnowFlake(WorkOrTransaction::workOrTransactionOpt1()) = "WORK";

public str prettySnowFlake(WorkOrTransaction::workOrTransactionOpt2()) = "TRANSACTION";

public str prettySnowFlake(NameId::nameId(Identifier id)) = "NAME <prettySnowFlake(id)>";

public str prettySnowFlake(CopyIntoLocation::copyIntoLocation(InternalOrExternalStage internalOrExternalStage,
                                ObjectNameOrQuery objectNameOrQuery, list[PartitionBy] partitionByList,
                                list[FileFormat] fileFormatList, list[CopyOptions] copyOptionsList,
                                list[ValidationMode] validationModeList
                        )) 
                        = "COPY INTO <prettySnowFlake(internalOrExternalStage)> FROM <prettySnowFlake(objectNameOrQuery)> <for(partitionBy <- partitionByList) {><prettySnowFlake(partitionBy)><}> <for(fileFormat <- fileFormatList) {><prettySnowFlake(fileFormat)><}> <for(copyOptions <- copyOptionsList) {><prettySnowFlake(copyOptions)><}> <for(validationMode <- validationModeList) {><prettySnowFlake(validationMode)><}> HEADER";

public str prettySnowFlake(CopyIntoLocation::copyIntoLocationNoHeader(InternalOrExternalStage internalOrExternalStage,
                                ObjectNameOrQuery objectNameOrQuery, list[PartitionBy] partitionByList,
                                list[FileFormat] fileFormatList, list[CopyOptions] copyOptionsList,
                                list[ValidationMode] validationModeList
                        ))
                        = "COPY INTO <prettySnowFlake(internalOrExternalStage)> FROM <prettySnowFlake(objectNameOrQuery)> <for(partitionBy <- partitionByList) {><prettySnowFlake(partitionBy)><}> <for(fileFormat <- fileFormatList) {><prettySnowFlake(fileFormat)><}> <for(copyOptions <- copyOptionsList) {><prettySnowFlake(copyOptions)><}> <for(validationMode <- validationModeList) {><prettySnowFlake(validationMode)><}>";

public str prettySnowFlake(ObjectNameOrQuery::objectNameOrQueryOpt1(ObjectColumnNameOrIdentifier objNameOrId)) = "<prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(ObjectNameOrQuery::objectNameOrQueryOpt2(Query query)) = "( <prettySnowFlake(query)> )";

public str prettySnowFlake(Commit::commitClause()) = "COMMIT WORK";

public str prettySnowFlake(Commit::commitClauseNoWork()) = "COMMIT";

public str prettySnowFlake(Comment::commentFuncSignature(list[IfExists] ifExistsList, ObjectTypeName objectTypeName, ObjectColumnNameOrIdentifier objNameOrId, list[ArgTypes] argTypesList, String string)) = "COMMENT <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> ON <prettySnowFlake(objectTypeName)> <prettySnowFlake(objNameOrId)> <for(argTypes <- argTypesList) {><prettySnowFlake(argTypes)><}> IS <prettySnowFlake(string)>";

public str prettySnowFlake(Comment::commentColumn(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, String string)) = "COMMENT <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> ON COLUMN <prettySnowFlake(objNameOrId)> IS <prettySnowFlake(string)>";

public str prettySnowFlake(ObjectTypeName::roleObjectTypeName()) = "ROLE";

public str prettySnowFlake(ObjectTypeName::userObjectTypeName()) = "USER";

public str prettySnowFlake(ObjectTypeName::warehouseObjectTypeName()) = "WAREHOUSE";

public str prettySnowFlake(ObjectTypeName::integrationObjectTypeName()) = "INTEGRATION";

public str prettySnowFlake(ObjectTypeName::networkObjectTypeName()) = "NETWORK POLICY";

public str prettySnowFlake(ObjectTypeName::sessionObjectTypeName()) = "SESSION POLICY";

public str prettySnowFlake(ObjectTypeName::databaseObjectTypeName()) = "DATABASE";

public str prettySnowFlake(ObjectTypeName::schemaObjectTypeName()) = "SCHEMA";

public str prettySnowFlake(ObjectTypeName::tableObjectTypeName()) = "TABLE";

public str prettySnowFlake(ObjectTypeName::viewObjectTypeName()) = "VIEW";

public str prettySnowFlake(ObjectTypeName::stageObjectTypeName()) = "STAGE";

public str prettySnowFlake(ObjectTypeName::fileFormatObjectTypeName()) = "FILE FORMAT";

public str prettySnowFlake(ObjectTypeName::streamObjectTypeName()) = "STREAM";

public str prettySnowFlake(ObjectTypeName::taskObjectTypeName()) = "TASK";

public str prettySnowFlake(ObjectTypeName::maskingObjectTypeName()) = "MASKING POLICY";

public str prettySnowFlake(ObjectTypeName::rowAccessObjectTypeName()) = "ROW ACCESS POLICY";

public str prettySnowFlake(ObjectTypeName::tagObjectTypeName()) = "TAG";

public str prettySnowFlake(ObjectTypeName::pipeObjectTypeName()) = "PIPE";

public str prettySnowFlake(ObjectTypeName::functionObjectTypeName()) = "FUNCTION";

public str prettySnowFlake(ObjectTypeName::procedureObjectTypeName()) = "PROCEDURE";

public str prettySnowFlake(ObjectTypeName::sequenceObjectTypeName()) = "SEQUENCE";

public str prettySnowFlake(ExecuteImmediate::executeImmediateId(StringId stringId, list[UsingColumnList] usingColumnList)) = "EXECUTE IMMEDIATE <prettySnowFlake(stringId)> <for(usingColumn <- usingColumnList) {><prettySnowFlake(usingColumn)><}>";

public str prettySnowFlake(StringId::stringIdOpt1(String string)) = "<prettySnowFlake(string)>";

public str prettySnowFlake(StringId::stringIdOpt2(Identifier id)) = "<prettySnowFlake(id)>";

public str prettySnowFlake(ExecuteTask::executeTask(ObjectColumnNameOrIdentifier objNameOrId)) = "EXECUTE TASK <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(GetDML::getDML(InternalOrExternalStage internalOrExternalStage, FilePath filePath, list[Parallel] parallelList, list[Pattern] patternList)) = "GET <prettySnowFlake(internalOrExternalStage)> <prettySnowFlake(filePath)> <for(parallel <- parallelList) {><prettySnowFlake(parallel)><}> <for(pattern <- patternList) {><prettySnowFlake(pattern)><}>";

public str prettySnowFlake(Parallel::parallelClause(str integer)) = "PARALLEL = <integer>";

public str prettySnowFlake(List::listClause(InternalOrExternalStage internalOrExternalStage, list[Pattern] patternList)) = "LIST <prettySnowFlake(internalOrExternalStage)> <for(pattern <- patternList) {><prettySnowFlake(pattern)><}>";

public str prettySnowFlake(Remove::removeClause(InternalOrExternalStage internalOrExternalStage, list[Pattern] patternList)) = "REMOVE <prettySnowFlake(internalOrExternalStage)> <for(pattern <- patternList) {><prettySnowFlake(pattern)><}>";

public str prettySnowFlake(Set::setId(Identifier id, Exp exp)) = "SET <prettySnowFlake(id)> = <prettySnowFlake(exp)>";

public str prettySnowFlake(Set::setCols(ColumnListWithBrackets columnListWithBrackets, ExpListWithBrackets expListWithBrackets)) = "SET <prettySnowFlake(columnListWithBrackets)> = <prettySnowFlake(expListWithBrackets)>";

public str prettySnowFlake(Unset::unsetId(Identifier id)) = "UNSET <prettySnowFlake(id)>";

public str prettySnowFlake(Unset::unsetCols(ColumnListWithBrackets columnListWithBrackets)) = "UNSET <prettySnowFlake(columnListWithBrackets)>";

public str prettySnowFlake(TruncateTable::truncateTable(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId)) = "TRUNCATE TABLE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(TruncateTable::truncateTableNoTable(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId)) = "TRUNCATE <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(TruncateMaterializedView::truncateMaterializedView(ObjectColumnNameOrIdentifier objNameOrId)) = "TRUNCATE MATERIALIZED VIEW <prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(RevokeRole::revokeRole(RoleName roleName, RoleOrUser roleOrUser)) = "REVOKE ROLE <prettySnowFlake(roleName)> FROM <prettySnowFlake(roleOrUser)>";

public str prettySnowFlake(RoleName::systemDefinedRoleName(SystemDefinedRole systemDefinedRole)) = "<prettySnowFlake(systemDefinedRole)>";

public str prettySnowFlake(RoleName::idRoleName(Identifier id)) = "<prettySnowFlake(id)>";

public str prettySnowFlake(RoleOrUser::roleOrUserOpt1(RoleName roleName)) = "ROLE <prettySnowFlake(roleName)>";

public str prettySnowFlake(RoleOrUser::roleOrUserOpt2(Identifier id)) = "USER <prettySnowFlake(id)>";

public str prettySnowFlake(SystemDefinedRole::orgAdminDefinedRole()) = "ORGADMIN";

public str prettySnowFlake(SystemDefinedRole::accountAdminDefinedRole()) = "ACCOUNTADMIN";

public str prettySnowFlake(SystemDefinedRole::securityAdminDefinedRole()) = "SECURITYADMIN";

public str prettySnowFlake(SystemDefinedRole::userAdminDefinedRole()) = "USERADMIN";

public str prettySnowFlake(SystemDefinedRole::sysAdminDefinedRole()) = "SYSADMIN";

public str prettySnowFlake(SystemDefinedRole::publicDefinedRole()) = "PUBLIC";

public str prettySnowFlake(Put::put(FilePath filePath, InternalOrExternalStage internalOrExternalStage,
                        list[Parallel] parallelList, list[AutoCompress] autoCompressList,
                        list[SourceCompression] sourceCompressionList, list[OverWrite] overWriteList
                        ))
                        = "PUT <prettySnowFlake(filePath)> <prettySnowFlake(internalOrExternalStage)> <for(parallel <- parallelList) {><prettySnowFlake(parallel)><}> <for(autoCompress <- autoCompressList) {><prettySnowFlake(autoCompress)><}> <for(sourceCompression <- sourceCompressionList) {><prettySnowFlake(sourceCompression)><}> <for(overWrite <- overWriteList) {><prettySnowFlake(overWrite)><}>";

public str prettySnowFlake(AutoCompress::autoCompress(Boolean boolVal)) = "AUTO_COMPRESS = <prettySnowFlake(trueOrFalse)>";

public str prettySnowFlake(SourceCompression::sourceCompression(CompressionType compressionType)) = "SOURCE_COMPRESSION = <prettySnowFlake(compressionType)>";

public str prettySnowFlake(OverWrite::overWrite(Boolean boolVal)) = "OVERWRITE = <prettySnowFlake(trueOrFalse)>";

public str prettySnowFlake(FilePath::filePath1(str uri)) = "file:///<uri>";

public str prettySnowFlake(FilePath::filePath2(str windowsPath)) = "file://<windowsPath>";

public str prettySnowFlake(Rollback::rollback()) = "ROLLBACK WORK";

public str prettySnowFlake(Rollback::rollbackNoWork()) = "ROLLBACK";