module grammar::SnowFlake

extend grammar::DDL;


start syntax SnowFlakeBatch = snowFlakeBatch: { SqlCommands ";"}+ ";";

syntax SqlCommands = queryCommand: Query
                    | dmlCommand: DML
                    | ddlCommand: DDL
                    ;

syntax CreateCommand = createTaskCommand: CreateTask
                        | createAlertCommand: CreateAlert
                        ;

syntax CreateTask = createTask: 'CREATE' OrReplace? 'TASK' IfNotExists? ObjectColumnNameOrIdentifier
                                TaskParameters*
                                CommentClause?
                                CopyGrants?
                                AfterColumnList?
                                WhenSearchCondition?
                                'AS' SqlCommands
                        ;

syntax TaskParameters = taskComputeParam: TaskCompute
                        | taskScheduleParam: TaskSchedule
                        | taskOverlapParam: TaskOverlap
                        | sessionParamsListParam: SessionParamsList
                        | taskTimeoutParam: TaskTimeout
                        | taskSuspendAfterFailureNumberParam: TaskSuspendAfterFailureNumber
                        | taskErrorIntegrationParam: TaskErrorIntegration
                        ;

syntax AfterColumnList = afterColumnList: 'AFTER' ColumnList*;

syntax WhenSearchCondition = whenSearchCondition: 'WHEN' SearchCondition;

syntax TaskCompute = taskComputeWh: 'WAREHOUSE' "=" Identifier
                        | taskComputeUserTask: 'USER_TASK_MANAGED_INITIAL_WAREHOUSE_SIZE' "=" WhSizeOrString //Snowflake allow quoted warehouse size but must be without quote. 
                        ;

syntax TaskSchedule = taskSchedule: 'SCHEDULE' "=" String;

syntax TaskOverlap = taskOverlap: 'ALLOW_OVERLAPPING_EXECUTION' "=" Boolean;

syntax SessionParamsList = sessionParamsList: {SessionParams ","}+;

syntax TaskTimeout = taskTimeout: 'USER_TASK_TIMEOUT_MS' "=" Int;

syntax TaskSuspendAfterFailureNumber = taskSuspendAfterFailureNumber: 'SUSPEND_TASK_AFTER_NUM_FAILURES' "=" Int;

syntax TaskErrorIntegration = taskErrorIntegration: 'ERROR_INTEGRATION' "=" Identifier;

syntax WhSizeOrString =  whCommonSize: WhSize 
                        | whString: String
                        ;

syntax AlertAction = alterAction: SqlCommands;

syntax AlterAlert = alterAlertAction: 'ALTER' 'ALERT' IfExists? Identifier 'MODIFY' 'ACTION' AlertAction;


syntax CreateAlert = createAlert: 'CREATE' OrReplace? 'ALERT' IfNotExists? Identifier
                        'WAREHOUSE' "=" Identifier
                        'SCHEDULE' "=" String
                        'IF' "(" 'EXISTS' "(" AlertCondition ")" ")"
                        'THEN' AlertAction
                        ;

syntax OtherCommand = explainCommand: Explain;

syntax Explain = explain: 'EXPLAIN' UsingExplainOpts? SqlCommands;

syntax UsingExplainOpts = usingExplainOpts: 'USING' ExplainOpts;

syntax ExplainOpts = tabularExplainOpt: 'TABULAR' 
                    | jsonExplainOpt: 'JSON' 
                    | textExplainOpt: 'TEXT'
                    ;

