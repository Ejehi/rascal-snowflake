module prettyprint::DML

extend prettyprint::Query;

import ast::SnowFlake;

import List;


public str prettySnowFlake(DML::insertDML(InsertStatement insertStatement)) = "<prettySnowFlake(insertStatement)>";

public str prettySnowFlake(DML::insertMultiTableDML(InsertMultiTableStatement insertMultiTableStatement)) = "<prettySnowFlake(insertMultiTableStatement)>";

public str prettySnowFlake(DML::updateDML(UpdateStatement updateStatement)) = "<prettySnowFlake(updateStatement)>";

public str prettySnowFlake(DML::deleteDML(DeleteStatement deleteStatement)) = "<prettySnowFlake(deleteStatement)>";

public str prettySnowFlake(DML::mergeDML(MergeStatement mergeStatement)) = "<prettySnowFlake(mergeStatement)>";

public str prettySnowFlake(InsertStatement::insertValuesBuilder(ObjectColumnNameOrIdentifier objNameOrId, list[ColumnListWithBrackets] columnListWithBrackets, ValuesBuilder valuesBuilder)) = "INSERT OVERWRITE INTO <prettySnowFlake(objNameOrId)> <for(columnWithBrackets <- columnListWithBrackets) {><prettySnowFlake(columnWithBrackets)><}> <prettySnowFlake(valuesBuilder)>";

public str prettySnowFlake(InsertStatement::insertValuesBuilderNoOverWrite(ObjectColumnNameOrIdentifier objNameOrId, list[ColumnListWithBrackets] columnListWithBrackets, ValuesBuilder valuesBuilder)) = "INSERT INTO <prettySnowFlake(objNameOrId)> <for(columnWithBrackets <- columnListWithBrackets) {><prettySnowFlake(columnWithBrackets)><}> <prettySnowFlake(valuesBuilder)>";

public str prettySnowFlake(InsertStatement::insertSelectStatement(ObjectColumnNameOrIdentifier objNameOrId, list[ColumnListWithBrackets] columnListWithBrackets, SelectStatement selectStatement)) = "INSERT OVERWRITE INTO <prettySnowFlake(objNameOrId)> <for(columnWithBrackets <- columnListWithBrackets) {><prettySnowFlake(columnWithBrackets)><}> <prettySnowFlake(selectStatement)>";

public str prettySnowFlake(InsertStatement::insertSelectStatementNoOverWrite(ObjectColumnNameOrIdentifier objNameOrId, list[ColumnListWithBrackets] columnListWithBrackets, SelectStatement selectStatement)) = "INSERT INTO <prettySnowFlake(objNameOrId)> <for(columnWithBrackets <- columnListWithBrackets) {><prettySnowFlake(columnWithBrackets)><}> <prettySnowFlake(selectStatement)>";

public str prettySnowFlake(InsertMultiTableStatement::insertMultiTableOverwriteAllInto(IntoValuesList intoValuesList)) = "INSERT OVERWRITE ALL <prettySnowFlake(intoValuesList)>";

public str prettySnowFlake(InsertMultiTableStatement::insertMultiTableInsertAllInto(IntoValuesList intoValuesList)) = "INSERT ALL <prettySnowFlake(intoValuesList)>";

public str prettySnowFlake(InsertMultiTableStatement::insertMultiTableOverwriteFirstWhen(list[WhenPredicateThenValues] whenPredicateThenValues, list[ElseIntoValueslist] elseIntoValueslist, Query query)) = "INSERT OVERWRITE FIRST <for(whenPredicateThen <- whenPredicateThenValues) {><prettySnowFlake(whenPredicateThen)><}> <for(elseIntoValues <- elseIntoValueslist) {><prettySnowFlake(elseIntoValues)><}> <prettySnowFlake(query)>";

public str prettySnowFlake(InsertMultiTableStatement::insertMultiTableInsertFirstWhen(list[WhenPredicateThenValues] whenPredicateThenValues, list[ElseIntoValueslist] elseIntoValueslist, Query query)) = "INSERT FIRST <for(whenPredicateThen <- whenPredicateThenValues) {><prettySnowFlake(whenPredicateThen)><}> <for(elseIntoValues <- elseIntoValueslist) {><prettySnowFlake(elseIntoValues)><}> <prettySnowFlake(query)>";

