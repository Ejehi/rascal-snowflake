module prettyprint::Query

extend prettyprint::Expressions;

import ast::SnowFlake;

import List;

public str prettySnowFlake(Exp::subQuery(Query query)) = "<prettySnowFlake(query)>";

public str prettySnowFlake(Query::query(list[WithExpression] withExpressionList, SelectStatement selectStatement, list[SetOperators] setOperatorsList)) = "<for(withExpression <- withExpressionList) {><prettySnowFlake(withExpression)><}> <prettySnowFlake(selectStatement)> <for(setOperators <- setOperatorsList) {><prettySnowFlake(setOperators)><}>";

public str prettySnowFlake(WithExpression::withExpression(list[CommonTableExpression] commonTableExpressionList)) = "WITH <for(commonTableExpression <- commonTableExpressionList) {><prettySnowFlake(commonTableExpression)><}>";

public str prettySnowFlake(CommonTableExpression::cte(Identifier id, list[ColumnListWithBrackets] columnListWithBracketsList, SelectStatement selectStatement, list[SetOperators] setOperatorsList)) = "<prettySnowFlake(id)> <for(columnListWithBrackets <- columnListWithBracketsList) {><prettySnowFlake(columnListWithBrackets)><}> AS ( <prettySnowFlake(selectStatement)> <for(setOperators <- setOperatorsList) {><prettySnowFlake(setOperators)><}> )";

public str prettySnowFlake(SelectStatement::selectWithLimit(SelectClause selectClause, SelectOptionalClauses selectOptionalClauses, list[LimitClause] limitClauseList)) = "<prettySnowFlake(selectClause)> <prettySnowFlake(selectOptionalClauses)> <for(limitClause <- limitClauseList) {><prettySnowFlake(limitClause)><}>";

public str prettySnowFlake(SelectStatement::selectWithTop(SelectTopClause selectTopClause, SelectOptionalClauses selectOptionalClauses)) = "<prettySnowFlake(selectTopClause)> <prettySnowFlake(selectOptionalClauses)>";

public str prettySnowFlake(SetOperators::unionSelectStmt(SelectStatement selectStatement)) = "UNION ALL <prettySnowFlake(selectStatement)>";

public str prettySnowFlake(SetOperators::bracketSelectStmt(SelectStatement selectStatement)) = "( <prettySnowFlake(selectStatement)> )";

public str prettySnowFlake(SetOperators::unionSelectStmtNoAll(SelectStatement selectStatement)) = "UNION <prettySnowFlake(selectStatement)>";

public str prettySnowFlake(SetOperators::exceptSelectStmt(SelectStatement selectStatement)) = "EXCEPT <prettySnowFlake(selectStatement)>";

public str prettySnowFlake(SetOperators::minusSelectStmt(SelectStatement selectStatement)) = "MINUS <prettySnowFlake(selectStatement)>";

public str prettySnowFlake(SetOperators::intersectSelectStmt(SelectStatement selectStatement)) = "INTERSECT <prettySnowFlake(selectStatement)>";

public str prettySnowFlake(SelectClause::selectClause(SelectListNoTop selectListNoTop)) = "SELECT <prettySnowFlake(selectListNoTop)>";

public str prettySnowFlake(SelectListNoTop::selectNoTop(list[AllDistinct] allDistinctList, SelectList selectList)) = "<for(allDistinct <- allDistinctList) {><prettySnowFlake(allDistinct)><}> <prettySnowFlake(selectList)>";

public str prettySnowFlake(SelectList::selectList(list[SelectListElem] selectListElem)) = "<intercalate(", ", [ prettySnowFlake(selectElem) | selectElem <- selectListElem ])>";

public str prettySnowFlake(SelectListElem::columnElem(ColumnElem columnElem)) = "<prettySnowFlake(columnElem)>";

