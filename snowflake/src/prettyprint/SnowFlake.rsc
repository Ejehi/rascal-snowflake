module prettyprint::SnowFlake

extend prettyprint::DDL;

import ast::SnowFlake;

import String;

import List;


public str prettySnowFlake(SnowFlakeBatch::snowFlakeBatch(list[SqlCommands] sqlCommandList)) = "<for(sqlCommand <- sqlCommandList) {><trim(prettySnowFlake(sqlCommand))>;\n<}>";

public str prettySnowFlake(SqlCommands::queryCommand(Query query)) = "<prettySnowFlake(query)>";

public str prettySnowFlake(SqlCommands::dmlCommand(DML dml)) = "<prettySnowFlake(dml)>";

public str prettySnowFlake(SqlCommands::ddlCommand(DDL ddl)) = "<prettySnowFlake(ddl)>";

public str prettySnowFlake(CreateCommand::createTaskCommand(CreateTask createTaskCommand)) = "<prettySnowFlake(createTaskCommand)>";

public str prettySnowFlake(CreateCommand::createAlertCommand(CreateAlert createAlertCommand)) = "<prettySnowFlake(createAlertCommand)>";

public str prettySnowFlake(CreateTask::createTask(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objectNameOrId, 
                    list[TaskParameters] taskParametersList, list[CommentClause] commentClauseList, list[CopyGrants] copyGrantsList,
                    list[AfterColumnList] afterColumnList, list[WhenSearchCondition] whenSearchConditionList, SqlCommands sqlCommands
                    )) 
                    = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> TASK <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(objectNameOrId)> <for(taskParameters <- taskParametersList) {><prettySnowFlake(taskParameters)> <}> <for(commentClause <- commentClauseList) {><prettySnowFlake(commentClause)><}> <for(copyGrants <- copyGrantsList) {><prettySnowFlake(copyGrants)><}> <for(afterColumn <- afterColumnList) {><prettySnowFlake(afterColumn)><}> <for(whenSearchCondition <- whenSearchConditionList) {><prettySnowFlake(whenSearchCondition)><}> AS <prettySnowFlake(sqlCommands)>";

public str prettySnowFlake(TaskParameters::taskComputeParam(TaskCompute taskCompute)) = "<prettySnowFlake(taskCompute)>";

public str prettySnowFlake(TaskParameters::taskScheduleParam(TaskSchedule taskSchedule)) = "<prettySnowFlake(taskSchedule)>";

public str prettySnowFlake(TaskParameters::taskOverlapParam(TaskOverlap taskOverlap)) = "<prettySnowFlake(taskOverlap)>";

public str prettySnowFlake(TaskParameters::sessionParamsListParam(SessionParamsList sessionParamsList)) = "<prettySnowFlake(sessionParamsList)>";

public str prettySnowFlake(TaskParameters::taskTimeoutParam(TaskTimeout taskTimeout)) = "<prettySnowFlake(taskTimeout)>";

public str prettySnowFlake(TaskParameters::taskSuspendAfterFailureNumberParam(TaskSuspendAfterFailureNumber taskSuspendAfterFailureNumber)) = "<prettySnowFlake(taskSuspendAfterFailureNumber)>";

public str prettySnowFlake(TaskParameters::taskErrorIntegrationParam(TaskErrorIntegration taskErrorIntegration)) = "<prettySnowFlake(taskErrorIntegration)>";

public str prettySnowFlake(AfterColumnList::afterColumnList(list[ColumnList] columnList)) = "AFTER <for(column <- columnList) {><prettySnowFlake(column)> <}>";

public str prettySnowFlake(WhenSearchCondition::whenSearchCondition(SearchCondition searchCondition)) = "WHEN <prettySnowFlake(searchCondition)>";

public str prettySnowFlake(TaskCompute::taskComputeWh(Identifier id)) = "WAREHOUSE = <prettySnowFlake(id)>";

public str prettySnowFlake(TaskCompute::taskComputeUserTask(WhSizeOrString whSizeOrString)) = "USER_TASK_MANAGED_INITIAL_WAREHOUSE_SIZE = <prettySnowFlake(whSizeOrString)>";

public str prettySnowFlake(TaskSchedule::taskSchedule(String string)) = "SCHEDULE = <prettySnowFlake(string)>";

public str prettySnowFlake(TaskOverlap::taskOverlap(Boolean boolVal)) = "ALLOW_OVERLAPPING_EXECUTION = <prettySnowFlake(boolVal)>";

public str prettySnowFlake(SessionParamsList::sessionParamsList(list[SessionParams] sessionParamsList)) = "<intercalate(", ", [ prettySnowFlake(sessionParams) | sessionParams <- sessionParamsList ])>";

public str prettySnowFlake(TaskTimeout::taskTimeout(str integer)) = "USER_TASK_TIMEOUT_MS = <integer>";

public str prettySnowFlake(TaskSuspendAfterFailureNumber::taskSuspendAfterFailureNumber(str integer)) = "SUSPEND_TASK_AFTER_NUM_FAILURES = <integer>";

public str prettySnowFlake(TaskErrorIntegration::taskErrorIntegration(Identifier id)) = "ERROR_INTEGRATION = <prettySnowFlake(id)>";

public str prettySnowFlake(WhSizeOrString::whCommonSize(WhSize whSize)) = "<prettySnowFlake(whSize)>";

public str prettySnowFlake(WhSizeOrString::whString(String string)) = "<prettySnowFlake(string)>";

public str prettySnowFlake(AlertAction::alterAction(SqlCommands sqlCommand)) = "<prettySnowFlake(sqlCommand)>";

public str prettySnowFlake(AlterAlert::alterAlertAction(list[IfExists] ifExistsList, Identifier id, AlertAction alertAction)) = "ALTER ALERT <for(ifExists <- ifExistsList) {><prettySnowFlake(ifExists)><}> <prettySnowFlake(id)> MODIFY ACTION <prettySnowFlake(alertAction)>";

public str prettySnowFlake(CreateAlert::createAlert(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, Identifier id1,
                        Identifier id2, String string, AlertCondition alertCondition, AlertAction alertAction
                        )) 
                    = "CREATE <for(orReplace <- orReplaceList) {><prettySnowFlake(orReplace)><}> ALERT <for(ifNotExists <- ifNotExistsList) {><prettySnowFlake(ifNotExists)><}> <prettySnowFlake(id1)> WAREHOUSE = <prettySnowFlake(id2)> SCHEDULE = <prettySnowFlake(string)> IF ( EXISTS ( <prettySnowFlake(alertCondition)> ) ) THEN <prettySnowFlake(alertAction)>";

public str prettySnowFlake(OtherCommand::explainCommand(Explain explain)) = "<prettySnowFlake(explain)>";

public str prettySnowFlake(Explain::explain(list[UsingExplainOpts] usingExplainOptsList, SqlCommands sqlCommand)) = "EXPLAIN <for(usingExplainOpts <- usingExplainOptsList) {><prettySnowFlake(usingExplainOpts)><}> <prettySnowFlake(sqlCommand)>";

public str prettySnowFlake(UsingExplainOpts::usingExplainOpts(ExplainOpts explainOpts)) = "USING <prettySnowFlake(explainOpts)>";

public str prettySnowFlake(ExplainOpts::tabularExplainOpt()) = "TABULAR";

public str prettySnowFlake(ExplainOpts::jsonExplainOpt()) = "JSON";

public str prettySnowFlake(ExplainOpts::textExplainOpt()) = "TEXT";