public str prettySnowFlake(InsertMultiTableStatement::insertMultiTableOverwriteAllWhen(list[WhenPredicateThenValues] whenPredicateThenValues, list[ElseIntoValueslist] elseIntoValueslist, Query query)) = "INSERT OVERWRITE ALL <for(whenPredicateThen <- whenPredicateThenValues) {><prettySnowFlake(whenPredicateThen)><}> <for(elseIntoValues <- elseIntoValueslist) {><prettySnowFlake(elseIntoValues)><}> <prettySnowFlake(query)>";

public str prettySnowFlake(InsertMultiTableStatement::insertMultiTableInsertAllWhen(list[WhenPredicateThenValues] whenPredicateThenValues, list[ElseIntoValueslist] elseIntoValueslist, Query query)) = "INSERT ALL <for(whenPredicateThen <- whenPredicateThenValues) {><prettySnowFlake(whenPredicateThen)><}> <for(elseIntoValues <- elseIntoValueslist) {><prettySnowFlake(elseIntoValues)><}> <prettySnowFlake(query)>";

public str prettySnowFlake(IntoValuesList::intoValuesList(ObjectColumnNameOrIdentifier objNameOrId, list[ColumnListWithBrackets] columnListWithBrackets, list[ValuesList] valuesList)) = "INTO <prettySnowFlake(objNameOrId)> <for(columnWithBrackets <- columnListWithBrackets) {><prettySnowFlake(columnWithBrackets)><}> <for(values <- valuesList) {><prettySnowFlake(values)><}>";

public str prettySnowFlake(IntoValuesList2::intoValuesList2(list[IntoValuesList] intoValuesList)) = "<for(intoValues <- intoValuesList) {><prettySnowFlake(intoValues)><}>";

public str prettySnowFlake(ValuesList::valuesList(list[ValueItem] valueItemList)) = "VALUES( <intercalate(", ", [ prettySnowFlake(valueItem) | valueItem <- valueItemList ])> )";

public str prettySnowFlake(ValueItem::colNameValueItem(ObjectColumnNameOrIdentifier objNameOrId)) = "<prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(ValueItem::defaultValueItem()) = "DEFAULT";

public str prettySnowFlake(ValueItem::nullValueItem()) = "NULL";

public str prettySnowFlake(WhenPredicateThenValues::whenPredicateThenValues(Exp exp, IntoValuesList2 intoValuesList2)) = "WHEN <prettySnowFlake(exp)> THEN <prettySnowFlake(intoValuesList2)>";

public str prettySnowFlake(ElseIntoValueslist::elseIntoValuesList(IntoValuesList intoValuesList)) = "ELSE <prettySnowFlake(intoValuesList)>";

public str prettySnowFlake(UpdateStatement::updateStatement(ObjectColumnNameOrIdentifier objNameOrId, list[AsAlias] asAliasList, SetObjNameList setObjNameList, 
                                            list[FromClause] fromClauseList, list[WhereClause] whereClauseList)) 
                                            = "UPDATE <prettySnowFlake(objNameOrId)> <for(asAlias <- asAliasList) {><prettySnowFlake(asAlias)><}> SET <prettySnowFlake(setObjNameList)> <for(fromClause <- fromClauseList) {><prettySnowFlake(fromClause)><}> <for(whereClause <- whereClauseList) {><prettySnowFlake(whereClause)><}>";

public str prettySnowFlake(SetObjNameEqToExp::setObjNameEqToExp(ObjectColumnNameOrIdentifier objNameOrId, Exp exp)) = "<prettySnowFlake(objNameOrId)> = <prettySnowFlake(exp)>";

public str prettySnowFlake(SetObjNameList::setObjNameList(list[SetObjNameEqToExp] setObjNameEqToExpList)) = "<intercalate(", ", [ prettySnowFlake(setObjNameEqToExp) | setObjNameEqToExp <- setObjNameEqToExpList ])>";