public str prettySnowFlake(SelectOptionalClauses::selectOptionalClause(list[IntoClause] intoClauseList, list[FromClause] fromClauseList, list[WhereClause] whereClauseList, 
                                                list[GroupByClause] groupByClauseList, list[QualifyClause] qualifyClauseList, list[OrderByClause] orderByClauseList)) 
                                                = "<for(intoClause <- intoClauseList) {><prettySnowFlake(intoClause)><}> <for(fromClause <- fromClauseList) {><prettySnowFlake(fromClause)><}> <for(whereClause <- whereClauseList) {><prettySnowFlake(whereClause)><}> <for(groupByClause <- groupByClauseList) {><prettySnowFlake(groupByClause)><}> <for(qualifyClause <- qualifyClauseList) {><prettySnowFlake(qualifyClause)><}> <for(orderByClause <- orderByClauseList) {><prettySnowFlake(orderByClause)><}>";

public str prettySnowFlake(IntoClause::intoClause(VarList varList)) = "INTO <prettySnowFlake(varList)>";

public str prettySnowFlake(OuterJoin::leftOuter()) = "LEFT OUTER";

public str prettySnowFlake(OuterJoin::leftNoOuter()) = "LEFT";

public str prettySnowFlake(OuterJoin::rightOuter()) = "RIGHT OUTER";

public str prettySnowFlake(OuterJoin::rightNoOuter()) = "RIGHT";

public str prettySnowFlake(OuterJoin::fullOuter()) = "FULL OUTER";

public str prettySnowFlake(OuterJoin::fullNoOuter()) = "FULL";

public str prettySnowFlake(JoinType::innerJoin()) = "INNER";

public str prettySnowFlake(JoinType::outerJoin(OuterJoin outerJoin)) = "<prettySnowFlake(outerJoin)>";

public str prettySnowFlake(MatchRecognize::matchRecognize(list[PartitionBy] partitionByList, list[OrderItem] orderItemList, list[Measures] measuresList, 
                        list[RowMatch] rowMatchList, list[AfterMatch] afterMatchList, list[Pattern] patternList, list[Define] defineList)) 
                        = "MATCH_RECOGNIZE ( <for(partitionBy <- partitionByList) {><prettySnowFlake(partitionBy)><}> <for(orderItem <- orderItemList) {><prettySnowFlake(orderItem)><}> <for(measures <- measuresList) {><prettySnowFlake(measures)><}> <for(rowMatch <- rowMatchList) {><prettySnowFlake(rowMatch)><}> <for(afterMatch <- afterMatchList) {><prettySnowFlake(afterMatch)><}> <for(pattern <- patternList) {><prettySnowFlake(pattern)><}> <for(define <- defineList) {><prettySnowFlake(define)><}> )";

public str prettySnowFlake(Measures::measures(ExpAsAliasList expAsAliasList)) = "MEASURES <prettySnowFlake(expAsAliasList)>";

public str prettySnowFlake(RowMatch::oneRow(list[MatchOptions] matchOptionsList)) = "ONE ROW PER MATCH <for(matchOptions <- matchOptionsList) {><prettySnowFlake(matchOptions)><}>";

public str prettySnowFlake(RowMatch::allRows(list[MatchOptions] matchOptionsList)) = "ALL ROWS PER MATCH <for(matchOptions <- matchOptionsList) {><prettySnowFlake(matchOptions)><}>";

public str prettySnowFlake(MatchOptions::showEmpty()) = "SHOW EMPTY MATCHES";

public str prettySnowFlake(MatchOptions::omitEmpty()) = "OMIT EMPTY MATCHES";

public str prettySnowFlake(MatchOptions::unmatchedRows()) = "WITH UNMATCHED ROWS";

public str prettySnowFlake(AfterMatch::afterMatchLast()) = "AFTER MATCH SKIP PAST LAST ROW";

public str prettySnowFlake(AfterMatch::afterMatchNext()) = "AFTER MATCH SKIP TO NEXT ROW";

public str prettySnowFlake(AfterMatch::aftermatchSymbol(list[FirstOrLast] firstOrLastList, Symbol symbol)) = "AFTER MATCH SKIP TO <for(firstOrLast <- firstOrLastList) {><prettySnowFlake(firstOrLast)><}> <prettySnowFlake(symbol)>";

public str prettySnowFlake(Symbol::symbol()) = "SYMBOL";

public str prettySnowFlake(Pattern::pattern(String string)) = "PATTERN = <prettySnowFlake(string)>";

public str prettySnowFlake(Define::define(SymbolList symbolList)) = "DEFINE <prettySnowFlake(symbolList)>";

