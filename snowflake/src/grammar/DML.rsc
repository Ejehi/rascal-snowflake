module grammar::DML

extend grammar::Query;

syntax DML = insertDML: InsertStatement
            | insertMultiTableDML: InsertMultiTableStatement
            | updateDML: UpdateStatement
            | deleteDML: DeleteStatement 
            | mergeDML: MergeStatement
            ;

syntax InsertStatement = insertValuesBuilder: 'INSERT' 'OVERWRITE' 'INTO' ObjectColumnNameOrIdentifier ColumnListWithBrackets? ValuesBuilder
                        | insertValuesBuilderNoOverWrite: 'INSERT' 'INTO' ObjectColumnNameOrIdentifier ColumnListWithBrackets? ValuesBuilder
                        | insertSelectStatement: 'INSERT' 'OVERWRITE' 'INTO' ObjectColumnNameOrIdentifier ColumnListWithBrackets? SelectStatement
                        | insertSelectStatementNoOverWrite: 'INSERT' 'INTO' ObjectColumnNameOrIdentifier ColumnListWithBrackets? SelectStatement
                        ;

syntax InsertMultiTableStatement = insertMultiTableOverwriteAllInto: 'INSERT' 'OVERWRITE' 'ALL' IntoValuesList
                                    | insertMultiTableInsertAllInto: 'INSERT' 'ALL' IntoValuesList
                                    | insertMultiTableOverwriteFirstWhen: 'INSERT' 'OVERWRITE' 'FIRST'
                                        WhenPredicateThenValues+
                                        ElseIntoValueslist?
                                        Query
                                    | insertMultiTableInsertFirstWhen: 'INSERT' 'FIRST'
                                        WhenPredicateThenValues+
                                        ElseIntoValueslist?
                                        Query
                                    | insertMultiTableOverwriteAllWhen: 'INSERT' 'OVERWRITE' 'ALL'
                                        WhenPredicateThenValues+
                                        ElseIntoValueslist?
                                        Query
                                    | insertMultiTableInsertAllWhen: 'INSERT' 'ALL'
                                        WhenPredicateThenValues+
                                        ElseIntoValueslist?
                                        Query
                                    ;

syntax IntoValuesList = intoValuesList: 'INTO' ObjectColumnNameOrIdentifier ColumnListWithBrackets? ValuesList?;

syntax IntoValuesList2 = intoValuesList2: IntoValuesList+;

syntax ValuesList = valuesList: 'VALUES' "(" { ValueItem "," }+ ")";

syntax ValueItem = colNameValueItem: ObjectColumnNameOrIdentifier
                    | defaultValueItem: 'DEFAULT'
                    | nullValueItem: 'NULL'
                    ;

syntax WhenPredicateThenValues = whenPredicateThenValues: 'WHEN' Exp 'THEN' IntoValuesList2;

syntax ElseIntoValueslist = elseIntoValuesList: 'ELSE' IntoValuesList;

syntax UpdateStatement = updateStatement: 'UPDATE' ObjectColumnNameOrIdentifier AsAlias?
                                'SET' SetObjNameList
                                FromClause?
                                WhereClause?
                        ;

syntax SetObjNameEqToExp = setObjNameEqToExp: ObjectColumnNameOrIdentifier "=" Exp;

syntax SetObjNameList = setObjNameList: {SetObjNameEqToExp ","}+;

syntax DeleteStatement = deleteStatement: 'DELETE' 'FROM' ObjectColumnNameOrIdentifier AsAlias?
                                UsingTableQueryList?
                                WhereClause?
                        ;

syntax TableOrQuery = tableName: ObjectColumnNameOrIdentifier AsAlias?
                    | queryAsAlias: "(" Query ")" AsAlias?
                    ;

syntax UsingTableOrQuery = usingTableOrQuery: 'USING' TableOrQuery;

syntax UsingTableQueryList = usingTableQueryList: {UsingTableOrQuery ","}+;

syntax MergeStatement = mergeStatement: 'MERGE' 'INTO' ObjectColumnNameOrIdentifier AsAlias?
                                'USING' TableSource 'ON' SearchCondition MergeMatches
                        ;

syntax MergeMatches = mergeMatches: WhenMatchedThen+ WhenNotMatchedThen?;

syntax WhenNotMatchedThen = whenNotMatchedThen: 'WHEN' 'NOT' 'MATCHED' AndSearchCondition? 'THEN' MergeInsert;

syntax WhenMatchedThen = whenMatchedThen: 'WHEN' 'MATCHED' AndSearchCondition? 'THEN' MergeUpdateOrDelete;

syntax MergeUpdateOrDelete = mergeUpdate: 'UPDATE' 'SET' SetObjNameList
                            | mergeDelete: 'DELETE'
                            ;

syntax MergeInsert = mergeInsert: 'INSERT' ColumnListWithBrackets? 'VALUES' ExpListWithBrackets;

syntax AndSearchCondition = andSearchCondition: 'AND' SearchCondition;