public str prettySnowFlake(DeleteStatement::deleteStatement(ObjectColumnNameOrIdentifier objNameOrId, list[AsAlias] asAliasList, list[UsingTableQueryList] usingTableQueryList, list[WhereClause] whereClauseList)) 
                                            = "DELETE FROM <prettySnowFlake(objNameOrId)> <for(asAlias <- asAliasList) {><prettySnowFlake(asAlias)><}> <for(usingTableQuery <- usingTableQueryList) {><prettySnowFlake(usingTableQuery)><}> <for(whereClause <- whereClauseList) {><prettySnowFlake(whereClause)><}>";

public str prettySnowFlake(TableOrQuery::tableName(ObjectColumnNameOrIdentifier objNameOrId, list[AsAlias] asAliasList)) = "<prettySnowFlake(objNameOrId)> <for(asAlias <- asAliasList) {><prettySnowFlake(asAlias)><}>";

public str prettySnowFlake(TableOrQuery::queryAsAlias(Query query, list[AsAlias] asAliasList)) = "( <prettySnowFlake(query)> ) <for(asAlias <- asAliasList) {><prettySnowFlake(asAlias)><}>";

public str prettySnowFlake(UsingTableOrQuery::usingTableOrQuery(TableOrQuery tableOrQuery)) = "USING <prettySnowFlake(tableOrQuery)>";

public str prettySnowFlake(UsingTableQueryList::usingTableQueryList(list[UsingTableOrQuery] usingTableQueryList)) = "<intercalate(", ", [ prettySnowFlake(usingTableQuery) | usingTableQuery <- usingTableQueryList ])>";

public str prettySnowFlake(MergeStatement::mergeStatement(ObjectColumnNameOrIdentifier objNameOrId, list[AsAlias] asAliasList, TableSource tableSource, SearchCondition searchCondition, MergeMatches mergeMatches)) 
                                        = "MERGE INTO <prettySnowFlake(objNameOrId)> <for(asAlias <- asAliasList) {><prettySnowFlake(asAlias)><}> USING <prettySnowFlake(tableSource)> ON <prettySnowFlake(searchCondition)> <prettySnowFlake(mergeMatches)>";

public str prettySnowFlake(MergeMatches::mergeMatches(list[WhenMatchedThen] whenMatchedThenList, list[WhenNotMatchedThen] whenNotMatchedThenList)) = "<for(whenMatchedThen <- whenMatchedThenList) {><prettySnowFlake(whenMatchedThen)> <}> <for(whenNotMatchedThen <- whenNotMatchedThenList) {><prettySnowFlake(whenNotMatchedThen)><}>";

public str prettySnowFlake(WhenNotMatchedThen::whenNotMatchedThen(list[AndSearchCondition] andSearchConditionList, MergeInsert mergeInsert)) = "WHEN NOT MATCHED <for(andSearchCondition <- andSearchConditionList) {><prettySnowFlake(andSearchCondition)><}> THEN <prettySnowFlake(mergeInsert)>";

public str prettySnowFlake(WhenMatchedThen::whenMatchedThen(list[AndSearchCondition] andSearchConditionList, MergeUpdateOrDelete mergeUpdateOrDelete)) = "WHEN MATCHED <for(andSearchCondition <- andSearchConditionList) {><prettySnowFlake(andSearchCondition)><}> THEN <prettySnowFlake(mergeUpdateOrDelete)>";

public str prettySnowFlake(MergeUpdateOrDelete::mergeUpdate(SetObjNameList setObjNameList)) = "UPDATE SET <prettySnowFlake(setObjNameList)>";

public str prettySnowFlake(MergeUpdateOrDelete::mergeDelete()) = "DELETE";

public str prettySnowFlake(MergeInsert::mergeInsert(list[ColumnListWithBrackets] columnListWithBrackets, ExpListWithBrackets expListWithBrackets)) = "INSERT <for(columnWithBrackets <- columnListWithBrackets) {><prettySnowFlake(columnWithBrackets)><}> VALUES <prettySnowFlake(expListWithBrackets)>";

public str prettySnowFlake(AndSearchCondition::andSearchCondition(SearchCondition searchCondition)) = "AND <prettySnowFlake(searchCondition)>";