public str prettySnowFlake(SymbolList::symbolList(list[SymbolAsExp] symbolAsExpList)) = "<intercalate(", ", [ prettySnowFlake(symbolAsExp) | symbolAsExp <- symbolAsExpList ])>";

public str prettySnowFlake(SymbolAsExp::symbolAsExp(Symbol symbol, Exp exp)) = "<prettySnowFlake(symbol)> AS <prettySnowFlake(exp)>";

public str prettySnowFlake(PivotUnpivot::pivot(Identifier id1, Identifier id2, Identifier id3, list[Literal] literalList)) = "PIVOT ( <prettySnowFlake(id1)> (<prettySnowFlake(id2)>) FOR <prettySnowFlake(id3)> IN ( <intercalate(", ", [ prettySnowFlake(literal) | literal <- literalList ])> ) )";

public str prettySnowFlake(PivotUnpivot::unpivot(Identifier id, ObjectColumnNameOrIdentifier objNameOrId, ColumnList columnList)) = "UNPIVOT ( <prettySnowFlake(id)> FOR <prettySnowFlake(objNameOrId)> IN ( <intercalate(", ", [ prettySnowFlake(column) | column <- columnList ])> ) )";

public str prettySnowFlake(AsColumnList::asColumnList(AsAlias asAlias, list[ColumnAliasList] columnAliasList)) = "<prettySnowFlake(asAlias)> <for(columnAlias <- columnAliasList) {><prettySnowFlake(columnAlias)><}>";

public str prettySnowFlake(ColumnAliasList::columnAliasList(list[Identifier] idList)) = "( <intercalate(", ", [ prettySnowFlake(id) | id <- idList ])> )";

public str prettySnowFlake(Sample::sample(list[SampleMethod] sampleMethodList, SampleOpts sampleOpts)) = "SAMPLE <for(sampleMethod <- sampleMethodList) {><prettySnowFlake(sampleMethod)><}> <prettySnowFlake(sampleOpts)>";

public str prettySnowFlake(Sample::tableSample(list[SampleMethod] sampleMethodList, SampleOpts sampleOpts)) = "TABLESAMPLE <for(sampleMethod <- sampleMethodList) {><prettySnowFlake(sampleMethod)><}> <prettySnowFlake(sampleOpts)>";

public str prettySnowFlake(SampleMethod::rowSamplMethod(RowSampling rowSampling)) = "<prettySnowFlake(rowSampling)>";

public str prettySnowFlake(SampleMethod::blockSampleMethod(BlockSampling blockSampling)) = "<prettySnowFlake(blockSampling)>";

public str prettySnowFlake(RowSampling::bernoulliSampling()) = "BERNOULLI";

public str prettySnowFlake(RowSampling::rowSampling()) = "ROW";

public str prettySnowFlake(BlockSampling::systemSampling()) = "SYSTEM";

public str prettySnowFlake(BlockSampling::blockSampling()) = "BLOCK";

public str prettySnowFlake(SampleOpts::sampleOpts(str integer, list[RepeatableSeed] repeatableSeedList)) = "( <integer> ROWS ) <for(repeatableSeed <- repeatableSeedList) {><prettySnowFlake(repeatableSeed)><}>";

public str prettySnowFlake(SampleOpts::sampleOptNoRows(str integer, list[RepeatableSeed] repeatableSeedList)) = "( <integer> ) <for(repeatableSeed <- repeatableSeedList) {><prettySnowFlake(repeatableSeed)><}>";

public str prettySnowFlake(RepeatableSeed::repeatableSeed1(str integer)) = "REPEATABLE ( <integer> )";

public str prettySnowFlake(RepeatableSeed::repeatableSeed2(str integer)) = "SEED ( <integer> )";

public str prettySnowFlake(PriorList::priorList(list[PriorItem] priorItemList)) = "<intercalate(", ", [ prettySnowFlake(priorItem) | priorItem <- priorItemList ])>";

public str prettySnowFlake(PriorItem::priorItemPriorEq(Identifier id1, Identifier id2)) = "PRIOR <prettySnowFlake(id1)> = <prettySnowFlake(id2)>";

public str prettySnowFlake(PriorItem::priorItemPriorEqPrior(Identifier id1, Identifier id2)) = "PRIOR <prettySnowFlake(id1)> = PRIOR <prettySnowFlake(id2)>";

public str prettySnowFlake(PriorItem::priorItemNoPrior(Identifier id1, Identifier id2)) = "<prettySnowFlake(id1)> = <prettySnowFlake(id2)>";

public str prettySnowFlake(PriorItem::priorItemEqPrior(Identifier id1, Identifier id2)) = "<prettySnowFlake(id1)> = PRIOR <prettySnowFlake(id2)>";

public str prettySnowFlake(ValuesTable::valuesTableWithoutParenthesis(ValuesBuilder valuesBuilder, list[AsColumnAlias] asColumnAliasList)) = "<prettySnowFlake(valuesBuilder)> <for(asColumnAlias <- asColumnAliasList) {><prettySnowFlake(asColumnAlias)><}>";

public str prettySnowFlake(ValuesTable::valuesTableWithParenthesis(ValuesBuilder valuesBuilder, list[AsColumnAlias] asColumnAliasList)) = "<prettySnowFlake(valuesBuilder)> ( <for(asColumnAlias <- asColumnAliasList) {><prettySnowFlake(asColumnAlias)><}> )";

public str prettySnowFlake(ValuesBuilder::valuesBuilder(list[ExpListWithBrackets] expListWithBrackets)) = "VALUES <intercalate(", ", [ prettySnowFlake(expWithBrackets) | expWithBrackets <- expListWithBrackets ])>";

public str prettySnowFlake(AsColumnAlias::asColumnAlias(AsAlias asAlias, list[ColumnAliasList] columnAliasList)) = "<prettySnowFlake(asAlias)> <for(columnAlias <- columnAliasList) {><prettySnowFlake(columnAlias)><}>";

public str prettySnowFlake(FlattenTable::flattenTable(list[InputAssociation] inputAssociationList, Exp exp, list[CommaFlattenTableOpt] commaFlattenTableOptList)) = "FLATTEN( <for(inputAssociation <- inputAssociationList) {><prettySnowFlake(inputAssociation)><}> <prettySnowFlake(exp)> <for(commaFlattenTableOpt <- commaFlattenTableOptList) {><prettySnowFlake(commaFlattenTableOpt)><}> )";

public str prettySnowFlake(InputAssociation::inputAssociation()) = "INPUT =\>";

public str prettySnowFlake(CommaFlattenTableOpt::commaFlattenTableOpt(FlattenTableOpt flattenTableOpt)) = ", <prettySnowFlake(flattenTableOpt)>";

public str prettySnowFlake(FlattenTableOpt::pathAssoc(String string)) = "PATH =\> <prettySnowFlake(string)>";

public str prettySnowFlake(FlattenTableOpt::outerAssoc(Boolean boolVal)) = "OUTER =\> <prettySnowFlake(boolVal)>";

public str prettySnowFlake(FlattenTableOpt::recursiveAssoc(Boolean boolVal)) = "RECURSIVE =\> <prettySnowFlake(boolVal)>";

public str prettySnowFlake(FlattenTableOpt::modeAssocArray()) = "MODE =\> \'ARRAY\'";

public str prettySnowFlake(FlattenTableOpt::modeAssocObj()) = "MODE =\> \'OBJECT\'";

public str prettySnowFlake(FlattenTableOpt::modeAssocBoth()) = "MODE =\> \'BOTH\'";

public str prettySnowFlake(SplitedTable::splitedTable(ExpListWithBrackets expListWithBrackets)) = "SPLIT_TO_TABLE <prettySnowFlake(expListWithBrackets)>";

public str prettySnowFlake(WhereClause::whereClause(SearchCondition searchCondition)) = "WHERE <prettySnowFlake(searchCondition)>";

public str prettySnowFlake(GroupByClause::groupByHaving(ExpList expList, list[HavingClause] havingClauseList)) = "GROUP BY <prettySnowFlake(expList)> <for(havingClause <- havingClauseList) {><prettySnowFlake(havingClause)><}>";

public str prettySnowFlake(GroupByClause::groupByCube(ExpListWithBrackets expListWithBrackets)) = "GROUP BY CUBE <prettySnowFlake(expListWithBrackets)>";

public str prettySnowFlake(GroupByClause::groupBySets(ExpListWithBrackets expListWithBrackets)) = "GROUP BY GROUPING SETS <prettySnowFlake(expListWithBrackets)>";

public str prettySnowFlake(GroupByClause::groupByRollup(ExpListWithBrackets expListWithBrackets)) = "GROUP BY ROLLUP <prettySnowFlake(expListWithBrackets)>";

public str prettySnowFlake(GroupByClause::groupByAll()) = "GROUP BY ALL";

public str prettySnowFlake(HavingClause::havingClause(SearchCondition searchCondition)) = "HAVING <prettySnowFlake(searchCondition)>";

public str prettySnowFlake(QualifyClause::qualifyClause(Exp exp)) = "QUALIFY <prettySnowFlake(exp)>";

public str prettySnowFlake(LimitClause::limitNoFetch(str integer, list[OffsetInt] offsetIntList)) = "LIMIT <integer> <for(offsetInt <- offsetIntList) {><prettySnowFlake(offsetInt)><}>";

public str prettySnowFlake(LimitClause::limitWithFetch(list[OffsetInt] offsetIntList, list[RowRows] rowRowsList1, list[FirstNext] firstNextList, str integer, list[RowRows] rowRowsList2)) = "<for(offsetInt <- offsetIntList) {><prettySnowFlake(offsetInt)><}> <for(rowRows1 <- rowRowsList1) {><prettySnowFlake(rowRows1)><}> FETCH <for(firstNext <- firstNextList) {><prettySnowFlake(firstNext)><}> <integer> <for(rowRows2 <- rowRowsList2) {><prettySnowFlake(rowRows2)><}> ONLY";

public str prettySnowFlake(OffsetInt::offsetInt(str integer)) = "OFFSET <integer>";

public str prettySnowFlake(RowRows::row()) = "ROW";

public str prettySnowFlake(RowRows::rows()) = "ROWS";

public str prettySnowFlake(FirstNext::first()) = "FIRST";

public str prettySnowFlake(FirstNext::next()) = "NEXT";

public str prettySnowFlake(SelectTopClause::selectTopClause(SelectListTop selectListTop)) = "SELECT <prettySnowFlake(selectListTop)>";

public str prettySnowFlake(SelectListTop::selectListTop(list[AllDistinct] allDistinctList, TopClause topClause, SelectList selectList)) = "<for(allDistinct <- allDistinctList) {><prettySnowFlake(allDistinct)><}> <prettySnowFlake(topClause)> <prettySnowFlake(selectList)>";

public str prettySnowFlake(TopClause::topClause(str integer)) = "TOP <integer>";

public str prettySnowFlake(FromClause::fromClause(TableSources tableSources)) = "FROM <prettySnowFlake(tableSources)>";

public str prettySnowFlake(TableSources::tableSources(list[TableSource] tableSourceList)) = "<intercalate(", ", [ prettySnowFlake(tableSource) | tableSource <- tableSourceList ])>";

public str prettySnowFlake(TableSource::itemJoined(TableSourceItemJoined tableSourceItemJoined)) = "<prettySnowFlake(tableSourceItemJoined)>";

public str prettySnowFlake(TableSourceItemJoined::objectRefJoinClause(ObjectRef objectRef, list[JoinClause] joinClauseList)) = "<prettySnowFlake(objectRef)> <for(joinClause <- joinClauseList) {><prettySnowFlake(joinClause)><}>";

public str prettySnowFlake(TableSourceItemJoined::bracketTableItemJoined(TableSourceItemJoined tableSourceItemJoined, list[JoinClause] joinClauseList)) = "( <prettySnowFlake(tableSourceItemJoined)> ) <for(joinClause <- joinClauseList) {><prettySnowFlake(joinClause)><}>";

public str prettySnowFlake(ObjectRef::objectRefMatch(ObjectColumnNameOrIdentifier objNameOrId, list[AtBefore] atBeforeList, list[Changes] changesList,  list[MatchRecognize] matchRecognizeList, list[PivotUnpivot] pivotUnpivotList, list[AsColumnList] asColumnList, list[Sample] sampleList)) 
                            = "<prettySnowFlake(objNameOrId)> <for(atBefore <- atBeforeList) {><prettySnowFlake(atBefore)><}> <for(changes <- changesList) {><prettySnowFlake(changes)><}> <for(matchRecognize <- matchRecognizeList) {><prettySnowFlake(matchRecognize)><}> <for(pivotUnpivot <- pivotUnpivotList) {><prettySnowFlake(pivotUnpivot)><}> <for(asColumn <- asColumnList) {><prettySnowFlake(asColumn)><}> <for(sample <- sampleList) {><prettySnowFlake(sample)><}>";

public str prettySnowFlake(ObjectRef::objectRefConnect(ObjectColumnNameOrIdentifier objNameOrId, Exp exp, list[PriorList] priorList)) = "<prettySnowFlake(objNameOrId)> START WITH <prettySnowFlake(exp)> CONNECT BY <for(prior <- priorList) {><prettySnowFlake(prior)><}>";

public str prettySnowFlake(ObjectRef::objectRefFuncCall(FunctionCall functionCall, list[PivotUnpivot] pivotUnpivotList, list[AsAlias] asAliasList, list[Sample] sampleList)) = "TABLE ( <prettySnowFlake(functionCall)> ) <for(pivotUnpivot <- pivotUnpivotList) {><prettySnowFlake(pivotUnpivot)><}> <for(asAlias <- asAliasList) {><prettySnowFlake(asAlias)><}> <for(sample <- sampleList) {><prettySnowFlake(sample)><}>";

public str prettySnowFlake(ObjectRef::objectRefValuesTable(ValuesTable valuesTable, list[Sample] sampleList)) = "<prettySnowFlake(valuesTable)> <for(sample <- sampleList) {><prettySnowFlake(sample)><}>";

public str prettySnowFlake(ObjectRef::objectRefLateralSubQuery(Query query, list[PivotUnpivot] pivotUnpivotList, list[AsAlias] asAliasList)) = "LATERAL (<prettySnowFlake(query)>) <for(pivotUnpivot <- pivotUnpivotList) {><prettySnowFlake(pivotUnpivot)><}> <for(asAlias <- asAliasList) {><prettySnowFlake(asAlias)><}>";

public str prettySnowFlake(ObjectRef::objectRefNoLateralSubQuery(Query query, list[PivotUnpivot] pivotUnpivotList, list[AsAlias] asAliasList)) = "(<prettySnowFlake(query)>) <for(pivotUnpivot <- pivotUnpivotList) {><prettySnowFlake(pivotUnpivot)><}> <for(asAlias <- asAliasList) {><prettySnowFlake(asAlias)><}>";

public str prettySnowFlake(ObjectRef::objectRefLateralFlatten(FlattenTable flattenTable, list[AsAlias] asAliasList)) = "LATERAL <prettySnowFlake(flattenTable)> <for(asAlias <- asAliasList) {><prettySnowFlake(asAlias)><}>";

public str prettySnowFlake(ObjectRef::objectRefLateralSplitted(SplitedTable splitedTable, list[AsAlias] asAliasList)) = "LATERAL <prettySnowFlake(splitedTable)> <for(asAlias <- asAliasList) {><prettySnowFlake(asAlias)><}>";

public str prettySnowFlake(JoinClause::joinOnSearch(list[JoinType] joinTypeList, ObjectRef objectRef, list[OnSearchCondition] onSearchConditionList)) = "<for(joinType <- joinTypeList) {><prettySnowFlake(joinType)><}> JOIN <prettySnowFlake(objectRef)> <for(onSearchCondition <- onSearchConditionList) {><prettySnowFlake(onSearchCondition)><}>";

public str prettySnowFlake(JoinClause::joinUsingColumn(list[JoinType] joinTypeList, ObjectRef objectRef, list[UsingColumnList] usingColumnList)) = "<for(joinType <- joinTypeList) {><prettySnowFlake(joinType)><}> JOIN <prettySnowFlake(objectRef)> <for(usingColumn <- usingColumnList) {><prettySnowFlake(usingColumn)><}>";

public str prettySnowFlake(JoinClause::joinNatural(list[OuterJoin] outerJoinList, ObjectRef objectRef)) = "NATURAL <for(outerJoin <- outerJoinList) {><prettySnowFlake(outerJoin)><}> JOIN <prettySnowFlake(objectRef)>";

public str prettySnowFlake(JoinClause::joinCross(ObjectRef objectRef)) = "CROSS JOIN <prettySnowFlake(objectRef)>";