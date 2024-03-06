module ast::SnowFlake

import grammar::SnowFlake;

data SnowFlakeBatch = snowFlakeBatch(list[SqlCommands] sqlCommandList);

data SqlCommands = queryCommand(Query query) 
                    | dmlCommand(DML dml)
                    | ddlCommand(DDL ddl)
                    ;


data CreateCommand = createTaskCommand(CreateTask createTaskCommand)
                        | createAlertCommand(CreateAlert createAlertCommand)
                        ;


data CreateTask = createTask(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objectNameOrId, 
                    list[TaskParameters] taskParametersList, list[CommentClause] commentClauseList, list[CopyGrants] copyGrantsList,
                    list[AfterColumnList] afterColumnList, list[WhenSearchCondition] whenSearchCondition, SqlCommands sqlCommands
                );

data TaskParameters = taskComputeParam(TaskCompute taskCompute)
                        | taskScheduleParam(TaskSchedule taskSchedule)
                        | taskOverlapParam(TaskOverlap taskOverlap)
                        | sessionParamsListParam(SessionParamsList sessionParamsList)
                        | taskTimeoutParam(TaskTimeout taskTimeout)
                        | taskSuspendAfterFailureNumberParam(TaskSuspendAfterFailureNumber taskSuspendAfterFailureNumber)
                        | taskErrorIntegrationParam(TaskErrorIntegration taskErrorIntegration)
                        ;

data AfterColumnList = afterColumnList(list[ColumnList] columnList);

data WhenSearchCondition = whenSearchCondition(SearchCondition searchCondition);

data TaskCompute = taskComputeWh(Identifier id)
                        | taskComputeUserTask(WhSizeOrString whSizeOrString)
                        ;

data TaskSchedule = taskSchedule(String string);

data TaskOverlap = taskOverlap(Boolean boolVal);

data SessionParamsList = sessionParamsList(list[SessionParams] sessionParamsList);

data TaskTimeout = taskTimeout(str integer);

data TaskSuspendAfterFailureNumber = taskSuspendAfterFailureNumber(str integer);

data TaskErrorIntegration = taskErrorIntegration(Identifier id);

data WhSizeOrString =  whCommonSize(WhSize whSize)
                        | whString(String string)
                        ;

data AlertAction = alterAction(SqlCommands sqlCommand);

data AlterAlert = alterAlertAction(list[IfExists] ifExistsList, Identifier id, AlertAction alertAction);

data CreateAlert = createAlert(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, Identifier id1,
                        Identifier id2, String string, AlertCondition alertCondition, AlertAction alertAction
                        );

data OtherCommand = explainCommand(Explain explain);

data Explain = explain(list[UsingExplainOpts] usingExplainOptsList, SqlCommands sqlCommand);

data UsingExplainOpts = usingExplainOpts(ExplainOpts explainOpts);

data ExplainOpts = tabularExplainOpt()
                    | jsonExplainOpt() 
                    | textExplainOpt()
                    ;

// Literals

data Literal
            = number(Number number)
            | stringLit(String stringVal)
            | boolean(Boolean boolVal)
            ;

data Number
            = integer(str integer)
            | float(str floatingPoint)
            ;

data Boolean
            = boolTrue()
            | boolFalse()
            ;

data String = string(str stringConstant);

// Names

data Identifier = unquotedId(str unquotId)
                    | quotedId(str quotId)
                    ;

data ObjectColumnNameOrIdentifier = objectColumnNameOrIdentifier(list[Identifier] idList);

// Expressions

data Exp = primitiveExp(PrimitiveExp primitiveExpression)
            | bracketExp(Exp exp)
            | minExp(Exp exp)
            | plusExp(Exp exp)
            | functionCallExp(FunctionCall functionCall)
            | arrayAccess(Exp exp1, Exp exp2)
            | arrayExp(ArrayLiteral arrayLiteral)
            | jsonAccess(Exp exp1, Exp exp2)
            | jsonLiteral(JsonLiteral jsonLiteral)
            | expCollateString(Exp exp, Collate collate)
            | castExp(Exp exp, DataType dataType)
            | overClauseExp(Exp exp, OverClause overClause)
            | castExpr(Exp exp, DataType dataType)
            | tryCastExp(TryCastExp tryCastExp)
            | caseExp(CaseExpression caseExpression)
            | trimExp(TrimExpression trimExpression)
            | iffExp(IffExp iffExp)
            | expIsNullNotNull(Exp exp, NullNotNull nullNotNull)
            | expBetween(Exp exp1, Exp exp2)
            | expNotBetween(Exp exp1, Exp exp2, Exp exp3)
            | expNotInList(Exp exp, ExpList expList)
            | expNotInListNoNot(Exp exp, ExpList expList)
            | expNotIlikeEscape(Exp exp1, LikeIlike likeIlike, Exp exp2, list[EscapeExp] escapeExpList)
            | expNotIlikeEscapeNoNot(Exp exp1, LikeIlike likeIlike, Exp exp2, list[EscapeExp] escapeExpList)
            | expNotRlikeNoNot(Exp exp1, Exp exp2)
            | expNotRlike(Exp exp1, Exp exp2)
            | mul(Exp exp1, Exp exp2)
            | div(Exp exp1, Exp exp2)
            | modulus(Exp exp1, Exp exp2)
            | sub(Exp exp1, Exp exp2)
            | add(Exp exp1, Exp exp2)
            | eq(Exp exp1, Exp exp2)
            | gt(Exp exp1, Exp exp2)
            | lt(Exp exp1, Exp exp2)
            | gte(Exp exp1, Exp exp2)
            | lte(Exp exp1, Exp exp2)
            | neq1(Exp exp1, Exp exp2)
            | neq2(Exp exp1, Exp exp2)
            | not(Exp exp)
            | doublePipe(Exp exp1, Exp exp2)
            | and(Exp exp1, Exp exp2)
            | or(Exp exp1, Exp exp2)
            ;

data PrimitiveExp = literal(Literal literal)
                        | defaultVal()
                        | nullExp()
                        | objectColId(ObjectColumnNameOrIdentifier objNameOrId)
                        ;

data Collate = collateString(String string);

data ColumnListWithBrackets = colListWithBrackets(ColumnList columnList);

data ColumnList = columnList(list[ObjectColumnNameOrIdentifier] objNameOrIdList);

data AllDistinct =  allNoDistinct() 
                    | distinct()
                    ;

data ColumnElem = objectNameStar(list[ObjectNameDot] objectNameDotList)
                    | objectNameColName(Exp exp, list[AsAlias] asAliasList)
                    | objectNameColPosition(list[ObjectNameDot] objNameDotList, str integer, list[AsAlias] asAliasList)
                    ;

data ObjectNameDot = objectNameDot(ObjectColumnNameOrIdentifier objNameOrId);

data AsAlias = asAlias(Identifier id)
                | asAliasNoAs(Identifier id)
                ;

data VarList = varList(list[Variable] variableList);

data Variable = variable(Identifier id);

data OnSearchCondition = onSearchCondition(SearchCondition searchCondition);

data SearchCondition = searchCondition(Exp exp);

data UsingColumnList = usingColumnList(ColumnList columnList);

data AtBefore = atTimeStamp(Exp exp)
                | atOffset(Exp exp)
                | atStatement(String string)
                | atStream(String string)
                | beforeStatement(String string)
                ;

data Changes = changes(DefaultAppendOnly defaultAppendOnly, AtBefore atBefore, list[End] endList);

data DefaultAppendOnly = defaultNoAppendOnly()
                           | appendOnly()
                           ;

data End = endTimeStampString(String string)
            | endOffset(String string)
            | endStatement(Identifier id)
            ;
            
data PartitionBy = partitionBy(ExpList expList);

data ExpList = expList(list[Exp] exprList);

data AsOrDesc = asc()
                | desc()
                ;

data ExpAsAlias = expAsAlias(Exp exp, AsAlias asAlias);

data ExpAsAliasList = expAsAliasList(list[ExpAsAlias] expAsAliasList);

data OverClause = overPartitionBy(PartitionBy partitionBy, list[OrderByClause] orderByClauseList)
                    | overOrderBy(OrderByClause orderByClause)
                    ;

data OrderByClause = orderByClause(list[OrderItem] orderItemList);

data OrderItem = orderItem(Exp exp, list[AsOrDesc] asOrDescList, list[NullsFirstOrLast] nullsFirstOrLastList);

data NullsFirstOrLast = nullsFirstOrLast(FirstOrLast firstOrLast);

data FirstOrLast = firstOrLast1()
                    | firstOrLast2()
                    ;

data CommaString = commaString(String string);

data WithinGroupOrder = withinGroupOrder(OrderByClause orderByClause);

data IgnoreOrRepectNulls = ignoreOrRepectNulls(IgnoreOrRespect ignoreOrRespect);

data IgnoreOrRespect = ignore()
                        | respect()
                        ;

data FirstValueOrLastValue = firstValue()
                                | lastValue()
                                ;

data ExpListWithBrackets = expListWithBrackets(ExpList expList);

data FunctionCall = rankingWindowedFunc(RankingWindowedFunction rankingWindowedFunction)
                    | aggregateFunc(AggregateFunction aggregateFunction)
                    | listOpFunc(ListOperator listOperator, ExpList expList)
                    | binaryOrTernaryBuiltInFunc(BinaryOrTernaryBuiltInFunction binaryOrTernaryBuiltInFunction, ExpList expList)
                    ;

data RankingWindowedFunction = rankDenseRowNumberFunc(RankDenseRowNumber rankDenseRowNumber, OverClause overClause)
                                | ntileFunc(Exp exp, OverClause overClause)
                                | leadOrLagFunc(LeadOrLag leadOrLag, list[ExpList] expList, list[IgnoreOrRepectNulls] ignoreOrRepectNullsList, OverClause overClause)
                                | firstValueOrLastValueFunc(FirstValueOrLastValue firstValueOrLastValue, Exp exp, list[IgnoreOrRepectNulls] ignoreOrRepectNulls, OverClause overClause)
                                ;

data RankDenseRowNumber = rank()
                            | denseRank()
                            | rowNumber()
                            ;

data LeadOrLag = lead()
                | lag()
                ;

data AggregateFunction = idDistinct(ObjectColumnNameOrIdentifier objNameOrId, list[ExpList] expList)
                            | idStar(ObjectColumnNameOrIdentifier objNameOrId)
                            | idNoDistinct(ObjectColumnNameOrIdentifier objNameOrId, list[ExpList] expList)
                            | listOrArrayAggNoDistinct(ListAggOrArrayAgg listAggOrArrayAgg, Exp exp, list[CommaString] commaStringList, list[WithinGroupOrder] withinGroupOrderList)
                            | listOrArrayAgg(ListAggOrArrayAgg listAggOrArrayAgg, Exp exp, list[CommaString] commaStringList, list[WithinGroupOrder] withinGroupOrderList)
                            ;

data ListAggOrArrayAgg = listAgg()
                            | arrayAgg()
                            ;

data ListOperator = concat()
                        | concatWS()
                        | coalesce()
                        ;

data IdentifierType = identifierTypeOpt1(BinaryOrTernaryBuiltInFunction binaryOrTernaryBuiltInFunction)
                        | identifierTypeOpt2(ObjectColumnNameOrIdentifier objNameOrId)
                        ;

data BinaryOrTernaryBuiltInFunction = ifNullBuiltInFunction() 
                                | nvlBuiltInFunction()
                                | getBuiltInFunction()
                                | leftBuiltInFunction()
                                | rightBuiltInFunction()
                                | datePartBuiltInFunction()
                                | splitBuiltInFunction()
                                | nullIfBuiltInFunction()
                                | equalNullBuiltInFunction()
                                | containsBuiltInFunction()
                                | collateBuiltInFunction()
                                | toDateBuiltInFunction()
                                | dateBuiltInFunction()
                                | charIndexBuiltInFunction()
                                | replaceBuiltInFunction()
                                | substringBuiltInFunction()
                                | substrBuiltInFunction()
                                | likeBuiltInFunction()
                                | ilikeBuiltInFunction()
                                ;

data DataType = intAlias(IntAlias intAlias)
                | numberAlias(NumberAlias numberAlias)
                | floatAlias(FloatAlias floatAlias)
                | boolDataType()
                | dateDataType()
                | varCharAlias(VarCharAlias varCharAlias, list[DataTypeSize] dataTypeSizeList)
                | dateTimeDataType(list[DataTypeSize] dataTypeSizeList)
                | timeDataType(list[DataTypeSize] dataTypeSizeList)
                | timeStampDataType(list[DataTypeSize] dataTypeSizeList)
                | timeStamp_LTZ(list[DataTypeSize] dataTypeSizeList)
                | timeStampLTZ(list[DataTypeSize] dataTypeSizeList)
                | timeStamp_NTZ(list[DataTypeSize] dataTypeSizeList)
                | timeStampNTZ(list[DataTypeSize] dataTypeSizeList)
                | timeStamp_TZ(list[DataTypeSize] dataTypeSizeList)
                | timeStampTZ(list[DataTypeSize] dataTypeSizeList)
                | charAlias(CharAlias charAlias, list[DataTypeSize] dataTypeSizeList)
                | binaryAlias(BinaryAlias binaryAlias, list[DataTypeSize] dataTypeSizeList)
                | variantDataType()
                | objectDataType()
                | arrayDataType()
                | geographyDataType()
                | geometryDataType()
                ;

data DataTypeList = dataTypeList(list[DataType] dataType);

data StringList = stringList(list[String] string);

data IntAlias = intType()
                | integerType()
                | smallIntType()
                | tinyIntType()
                | byteIntType()
                | bigIntType()
                ;

data NumberAlias = numberType(list[ListOfIntWithBracket] listOfIntWithBracket)
                    | numericType(list[ListOfIntWithBracket] listOfIntWithBracket)
                    | decimalType(list[ListOfIntWithBracket] listOfIntWithBracket)
                    ;

data ListOfIntWithBracket = listOfIntWithBracket(list[str] integer);


data FloatAlias = floatType()
                    | float4Type()
                    | float8Type()
                    | doubleType()
                    | doublePrecisionType()
                    | realType()
                    ;

data VarCharAlias = charVarying()
                    | ncharVarying()
                    | nvarchar2()
                    | nvarchar()
                    | stringVarChar()
                    | textVarChar()
                    | varChar()
                    ;

data DataTypeSize = dataTypeSize(str integer);

data CharAlias = charType()
                    | ncharType()
                    | characterType()
                    ;

data BinaryAlias = binaryType()
                    | varBinaryType()
                    ;

data TryCastExp = tryCastExpression(Exp exp, DataType dataType);

data LikeIlike = like()
                    | ilike()
                    ;

data EscapeExp = escapeExp(Exp exp);

data NullNotNull = nullNotNull()
                    | nullNotNullNoNot()
                    ;

data CaseExpression = caseSwitchSection(Exp exp, list[SwitchSection] switchSectionList, list[ElseExp] elseExpList)
                        | caseSwitchSearchCondition(list[SwitchSearchConditionSection] switchSearchConditionSectionList, list[ElseExp] elseExpList)
                        ;

data SwitchSection = switchSection(Exp exp1, Exp exp2);

data ElseExp = elseExp(Exp exp);

data SwitchSearchConditionSection = switchSearchConditionSection(SearchCondition searchCondition, Exp exp);

data IffExp = iffExpression(SearchCondition searchCondition, Exp exp1, Exp exp2);

data ArrayLiteral = arrayExpList(ExpList expList)
                    | emptyArray()
                    ;

data JsonLiteral = jsonKvPair(list[KvPair] kvPair)
                    | emptyJson()
                    ;

data KvPair = kvPair(String string, Exp exp);

data TrimExpression = trimExpression(TrimType trimType, Exp exp, list[CommaString] commaStringList);

data TrimType = trimType()
                | ltrimType()
                | rtrimType()
                ; 


// Query

data Exp = subQuery(Query query);

data Query =  query(list[WithExpression] withExpressionList, SelectStatement selectStatement, list[SetOperators] setOperatorsList);

data WithExpression = withExpression(list[CommonTableExpression] commonTableExpressionList);

data CommonTableExpression = cte(Identifier id, list[ColumnListWithBrackets] columnListWithBracketsList, SelectStatement selectStatement, list[SetOperators] setOperatorsList);

data SelectStatement = selectWithLimit(SelectClause selectClause, SelectOptionalClauses selectOptionalClauses, list[LimitClause] limitClauseList)
                        | selectWithTop(SelectTopClause selectTopClause, SelectOptionalClauses selectOptionalClauses)
                        ;

data SetOperators = unionSelectStmt(SelectStatement selectStatement)
                    | bracketSelectStmt(SelectStatement selectStatement)
                    | unionSelectStmtNoAll(SelectStatement selectStatement)
                    | exceptSelectStmt(SelectStatement selectStatement)
                    | minusSelectStmt(SelectStatement selectStatement)
                    | intersectSelectStmt(SelectStatement selectStatement)
                    ;

data SelectClause = selectClause(SelectListNoTop selectListNoTop);

data SelectListNoTop = selectNoTop(list[AllDistinct] allDistinctList, SelectList selectList);

data SelectList = selectList(list[SelectListElem] selectListElem);

data SelectListElem = columnElem(ColumnElem columnElem);

data SelectOptionalClauses = selectOptionalClause(list[IntoClause] intoClauseList, list[FromClause] fromClauseList, list[WhereClause] whereClauseList, list[GroupByClause] groupByClauseList, list[QualifyClause] qualifyClauseList, list[OrderByClause] orderByClauseList);

data IntoClause =  intoClause(VarList varList);

data OuterJoin = leftOuter()
                    | leftNoOuter()
                    | rightOuter()
                    | rightNoOuter()
                    | fullOuter()
                    | fullNoOuter()
                    ;

data JoinType = innerJoin()
                    | outerJoin(OuterJoin outerJoin)
                    ;

data MatchRecognize = matchRecognize(list[PartitionBy] partitionByList, list[OrderItem] orderItemList, list[Measures] measuresList, list[RowMatch] rowMatchList, list[AfterMatch] afterMatchList, list[Pattern] patternList, list[Define] defineList);

data Measures = measures(ExpAsAliasList expAsAliasList);


data RowMatch = oneRow(list[MatchOptions] matchOptionsList)
                    | allRows(list[MatchOptions] matchOptionsList)
                    ;

data MatchOptions = showEmpty()
                    | omitEmpty()
                    | unmatchedRows()
                    ;

data AfterMatch = afterMatchLast()
                    | afterMatchNext()
                    | aftermatchSymbol(list[FirstOrLast] firstOrLastList, Symbol symbol)
                    ;

data Symbol = symbol();

data Pattern = pattern(String string);

data Define = define(SymbolList symbolList);

data SymbolList = symbolList(list[SymbolAsExp] symbolAsExpList);

data SymbolAsExp = symbolAsExp(Symbol symbol, Exp exp);

data PivotUnpivot = pivot(Identifier id1, Identifier id2, Identifier id3, list[Literal] literalList)
                    | unpivot(Identifier id, ObjectColumnNameOrIdentifier objNameOrId, ColumnList columnList) 
                    ;

data AsColumnList = asColumnList(AsAlias asAlias, list[ColumnAliasList] columnAliasList);

data ColumnAliasList = columnAliasList(list[Identifier] idList);


data Sample = sample(list[SampleMethod] sampleMethodList, SampleOpts sampleOpts)
                | tableSample(list[SampleMethod] sampleMethodList, SampleOpts sampleOpts)
                ;

data SampleMethod = rowSamplMethod(RowSampling rowSampling)
                    | blockSampleMethod(BlockSampling blockSampling)
                    ;

data RowSampling = bernoulliSampling()
                    | rowSampling()
                    ;

data BlockSampling = systemSampling()
                        | blockSampling()
                        ;


data SampleOpts = sampleOpts(str integer, list[RepeatableSeed] repeatableSeedList)
                    | sampleOptNoRows(str integer, list[RepeatableSeed] repeatableSeedList)
                    ;

data RepeatableSeed = repeatableSeed1(str integer)
                        | repeatableSeed2(str integer)
                        ;

data PriorList = priorList(list[PriorItem] priorItemList);

data PriorItem = priorItemPriorEq(Identifier id1, Identifier id2)
                    | priorItemPriorEqPrior(Identifier id1, Identifier id2)
                    | priorItemNoPrior(Identifier id1, Identifier id2)
                    | priorItemEqPrior(Identifier id1, Identifier id2)
                    ;

data ValuesTable = valuesTableWithoutParenthesis(ValuesBuilder valuesBuilder, list[AsColumnAlias] asColumnAliasList)
                    | valuesTableWithParenthesis(ValuesBuilder valuesBuilder, list[AsColumnAlias] asColumnAliasList)
                    ;

data ValuesBuilder = valuesBuilder(list[ExpListWithBrackets] expListWithBrackets);

data AsColumnAlias = asColumnAlias(AsAlias asAlias, list[ColumnAliasList] columnAliasList);

data FlattenTable = flattenTable(list[InputAssociation] inputAssociationList, Exp exp, list[CommaFlattenTableOpt] commaFlattenTableOptList);

data InputAssociation = inputAssociation();

data CommaFlattenTableOpt = commaFlattenTableOpt(FlattenTableOpt flattenTableOpt);

data FlattenTableOpt = pathAssoc(String string)
                            | outerAssoc(Boolean boolVal)
                            | recursiveAssoc(Boolean boolVal)
                            | modeAssocArray()
                            | modeAssocObj()
                            | modeAssocBoth()
                            ;

data SplitedTable = splitedTable(ExpListWithBrackets expListWithBrackets);

data WhereClause = whereClause(SearchCondition searchCondition);

data GroupByClause = groupByHaving(ExpList expList, list[HavingClause] havingClauseList)
                        | groupByCube(ExpListWithBrackets expListWithBrackets)
                        | groupBySets(ExpListWithBrackets expListWithBrackets)
                        | groupByRollup(ExpListWithBrackets expListWithBrackets)
                        | groupByAll()
                        ;

data HavingClause = havingClause(SearchCondition searchCondition);

data QualifyClause = qualifyClause(Exp exp);

data LimitClause = limitNoFetch(str integer, list[OffsetInt] offsetIntList)
                    | limitWithFetch(list[OffsetInt] offsetIntList, list[RowRows] rowRowsList1, list[FirstNext] firstNextList, str integer, list[RowRows] rowRowsList2)
                    ;


data OffsetInt = offsetInt(str integer);

data RowRows = row()
                | rows()
                ;

data FirstNext = first()
                    | next()
                    ;

data SelectTopClause = selectTopClause(SelectListTop selectListTop);

data SelectListTop = selectListTop(list[AllDistinct] allDistinctList, TopClause topClause, SelectList selectList);

data TopClause = topClause(str integer);

data FromClause = fromClause(TableSources tableSources);

data TableSources = tableSources(list[TableSource] tableSourceList);

data TableSource = itemJoined(TableSourceItemJoined tableSourceItemJoined);

data TableSourceItemJoined = objectRefJoinClause(ObjectRef objectRef, list[JoinClause] joinClauseList)
                                | bracketTableItemJoined(TableSourceItemJoined tableSourceItemJoined, list[JoinClause] joinClauseList)
                                ;

data ObjectRef = objectRefMatch(ObjectColumnNameOrIdentifier objNameOrId, list[AtBefore] atBeforeList, list[Changes] changesList,  list[MatchRecognize] matchRecognizeList, list[PivotUnpivot] pivotUnpivotList, list[AsColumnList] asColumnList, list[Sample] sampleList)
                    | objectRefConnect(ObjectColumnNameOrIdentifier objNameOrId, Exp exp, list[PriorList] priorList)
                    | objectRefFuncCall(FunctionCall functionCall, list[PivotUnpivot] pivotUnpivotList, list[AsAlias] asAliasList, list[Sample] sampleList)
                    | objectRefValuesTable(ValuesTable valuesTable, list[Sample] sampleList)
                    | objectRefLateralSubQuery(Query query, list[PivotUnpivot] pivotUnpivotList, list[AsAlias] asAliasList)
                    | objectRefNoLateralSubQuery(Query query, list[PivotUnpivot] pivotUnpivotList, list[AsAlias] asAliasList)
                    | objectRefLateralFlatten(FlattenTable flattenTable, list[AsAlias] asAliasList)
                    | objectRefLateralSplitted(SplitedTable splitedTable, list[AsAlias] asAliasList)
                    ;

data JoinClause = joinOnSearch(list[JoinType] joinTypeList, ObjectRef objectRef, list[OnSearchCondition] onSearchConditionList)
                    | joinUsingColumn(list[JoinType] joinTypeList, ObjectRef objectRef, list[UsingColumnList] usingColumnList)
                    | joinNatural(list[OuterJoin] outerJoinList, ObjectRef objectRef)
                    | joinCross(ObjectRef objectRef)
                    ;

// DML

data DML = insertDML(InsertStatement insertStatement)
            | insertMultiTableDML(InsertMultiTableStatement insertMultiTableStatement)
            | updateDML(UpdateStatement updateStatement)
            | deleteDML(DeleteStatement deleteStatement) 
            | mergeDML(MergeStatement mergeStatement)
            ;

data InsertStatement = insertValuesBuilder(ObjectColumnNameOrIdentifier objNameOrId, list[ColumnListWithBrackets] columnListWithBrackets, ValuesBuilder valuesBuilder)
                        | insertValuesBuilderNoOverWrite(ObjectColumnNameOrIdentifier objNameOrId, list[ColumnListWithBrackets] columnListWithBrackets, ValuesBuilder valuesBuilder)
                        | insertSelectStatement(ObjectColumnNameOrIdentifier objNameOrId, list[ColumnListWithBrackets] columnListWithBrackets, SelectStatement selectStatement)
                        | insertSelectStatementNoOverWrite(ObjectColumnNameOrIdentifier objNameOrId, list[ColumnListWithBrackets] columnListWithBrackets, SelectStatement selectStatement)
                        ;

data InsertMultiTableStatement = insertMultiTableOverwriteAllInto(IntoValuesList intoValuesList)
                                    | insertMultiTableInsertAllInto(IntoValuesList intoValuesList)
                                    | insertMultiTableOverwriteFirstWhen(list[WhenPredicateThenValues] whenPredicateThenValues, list[ElseIntoValueslist] elseIntoValueslist, Query query)
                                    | insertMultiTableInsertFirstWhen(list[WhenPredicateThenValues] whenPredicateThenValues, list[ElseIntoValueslist] elseIntoValueslist, Query query)
                                    | insertMultiTableOverwriteAllWhen(list[WhenPredicateThenValues] whenPredicateThenValues, list[ElseIntoValueslist] elseIntoValueslist, Query query)
                                    | insertMultiTableInsertAllWhen(list[WhenPredicateThenValues] whenPredicateThenValues, list[ElseIntoValueslist] elseIntoValueslist, Query query)
                                    ;

data IntoValuesList = intoValuesList(ObjectColumnNameOrIdentifier objNameOrId, list[ColumnListWithBrackets] columnListWithBrackets, list[ValuesList] valuesList);

data IntoValuesList2 = intoValuesList2(list[IntoValuesList] intoValuesList);

data ValuesList = valuesList(list[ValueItem] valueItemList);

data ValueItem = colNameValueItem(ObjectColumnNameOrIdentifier objNameOrId)
                    | defaultValueItem()
                    | nullValueItem()
                    ;

data WhenPredicateThenValues = whenPredicateThenValues(Exp exp, IntoValuesList2 intoValuesList2);

data ElseIntoValueslist = elseIntoValuesList(IntoValuesList intoValuesList);

data UpdateStatement = updateStatement(ObjectColumnNameOrIdentifier objNameOrId, list[AsAlias] asAliasList, SetObjNameList setObjNameList, list[FromClause] fromClauseList, list[WhereClause] whereClauseList);

data SetObjNameEqToExp = setObjNameEqToExp(ObjectColumnNameOrIdentifier objNameOrId, Exp exp);

data SetObjNameList = setObjNameList(list[SetObjNameEqToExp] setObjNameEqToExpList);

data DeleteStatement = deleteStatement(ObjectColumnNameOrIdentifier objNameOrId, list[AsAlias] asAliasList, list[UsingTableQueryList] usingTableQueryList, list[WhereClause] whereClauseList);

data TableOrQuery = tableName(ObjectColumnNameOrIdentifier objNameOrId, list[AsAlias] asAliasList)
                    | queryAsAlias(Query query, list[AsAlias] asAliasList)
                    ;

data UsingTableOrQuery = usingTableOrQuery(TableOrQuery tableOrQuery);

data UsingTableQueryList = usingTableQueryList(list[UsingTableOrQuery] usingTableQueryList);

data MergeStatement = mergeStatement(ObjectColumnNameOrIdentifier objNameOrId, list[AsAlias] asAliasList, TableSource tableSource, SearchCondition searchCondition, MergeMatches mergeMatches);

data MergeMatches = mergeMatches(list[WhenMatchedThen] whenMatchedThenList, list[WhenNotMatchedThen] whenNotMatchedThenList);

data WhenNotMatchedThen = whenNotMatchedThen(list[AndSearchCondition] andSearchConditionList, MergeInsert mergeInsert);

data WhenMatchedThen = whenMatchedThen(list[AndSearchCondition] andSearchConditionList, MergeUpdateOrDelete mergeUpdateOrDelete);

data MergeUpdateOrDelete = mergeUpdate(SetObjNameList setObjNameList)
                            | mergeDelete()
                            ;

data MergeInsert = mergeInsert(list[ColumnListWithBrackets] columnListWithBrackets, ExpListWithBrackets expListWithBrackets);

data AndSearchCondition = andSearchCondition(SearchCondition searchCondition);


// DDL

data DDL = alterCommand(AlterCommand alterCmd)
            | createCommand(CreateCommand createCmd)
            | dropCommand(DropCommand dropCmd)
            | undropCommand(UndropCommand undropCmd)
            | showCommand(ShowCommand showCmd)
            | useCommand(UseCommand useCmd)
            | describeCommand(DescribeCommand describeCmd)
            | otherCommand(OtherCommand otherCmd)
            ;

data AlterCommand = alterAccountCommand(AlterAccount alterAccountCmd)
                    | alterTableCommand(AlterTable alterTableCmd)
                    | alterSessionCommand(AlterSession alterSessionCmd)
                    | alterDatabaseCommand(AlterDatabase alterDatabaseCmd)
                    | alterConnectionCommand(AlterConnection alterConnectionCmd)
                    | alterAlertCommand(AlterAlert alterAlertCmd)
                    | alterUserCommand(AlterUser alterUserCmd)
                    | alterTagCommand(AlterTag alterTagCmd)
                    | alterSchemaCommand(AlterSchema alterSchemaCmd)
                    | alterRoleCommand(AlterRole alterRoleCmd)
                    | alterRowAccessPolicyCommand(AlterRowAccessPolicy alterRowAccessPolicyCmd)
                    | alterProcedureCommand(AlterProcedure alterProcedureCmd)
                    | alterNetworkPolicyCommand(AlterNetworkPolicy alterNetworkPolicyCmd)
                    | alterApiIntegrationCommand(AlterApiIntegration alterApiIntegrationCmd)        
                    | alterDynamicTableCommand(AlterDynamicTable alterDynamicTableCmd)
                    | alterFailoverGroupCommand(AlterFailoverGroup alterFailoverGroupCmd)
                    | alterFileFormatCommand(AlterFileFormat alterFileFormatCmd)
                    | alterWareHouseCommand(AlterWareHouse alterWareHouseCmd)                
                    | alterFunctionCommand(AlterFunction alterFunctionCmd)
                    | alterViewCommand(AlterView alterViewCmd)
                    | alterMaskingPolicyCommand(AlterMaskingPolicy alterMaskingPolicyCmd)
                    | alterMaterializedViewCommand(AlterMaterializedView alterMaterializedViewCmd)
                    | alterPipeCommand(AlterPipe alterPipeCmd)
                    | alterNotificationIntegrationCommand(AlterNotificationIntegration alterNotificationIntegrationCmd)
                    | alterExternalTableCommand(AlterExternalTable alterExternalTableCmd)
                    | alterResourceMonitorCommand(AlterResourceMonitor alterResourceMonitorCmd)
                    | alterSequenceCommand(AlterSequence alterSequenceCmd)
                    ;

data AlterAccount = alterAccount(AlterAccountOpts alterAccountOpts);

data AlterAccountOpts = setAccountOpts(list[AccountParams] accountParamsList, list[ObjectParams] objectParamsList, list[SessionParams] sessionParamsList)
                        | unsetAccountOpts(list[Identifier] idList)
                        | resourceMonitorAccountOpts(Identifier id)
                        | setTagsAccountOpts(SetTags setTags)
                        | unsetTagsAccountOpts(UnsetTags unsetTags)
                        | dropUrlAccountOpts(Identifier id)
                        | saveUrlAccountOpts(Identifier id1, Identifier id2, list[SaveOldUrl] saveOldUrlList)
                        ;

data AccountParams = allowIdTokenParam(Boolean boolVal)
                        | clientEncryptionParam(Number number)
                        | enforceSessionParam(Boolean boolVal)
                        | externalOauthParam(Boolean boolVal)
                        | replicationParam(Number number)
                        | networkParam(String string)
                        ;

data ObjectParams = retentionTimeParam(Number number)
                    | extentionTimeParam(Number number)
                    | concurrencyLevelParam(Number number)
                    | networkPolicyParam(String string)
                    | pipeExecutionParam(Boolean boolVal)
                    | sessionPolicyParam(String string)
                    ;

data SessionParams = abortDetachedParam(Boolean boolVal)
                        | autoCommitParam(Boolean boolVal)
                        | binaryInputParam(String string)
                        | dateInputParam(String string)
                        | lockTimeOutParam(Number number)
                        | timeZoneParam(String string)
                        | timeStampInputParam(String string)
                        | timeStampLtzParam(String string)
                        | timeStampNtzParam(String string)
                        ;

data SetTags = setTags(TagDeclList tagDeclList);

data UnsetTags = unsetTags(list[ObjectColumnNameOrIdentifier] objNameOrIdList);

data TagDeclList = tagDeclList(list[TagDecl] tagDeclList);

data TagDecl = tagDecl(ObjectColumnNameOrIdentifier objNameOrId, String string);

data SaveOldUrl = saveOldUrl(Boolean boolVal);

data AlterTable = alterTableRename(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId1, ObjectColumnNameOrIdentifier objNameOrId2)
                    | alterTableSetTags(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, SetTags setTags)
                    | alterTableUnsetTags(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, UnsetTags unsetTags)
                    | alterTableSwapWith(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId1, ObjectColumnNameOrIdentifier objNameOrId2)
                    | alterTableDropRow(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, Identifier id)
                    ;

data IfExists = ifExists();

data AlterSession = alterSessionSet(SessionParams sessionParams)
                    | alterSessionUnset(list[Identifier] idList)
                    ;

data AlterDatabase = alterDatabaseRename(list[IfExists] ifExistsList, Identifier id1, Identifier id2)
                        | alterDatabaseSwap(list[IfExists] ifExistsList, Identifier id1, Identifier id2)
                        | alterDatabaseSetTags(Identifier id, SetTags setTags)
                        | alterDatabaseUnsetTags(Identifier id, UnsetTags unsetTags)
                        | alterDatabaseRefresh(Identifier id)
                        | alterDatabaseProperty(list[IfExists] ifExistsList, Identifier id, list[DatabaseOrSchemaProperty] databaseOrSchemaPropertyList)
                        ;

data DatabaseOrSchemaProperty = dataRetentionTimeProp(DataRetentionTimeEqInt dataRetentionTimeEqInt) 
                                | maxDataExtentionTimeProp(MaxDataExtentionTimeEqInt maxDataExtentionTimeEqInt) 
                                | defaultDdlCollationProp(DefaultDdlCollation defaultDdlCollation)
                                | commentDatabaseOrSchemaProperty()
                                ;

data DataRetentionTimeEqInt = dataRetentionTimeEqInt(str integer);

data MaxDataExtentionTimeEqInt = maxDataExtentionTimeEqInt(str integer);

data DefaultDdlCollation = defaultDdlCollation(String string);

data AlterConnection =  alterConnection(AlterConnectionOptions alterConnectionOptions);

data AlterConnectionOptions = alterConnectionPrimary(Identifier id)
                                | alterConnectionSet(list[IfExists] ifExistsList, Identifier id, CommentClause commentClause)
                                | alterConnectionUnset(list[IfExists] ifExistsList, Identifier id)
                                ;

data CommentClause = commentClause(String string);

data AlterAlert =  alterAlterResumeSuspend(list[IfExists] ifExistsList, Identifier id, ResumeSuspend resumeSuspend)
                    | alterAlterSet(list[IfExists] ifExistsList, Identifier id, list[AlertSetClause] alertSetClauseList)
                    | alterAlterUnset(list[IfExists] ifExistsList, Identifier id, list[AlertUnSetClause] alertUnSetClauseList)
                    | alterAlterModify(list[IfExists] ifExistsList, Identifier id, AlertCondition alertCondition)
                    ;

data ResumeSuspend = resumeSuspendOpt1()
                        | resumeSuspendOpt2()
                        ;

data AlertSetClause = warehouseAlertSetClause(Identifier id)
                        | scheduleAlertSetClause(String string)
                        | commentAlertSetClause(CommentClause commentClause)
                        ;

data AlertUnSetClause = warehouseAlertUnsetClause()
                        | scheduleAlertUnsetClause()
                        | commentAlertUnsetClause()
                        ;

data AlertCondition = selectAlertCondition(SelectStatement selectStatement)
                       | showAlertCondition(ShowCommand showCommand)
                       | callAlertCondition(Call call)
                       ;

data AlterUser = alterUser(list[IfExists] ifExistsList, Identifier id, AlterUserOptions alterUserOptions);

data AlterUserOptions = renameToId(Identifier id)
                        | resetPassword()
                        | abortAllQueries()
                        | addDelegated(Identifier id1, Identifier id2)
                        | removeDelegated(AuthorizationType authorizationType, Identifier id)
                        | setTagAlterUserOpt(SetTags setTags)
                        | UnsetTagAlterUserOpt(UnsetTags unsetTags)
                        ;

data AuthorizationType = ofRoleAuthorizationType(Identifier id)
                            | authorizationsType()
                            ;

data AlterTag = alterTag(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, AlterTagOptions alterTagOptions);

data AlterTagOptions = alterTagOptsRename(ObjectColumnNameOrIdentifier objectColumnNameOrIdentifier)
                        | alterTagOptsAddOrDrop(AddOrDrop addOrDrop, TagAllowedValues tagAllowedValues)
                        | alterTagOptsUnsetAllowed()
                        | alterTagOptsSetMasking(MaskingPolicyIdList maskingPolicyIdList)
                        | alterTagOptsUnsetMasking(MaskingPolicyIdList maskingPolicyIdList)
                        | alterTagOptsSetCommentClause(CommentClause commentClause)
                        | alterTagOptsUnsetComment()
                        ;

data AddOrDrop = add() 
                    | drop()
                    ;

data TagAllowedValues = tagAllowedValues(list[String] stringList);

data MaskingPolicyId = maskingPolicyId(Identifier id);

data MaskingPolicyIdList = maskingPolicyIdList(list[MaskingPolicyId] maskingPolIdList);

data AlterSchema = alterSchemaRenameTo(list[IfExists] ifExistsList, Identifier id1, Identifier id2)
                    | alterSchemaSwapWith(list[IfExists] ifExistsList, Identifier id1, Identifier id2)
                    | alterSchemaCommentClause(list[IfExists] ifExistsList, Identifier id, 
                                list[DataRetentionTimeEqInt] dataRetentionTimeEqIntList, list[MaxDataExtentionTimeEqInt] maxDataExtentionTimeEqIntList,
                                list[DefaultDdlCollation] defaultDdlCollationList, list[CommentClause] commentClauseList)
                    | alterSchemaSetTags(list[IfExists] ifExistsList, Identifier id, SetTags setTags)
                    | alterSchemaUnsetTags(list[IfExists] ifExistsList, Identifier id, UnsetTags unsetTags)
                    | alterSchemaUnset(list[IfExists] ifExistsList, Identifier id, list[DatabaseOrSchemaProperty] databaseOrSchemaPropertyList)
                    | alterSchemaEnableDisable(list[IfExists] ifExistsList, Identifier id, EnableDisable enableDisable)
                    ;

data EnableDisable = enable()
                    | disable()
                    ;

data AlterRole = alterRoleRenameTo(list[IfExists] ifExistsList, Identifier id1, Identifier id2)
                    | alterRoleSet(list[IfExists] ifExistsList, Identifier id, CommentClause commentClause)
                    | alterRoleUnset(list[IfExists] ifExistsList, Identifier id)
                    | alterRoleSetTags(list[IfExists] ifExistsList, Identifier id, SetTags setTags)
                    | alterRoleUnsetTags(list[IfExists] ifExistsList, Identifier id, UnsetTags unsetTags)
                    ;

data AlterRowAccessPolicy = alterRowSetBody(list[IfExists] ifExistsList, Identifier id, Exp exp)
                            | alterRowRenameTo(list[IfExists] ifExistsList, Identifier id1, Identifier id2)
                            | alterRowSetComment(list[IfExists] ifExistsList, Identifier id, CommentClause commentClause)
                            ;

data AlterProcedure = alterProcedureRenameTo(list[IfExists] ifExistsList, Identifier id1, list[DataTypeList] dataTypeList, Identifier id2)
                        | alterProcedureSetComment(list[IfExists] ifExistsList, Identifier id, list[DataTypeList] dataTypeList, CommentClause commentClause)
                        | alterProcedureUnsetComment(list[IfExists] ifExistsList, Identifier id, list[DataTypeList] dataTypeList, CommentClause commentClause)
                        | alterProcedureExecute(list[IfExists] ifExistsList, Identifier id, list[DataTypeList] dataTypeList, CallerOwner callerOwner)
                        ;

data CallerOwner = caller()
                    | owner()
                    ;

data AlterNetworkPolicy = alterNetworkPolicy(AlterNetworkPolicyOpts alterNetworkPolicyOpts);

data AlterNetworkPolicyOpts = alterNetworkIPList(list[IfExists] ifExistsList, Identifier id, list[AllowedIPList] allowedIPList, 
                                        list[BlockedIPList] blockedIPList, list[CommentClause] commentClauseList)
                                | alterNetworkUnset(list[IfExists] ifExistsList, Identifier id)
                                | alterNetworkRenameTo(Identifier id1, Identifier id2)
                                ;

data AllowedIPList = allowedIPList(list[StringList] stringList);

data BlockedIPList = blockedIPList(list[StringList] stringList); 

data AlterApiIntegration = alterApiArn(list[IfExists] ifExistsList, Identifier id,
                                        list[ApiAwsArn] apiAwsArnList,
                                        list[AzureAdApplication] azureAdApplicationList,
                                        list[ApiKey] apiKeyList,
                                        list[Enabled] enabledList,
                                        list[ApiAllowedPrefixes] apiAllowedPrefixesList,
                                        list[ApiBlockedPrefixes] apiBlockedPrefixesList,
                                        list[CommentClause] commentClauseList
                                    )   
                                | alterNoApiArn(list[IfExists] ifExistsList, Identifier id,
                                        list[ApiAwsArn] apiAwsArnList,
                                        list[AzureAdApplication] azureAdApplicationList,
                                        list[ApiKey] apiKeyList,
                                        list[Enabled] enabledList,
                                        list[ApiAllowedPrefixes] apiAllowedPrefixesList,
                                        list[ApiBlockedPrefixes] apiBlockedPrefixesList,
                                        list[CommentClause] commentClauseList
                                    )  
                                | alterNoApiSetTags(Identifier id, SetTags setTags)
                                | alterApiSetTags(Identifier id, SetTags setTags)
                                |  alterNoApiUnsetTags(Identifier id, UnsetTags unsetTags)
                                |  alterApiUnsetTags(Identifier id, UnsetTags unsetTags)
                                |  alterNoApiUnset(list[IfExists] ifExistsList, Identifier id, ApiIntegrationPropertyList apiIntegrationPropertyList)
                                |  alterApiUnset(list[IfExists] ifExistsList, Identifier id, ApiIntegrationPropertyList apiIntegrationPropertyList)
                                ;

data ApiAwsArn = apiAwsArn(String string);

data AzureAdApplication = azureAdApplication(String string);

data ApiKey = apiKey(String string);

data Enabled = enableTrueOrFalse(Boolean boolVal); 

data ApiAllowedPrefixes = apiAllowedPrefixes(String string);

data ApiBlockedPrefixes = apiBlockedPrefixes(String string);

data ApiIntegrationPropertyList = apiIntegrationPropertyList(list[ApiIntegrationProperty] apiIntegrationPropList);

data ApiIntegrationProperty = apiKeyIntegrationProp()
                                | enabledIntegrationProp()
                                | blockedPrefixesIntegrationProp()
                                | commentIntegrationProp()
                                ;

data AlterDynamicTable = alterDynamicTable(Identifier id, AlterDynamicOpts alterDynamicOpts);

data AlterDynamicOpts = resumeSuspendDynamicOpt(ResumeSuspend resumeSuspend)
                              | refreshDynamicOpt()
                              | setDynamicOpt(Identifier id)
                              ;

data AlterFailoverGroup
                = renameToFailoverGroup(list[IfExists] ifExistsList, Identifier id1, Identifier id2)
                | setFailoverGroup(list[IfExists] ifExistsList, Identifier id, list[ObjectTypes] objectTypesList, list[ReplicationSchedule] replicationScheduleList) 
                | addAllowedFailoverGroup(list[IfExists] ifExistsList, Identifier id, ColumnList columnList)
                | moveToFailoverGroup(list[IfExists] ifExistsList, Identifier id1, ColumnList columnList, Identifier id2)
                | removeFromFailoverGroup(list[IfExists] ifExistsList, Identifier id, ColumnList columnList)
                | allowedSharesFailoverGroup(list[IfExists] ifExistsList, Identifier id, ColumnList columnList)
                | moveSharesFailoverGroup(list[IfExists] ifExistsList, Identifier id1, ColumnList columnList, Identifier id2)
                | removeAllowedSharesFailoverGroup(list[IfExists] ifExistsList, Identifier id, ColumnList columnList)
                | allowedAccountsFailoverGroup(list[IfExists] ifExistsList, Identifier id, ObjectColumnNameOrIdentifier objNameOrId, list[IgnoreEditionCheck] ignoreEditionCheckList)
                | removeColumnFailoverGroup(list[IfExists] ifExistsList, Identifier id, ObjectColumnNameOrIdentifier objNameOrId)
                | failoverOptFailoverGroup(list[IfExists] ifExistsList, Identifier id, AlterFailoverOpts alterFailoverOpts)
                ;

data ObjectTypes = objectTypes(ObjectTypeList objectTypeList);

data ObjectTypeList = objectTypeList(list[ObjectType] objTypeList);

data ObjectType = accountParamObjectType()
                    | databasesObjectType()
                    | integrationsObjectType()
                    | networkPoliciesObjectType()
                    | resourceMonitorsObjectType()
                    | rolesObjectType()
                    | sharesObjectType()
                    | usersObjectType()
                    | warehousesObjectType()
                    ;

data ReplicationSchedule = replicationSchedule(String string);

data IgnoreEditionCheck = ignoreEditionCheck();

data AlterFailoverOpts = refreshFailoverOpts()
                                | primaryFailoverOpts()
                                | suspendFailoverOpts()
                                | resumeFailoverOpts()
                                ;

data AlterFileFormat = alterFileRenameTo(list[IfExists] ifExistsList, Identifier id1, Identifier id2)
                        | alterFileSet(list[IfExists] ifExistsList, Identifier id, list[FormatTypeOptions] formatTypeOptionsList, list[CommentClause] commentClauseList)
                        ;

data FormatTypeOptions = fileExtensionFormatOpts(String string)
                            | skipHeaderFormatOpts(str integer)
                            | skipBlankLinesFormatOpts(Boolean boolVal)
                            | dateFormatOpts(String string)
                            | timeFormatOpts(String string)
                            | timeStampFormatOpts(String string)
                            | binaryFormatOpts(BinaryFormat binaryFormat)
                            | escapeCharLiteralFormatOpts(str charLit)
                            | escapeNoneFormatOpts()
                            | escapeNone_qFormatOpts()
                            | escapeEnclosedStringFormatOpts(String string)
                            | compressionTypeFormatOpts(Compression compression)
                            | preserveSpaceFormatOpts(Boolean boolVal)
                            | stripOuterElementFormatOpts(Boolean boolVal)
                            | disableSnowFlakeFormatOpts(Boolean boolVal)
                            | disableAutoConvertFormatOpts(Boolean boolVal)
                            | ignoreUtf8ErrorsFormatOpts(Boolean boolVal)
                            | recordDelimiterFormatOpts(String string)
                            | fieldDelimiterFormatOpts(String string)
                            | trimSpaceFormatOpts(Boolean boolVal)
                            | errorOnMismatchFormatOpts(Boolean boolVal)
                            | encodingStringFormatOpts(String string)
                            | fieldEnclosedByStringFormatOpts(String string)
                            | nullIfFormatOpts(StringList stringList)
                            | replaceInvalidCharFormatOpts(Boolean boolVal)
                            ;

data BinaryFormat = binaryFormatHex()
                    | binaryFormatBase64()
                    | binaryFormatUtf8()
                    ;

data Compression = compression(CompressionType compressionType);

data CompressionType = compressionTypeAuto()
                        | compressionTypeGZIP()
                        | compressionTypeBZ2()
                        | compressionTypeBROTLI()
                        | compressionTypeZSTD()
                        | compressionTypeDeflate()
                        | compressionTypeRawDeflate()
                        | compressionTypeNone()
                        | compressionTypeAuto_q()
                        | compressionTypeAutoDetect()
                        ;

data AlterWareHouse = alterWareHouse(list[IfExists] ifExistsList, AlterWareHouseOptions alterWareHouseOptions);

data AlterWareHouseOptions = idSuspendIfAlterWhOpt(list[IdentifierFn] identifierFnList, SuspendResumeIf suspendResumeIf)
                                | idAbortAllAlterWhOpt(list[IdentifierFn] identifierFnList)
                                | idRenameToAlterWhOpt(IdentifierFn identifierFn, Identifier id)
                                | idSetTagsAlterWhOpt(IdentifierFn identifierFn, SetTags setTags)
                                | idUnSetTagsAlterWhOpt(IdentifierFn identifierFn, UnsetTags unsetTags)
                                | idUnSetColListAlterWhOpt(IdentifierFn identifierFn, ColumnList columnList)
                                ;

data IdentifierFn =  objectNameIdentifierFn(ObjectColumnNameOrIdentifier objNameOrId)
                    | bracketIdentifierFn(Identifier id)
                    | stringIdentifierFn(String string)
                    ;

data SuspendResumeIf = suspendResumeIfOpt1()
                        | suspendResumeIfOpt2(list[IfSuspended] ifSuspendedList)
                        ;

data IfSuspended = ifSuspended();

data AlterFunction = renameToAlterFunction(AlterFunctionSignature alterFunctionSignature, Identifier id)
                        | commentAlterFunction(AlterFunctionSignature alterFunctionSignature, CommentClause commentClause)
                        | setSecureAlterFunction(AlterFunctionSignature alterFunctionSignature)
                        | unsetAlterFunction(AlterFunctionSignature alterFunctionSignature, UnsetSecureOrComment unsetSecureOrComment)
                        | apiAlterFunction(AlterFunctionSignature alterFunctionSignature, Identifier id)
                        | headersAlterFunction(AlterFunctionSignature alterFunctionSignature, list[HeaderDecl] headerDeclList)
                        | contextAlterFunction(AlterFunctionSignature alterFunctionSignature, list[Identifier] idList)
                        | maxBatchAlterFunction(AlterFunctionSignature alterFunctionSignature, str integer)
                        | compressionAlterFunction(AlterFunctionSignature alterFunctionSignature, Compression compression)
                        | translatorAlterFunction(AlterFunctionSignature alterFunctionSignature, TranslatorType translatorType, Identifier id)
                        | unsetTypeAlterFunction(AlterFunctionSignature alterFunctionSignature, UnsetType unsetType)
                        ;

data AlterFunctionSignature = alterFunctionSignature(list[IfExists] ifExistsList, Identifier id, list[DataTypeList] dataTypeList);

data UnsetSecureOrComment = unsetSecure()
                        | unsetComment()
                        | setSecureOrComment()
                        ;

data HeaderDecl = headerDecl(String string1, String string2);

data TranslatorType = requestTranslatorType()
                        | responseTranslatorType()
                        ;

data UnsetType = unsetCommentType()
                        | unsetHeadersType()
                        | unsetContextHeadersType()
                        | unsetMaxBatchType()
                        | unsetCompressionType()
                        | unsetSecureType()
                        | unsetTranslatorType(TranslatorType translatorType)
                        ;

data AlterView = alterViewAlternative1(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId1, ObjectColumnNameOrIdentifier objNameOrId2)
                        | alterViewAlternative2(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, CommentClause commentClause)
                        | alterViewAlternative3(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId)
                        | alterViewAlternative4(ObjectColumnNameOrIdentifier objNameOrId)
                        | alterViewAlternative5(ObjectColumnNameOrIdentifier objNameOrId)
                        | alterViewAlternative6(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, SetTags setTags)
                        | alterViewAlternative7(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, UnsetTags unsetTags)
                        | alterViewAlternative8(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, Identifier id, ColumnListWithBrackets columnListWithBrackets)
                        | alterViewAlternative9(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, Identifier id)
                        | alterViewAlternative10(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, Identifier id1, ColumnListWithBrackets columnListWithBrackets, Identifier id2)
                        | alterViewAlternative11(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId)
                        | alterViewAlternative12(ObjectColumnNameOrIdentifier objNameOrId, AlterOrModify alterOrModify, Identifier id1, Identifier id2, list[UsingColumnList] usingColumnList)
                        | alterViewAlternative13(ObjectColumnNameOrIdentifier objNameOrId, AlterOrModify alterOrModify, Identifier id1, Identifier id2, list[UsingColumnList] usingColumnList)
                        | alterViewAlternative14(ObjectColumnNameOrIdentifier objNameOrId, AlterOrModify alterOrModify, Identifier id1, Identifier id2, list[UsingColumnList] usingColumnList)
                        | alterViewAlternative15(ObjectColumnNameOrIdentifier objNameOrId, AlterOrModify alterOrModify, Identifier id1, Identifier id2, list[UsingColumnList] usingColumnList)
                        | alterViewAlternative16(ObjectColumnNameOrIdentifier objNameOrId, AlterOrModify alterOrModify, Identifier id)
                        | alterViewAlternative17(ObjectColumnNameOrIdentifier objNameOrId, AlterOrModify alterOrModify, Identifier id)
                        | alterViewAlternative18(ObjectColumnNameOrIdentifier objNameOrId, AlterOrModify alterOrModify, Identifier id, SetTags setTags)
                        | alterViewAlternative19(ObjectColumnNameOrIdentifier objNameOrId, AlterOrModify alterOrModify, Identifier id, SetTags setTags)
                        | alterViewAlternative20(ObjectColumnNameOrIdentifier objNameOrId, AlterOrModify alterOrModify, Identifier id, UnsetTags unsetTags)
                        ;

data AlterOrModify = alterOrModifyOpt1()
                        | alterOrModifyOpt2()
                        ;

data AlterMaskingPolicy = alterMaskingBody(list[IfExists] ifExistsList, Identifier id, Exp exp)
                                | alterMaskingRenameTo(list[IfExists] ifExistsList, Identifier id1, Identifier id2)
                                | alterMaskingSet(list[IfExists] ifExistsList, Identifier id, CommentClause commentClause)
                                ;

data AlterMaterializedView = alterMaterializedView(Identifier id, AlterMaterializedViewOpts alterMaterializedViewOpts);

data AlterMaterializedViewOpts = alterMaterializedViewOpt1(Identifier id)
                                        | alterMaterializedViewOpt2(ExpListWithBrackets expListWithBrackets)
                                        | alterMaterializedViewOpt3()
                                        | alterMaterializedOptNoRecluster(ResumeSuspend resumeSuspend)
                                        | alterMaterializedOptRecluster(ResumeSuspend resumeSuspend)
                                        | alterMaterializedOptNoSecure(list[CommentClause] commentClauseList)
                                        | alterMaterializedOptSecure(list[CommentClause] commentClauseList)
                                        | alterMaterializedViewOpt7(list[UnsetSecureOrComment] unsetSecureOrCommentList)
                                        ;

data AlterPipe = alterPipeOpt1(list[IfExists] ifExistsList, Identifier id, list[ObjectProperties] objectPropertiesList, list[CommentClause] commentClauseList)
                        | alterPipeOpt2(Identifier id, SetTags setTags)
                        | alterPipeOpt3(Identifier id, UnsetTags unsetTags)
                        | alterPipeOpt4(list[IfExists] ifExistsList, Identifier id, Boolean boolVal)
                        | alterPipeOpt5(list[IfExists] ifExistsList, Identifier id)
                        | alterPipeOpt6(list[IfExists] ifExistsList, Identifier id, list[PrefixString] prefixStringList, list[ModifiedAfter] modifiedAfterList)
                        ;

data ObjectProperties = passwordObjectProp(String string)
                        | loginObjectProp(String string)
                        | displayNameObjectProp(String string)
                        | firstNameObjectProp(String string)
                        | middleNameObjectProp(String string)
                        | lastNameObjectProp(String string)
                        | emailObjectProp(String string)
                        | mustChangePasswordObjectProp(Boolean boolVal)
                        | disabledObjectProp(Boolean boolVal)
                        ;

data PrefixString = prefixString(String string);

data ModifiedAfter = modifiedAfter(String string);
                               
data AlterNotificationIntegration = alterNotificationIntegrationOpt1(list[IfExists] ifExistsList, Identifier id,
                                                list[Enabled] enabledList,
                                                CloudProviderParamsAuto cloudProviderParamsAuto,
                                                list[CommentClause] commentClauseList
                                                )
                                        | alterNotificationIntegrationOpt2(list[IfExists] ifExistsList, Identifier id,
                                                list[Enabled] enabledList,
                                                 CloudProviderParamsAuto cloudProviderParamsAuto,
                                                list[CommentClause] commentClauseList
                                                )
                                        | alterNotificationIntegrationOpt3(list[IfExists] ifExistsList, Identifier id,
                                                list[Enabled] enabledList,
                                                CloudProviderParamsPush cloudProviderParamsPush,
                                                list[CommentClause] commentClauseList
                                                )
                                        | alterNotificationIntegrationOpt4(list[IfExists] ifExistsList, Identifier id,
                                                list[Enabled] enabledList,
                                                CloudProviderParamsPush cloudProviderParamsPush,
                                                list[CommentClause] commentClauseList
                                                )
                                        | alterNotificationIntegrationOpt5(Identifier id, SetTags setTags)
                                        | alterNotificationIntegrationOpt6(Identifier id, SetTags setTags)
                                        | alterNotificationIntegrationOpt7(Identifier id, UnsetTags unsetTags)
                                        | alterNotificationIntegrationOpt8(Identifier id, UnsetTags unsetTags)
                                        | alterNotificationIntegrationOpt9(IfExists ifExists, Identifier id, AlterEnabledOrComment alterEnabledOrComment)
                                        | alterNotificationIntegrationOpt10(IfExists ifExists, Identifier id, AlterEnabledOrComment alterEnabledOrComment)
                                        ;

data CloudProviderParamsAuto
                                = googleCloudParamAuto(String string)
                                | microsoftAzureParamAuto(String string1, String string2)
                                ;

data CloudProviderParamsPush
                                = amazonAwsParamPush(String string1, String string2)
                                | googleCloudParamPush(String string)
                                | microsoftAzureParamPush(String string1, String string2)
                                ;

data AlterEnabledOrComment = alterEnabled()
                                | alterComment()
                                ;

data AlterExternalTable = alterExternalTableRefresh(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, list[String] stringList)
                                | alterExternalTableAddFiles(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, StringList strList)
                                | alterExternalTableRemoveFiles(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, StringList strList)
                                | alterExternalTableSet(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier,
                                        list[AutoRefresh] autoRefreshList, 
                                        list[TagDeclList] tagDeclList
                                        )
                                | alterExternalTableUnset(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, UnsetTags unsetTags)
                                | alterExternalTableAddPartition(ObjectColumnNameOrIdentifier objNameOrId, list[IfExists] ifExistsList, ColumnNameStringList columnNameStringList, String string)
                                | alterExternalTableDropPartition(ObjectColumnNameOrIdentifier objNameOrId, list[IfExists] ifExistsList, String string)
                                ;

data AutoRefresh = autoRefresh(Boolean boolVal);

data ColumnNameString = columnNameString(ObjectColumnNameOrIdentifier objNameOrId, String string);

data ColumnNameStringList = columnNameStringList(list[ColumnNameString] columnNameStringList);

data AlterResourceMonitor = alterResourceMonitor(list[IfExists] ifExistsList, Identifier id, list[SetResourceOpts] setResourceOptsList, list[NotifyTriggers] notifyTriggersList);

data SetResourceOpts = setResourceOpts(list[CreditQuota] creditQuotaList, list[Frequency] frequencyList, list[StartTimeStamp] startTimeStampList, list[EndTimeStamp] endTimeStampList);

data CreditQuota = creditQuota(str integer);

data StartTimeStamp = startTimeStamp(String string);

data EndTimeStamp = endTimeStamp(String string);

data Frequency = frequency(FrequencyOpts frequencyOpts);

data FrequencyOpts = monthlyFrequency()
                        | dailyFrequency()
                        | weeklyFrequency()
                        | yearlyFrequency() 
                        | neverFrequency()
                        ;

data NotifyTriggers = notifyTriggers(NotifyUsers notifyUsers, list[Triggers] triggersList);

data NotifyUsers = notifyUsers(list[Identifier] idList);

data Triggers = triggers(list[TriggerDefinition] triggerDefinitionList);

data TriggerDefinition = triggerDefinition(str integer, SuspendType suspendType);

data SuspendType = suspendTypeOpt1()
                        | suspendTypeOpt2()
                        | suspendTypeOpt3()
                        ;

data AlterSequence = alterSequenceRenameTo(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId1, ObjectColumnNameOrIdentifier objNameOrId2)
                        | alterSequenceSetIncrementBy(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, list[IncrementBy] incrementByList)
                        | alterSequenceIncrementBy(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId,  list[IncrementBy] incrementByList)
                        | alterSequenceSetOrderComment(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, OrderComment orderComment)
                        | alterSequenceUnsetComment(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId)
                        ;
                        
data IncrementBy = incrementByOpt1(str integer)
                    | incrementByOpt2(str integer)
                    | incrementByOpt3(str integer)
                    | incrementByOpt4(str integer)
                    ;

data OrderComment = orderCommentOpt1(list[OrderNoOrder] orderNoOrderList, CommentClause commentClauseList) 
                        | orderCommentOpt2(OrderNoOrder orderNoOrder)
                        ;

data OrderNoOrder = orderNoOrder1()
                    | orderNoOrder2()
                    ;

data CreateCommand =  createViewCommand(CreateView createView)
                        | createTableCommand(CreateTable createTable)
                        | createTableAsSelectCommand(CreateTableAsSelect createTableAsSelect)
                        | createTableLikeCommand(CreateTableLike createTableLike)
                        | createDatabaseCommand(CreateDatabase createDatabase)
                        | createSchemaCommand(CreateSchema createSchema)
                        | createAccountCommand(CreateAccount createAccount)
                        | createFileFormatCommand(CreateFileFormat createFileFormat)
                        | createUserCommand(CreateUser createUser)
                        | createConnectionCommand(CreateConnection createConnection)
                        | createDynamicTableCommand(CreateDynamicTable createDynamicTable)
                        | createEventTableCommand(CreateEventTable createEventTable)
                        | createFailoverGroupCommand(CreateFailoverGroup createFailoverGroup)
                        | createManagedAccountCommand(CreateManagedAccount createManagedAccount)
                        | createNetworkPolicyCommand(CreateNetworkPolicy createNetworkPolicy)
                        | createApiIntegrationCommand(CreateApiIntegration createApiIntegration)
                        | createExternalFunctionCommand(CreateExternalFunction createExternalFunction)
                        | createExternalTableCommand(CreateExternalTable createExternalTable)
                        | createFunctionCommand(CreateFunction createFunction)
                        | createMaskingPolicyCommand(CreateMaskingPolicy createMaskingPolicy)
                        | createMaterializedViewCommand(CreateMaterializedView createMaterializedView)
                        | createNotificationIntegrationCommand(CreateNotificationIntegration createNotificationIntegration)
                        | createProcedureCommand(CreateProcedure createProcedure)
                        | createPipeCommand(CreatePipe createPipe)
                        | createRoleCommand(CreateRole createRole)
                        | createRowAccessPolicyCommand(CreateRowAccessPolicy createRowAccessPolicy)
                        | createReplicationGroupCommand(CreateReplicationGroup createReplicationGroup)
                        | createResourceMonitorCommand(CreateResourceMonitor createResourceMonitor)
                        | createSequenceCommand(CreateSequence createSequence)
                        | createSessionPolicyCommand(CreateSessionPolicy createSessionPolicy)
                        | createShareCommand(CreateShare createShare)
                        ;

data CreateDatabase = createDatabaseWithTransient(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, Identifier id,
                                        list[CloneAtBefore] cloneAtBeforeList,
                                        list[DataRetentionTime] dataRetentionTimeList,
                                        list[MaxDataExtentionTime] maxDataExtentionTimeList,
                                        list[DefaultDdlCollation] defaultDdlCollationList,
                                        list[WithTags] withTagsList,
                                        list[CommentClause] commentClauseList)
                        | createDatabaseNoTransient(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, Identifier id,
                                        list[CloneAtBefore] cloneAtBeforeList,
                                        list[DataRetentionTime] dataRetentionTimeList,
                                        list[MaxDataExtentionTime] maxDataExtentionTimeList,
                                        list[DefaultDdlCollation] defaultDdlCollationList,
                                        list[WithTags] withTagsList,
                                        list[CommentClause] commentClauseList)
                        ;

data OrReplace = orReplace();

data IfNotExists = ifNotExists();

data CloneAtBefore = cloneAtBefore(ObjectColumnNameOrIdentifier objNameOrId, list[CloneOptional] cloneOptionalList);

data CloneOptional = cloneTimeStamp(AtOrBefore atOrBefore, String string)
                        | cloneOffset(AtOrBefore atOrBefore, String string)
                        | cloneStatement(AtOrBefore atOrBefore, Identifier id)
                        | cloneStream(AtOrBefore atOrBefore, String string)
                        ;

data AtOrBefore = atOrBeforeOpt1()
                    | atOrBeforeOpt2()
                    ;

data DataRetentionTime = dataRetentionTime(Number number);

data MaxDataExtentionTime = maxDataExtentionTime(Number number);

data WithTags = withTags(list[TagDecl] tagDeclList)
                | withTagsNoWith(list[TagDecl] tagDeclList)
                ;

data CreateSchema = createSchemaWithTransient(list[OrReplace] orReplaceList, list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                list[CloneAtBefore] cloneAtBeforeList,
                                list[WithManagedAccess] withManagedAccessList,
                                list[DataRetentionTime] dataRetentionTimeList,
                                list[MaxDataExtentionTime] maxDataExtentionTimeList,
                                list[DefaultDdlCollation] defaultDdlCollationList,
                                list[WithTags] withTagsList,
                                list[CommentClause] commentClauseList)
                        | createSchemaNoTransient(list[OrReplace] orReplaceList, list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                list[CloneAtBefore] cloneAtBeforeList,
                               list[WithManagedAccess] withManagedAccessList,
                                list[DataRetentionTime] dataRetentionTimeList,
                                list[MaxDataExtentionTime] maxDataExtentionTimeList,
                                list[DefaultDdlCollation] defaultDdlCollationList,
                                list[WithTags] withTagsList,
                                list[CommentClause] commentClauseList)
                        ;

data WithManagedAccess = withManagedAccess();

data FormatType = csv_()
                    | json_()
                    | avro_()
                    | orc_()
                    | parquet_()
                    | xml_()
                    | csv_q()
                    | json_q()
                    | avro_q()
                    | orc_q()
                    | parquet_q()
                    | xml_q()
                    ;

data CreateTable =  createTable(list[OrReplace] orReplaceList, list[TableType] tableTypeList, list[IfNotExistsObjectName] ifNotExistsObjectNameList, list[CloneAtBefore] cloneAtBeforeList, list[CreateTableOrCommentClause] createTableOrCommentClauseList);

data CreateTableOrCommentClause = createTableOrCommentClauseOpt1(CreateTableClause createTableClause)
                                        | createTableOrCommentClauseOpt2(CommentClause commentClause)
                                        ;
                               
data CreateTableClause = createTableClause(ColumnDeclItemListWithBrackets columnDeclItemListWithBrackets,
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
                        );

data ColumnDeclItem = fullColItem(FullColDecl fullColDecl)
                        | outOfLineConstraintItem(OutOfLineConstraint outOfLineConstraint)
                        ;
                        
data ColumnDeclItemList = columnDeclItemList(list[ColumnDeclItem] colDeclItemList);

data ColumnDeclItemListWithBrackets = columnDeclItemListWithBrackets(ColumnDeclItemList columnDeclarationItemList);

data FullColDecl = fullColDecl(ColDecl colDecl, list[FullColDeclOptionals] fullColDeclOptionalsList, list[WithMaskingPolicy] withMaskingPolicyList, list[WithTags] withTagsList, list[CommentString] commentStringList);

data OutOfLineConstraint = outOfLineConstraint(list[ConstraintId] constraintIdList, OutOfLineConstraintOptionals outOfLineConstraintOptionals);

data ColDecl = colDecl(IdentifierType idType, DataType dataType);

data FullColDeclOptionals = fullColDeclOptCollate(Collate collate)
                            | fullColDeclOptInline(InlineConstraint inlineConstraint)
                            | fullColDeclOptDefault(DefaultValue defaultValue)
                            | fullColDeclOptNullNotNull(NullNotNull nullNotNull)
                            ;

data InlineConstraint = inlineConstraintUnique(list[ConstraintId] constraintIdList, UniquePrimaryKey uniquePrimaryKey, list[CommonConstraintProperties] commonConstraintPropertiesList)
                        | inlineConstraintForeign(list[NullNotNull] nullNotNullList, list[ConstraintId] constraintIdList, ForeignKey foreignKey, ObjectColumnNameOrIdentifier objNameOrId, list[ColumnNameWithBrackets] columnNameWithBracketsList, ConstraintProperties constraintProperties)
                        ;

data ConstraintId = constraintId(Identifier id);

data UniquePrimaryKey = uniquePrimaryKeyOpt1()
                        | uniquePrimaryKeyOpt2(PrimaryKey primaryKey)
                        ;

data PrimaryKey = primaryKey();

data ForeignKey = foreignKey();

data CommonConstraintProperties = enforcedConstraintProp(EnforcedNotEnforced enforcedNotEnforced, list[ValidateNoValidate] validateNoValidateList)
                                    | defferableConstraintProp(DeferrableNotDeferrable deferrableNotDeferrable)
                                    | initiallyConstraintProp(InitiallyDeferredOrImmediate initiallyDeferredOrImmediate)
                                    | enableConstraintProp(EnableDisable enableDisable, list[ValidateNoValidate] validateNoValidateList)
                                    | relyConstraintProp()
                                    | norelyConstraintProp()
                                    ;


data EnforcedNotEnforced = enforcedNotEnforced()
                            | enforcedNotEnforcedNoNot()
                            ;

data DeferrableNotDeferrable = deferrableNotDeferrable()
                                | deferrableNotDeferrableNoNot()
                                ;

data ValidateNoValidate = validateNoValidateOpt1() 
                            | validateNoValidateOpt2()
                            ;

data InitiallyDeferredOrImmediate = initiallyDeferred() 
                                    | initiallyImmediate()
                                    ;

data ColumnNameWithBrackets = columnNameWithBrackets(ObjectColumnNameOrIdentifier objNameOrId);

data ConstraintProperties = constraintPropStar(list[CommonConstraintProperties] commonConstraintPropertiesList)
                            | constraintPropForeign(list[ForeignKeyOnActionToggle] foreignKeyOnActionToggleList)
                            ;

data ForeignKeyOnActionToggle = foreignKeyOnActionToggleOpt1(ForeignKeyMatch foreignKeyMatch) 
                                | foreignKeyOnActionToggleOpt2(OnUpdate onUpdate) 
                                | foreignKeyOnActionToggleOpt3(OnDelete onDelete)
                                ;

data ForeignKeyMatch = matchFull()
                        | matchPartial()
                        | matchSimple()
                        ;

data OnUpdate = onUpdate(OnAction onAction);

data OnDelete = onDelete(OnAction onAction);

data OnAction = cascadeAction()
                | setNullAction() 
                | setDefaultAction()
                | restrictAction()
                | noAction()
                ;


data DefaultValue = defaultExpVal(Exp exp)
                    | autoIncrementVal(list[StartWithIncrementBy] startWithIncrementByList, list[OrderNoOrder] orderNoOrderList)
                    | identityVal(list[StartWithIncrementBy] startWithIncrementByList, list[OrderNoOrder] orderNoOrderList)
                    ;

data StartWithIncrementBy = startWithIncrementByOpt1(ListOfIntWithBracket listOfIntWithBracket) 
                            | startWithIncrementByOpt2(StartWith startWith) 
                            | startWithIncrementByOpt3(IncrementBy incrementBy) 
                            | startWithIncrementByOpt4(StartWith startWith, IncrementBy incrementBy)
                            ;

data StartWith = startWithOpt1(str integer)
                    | startWithOpt2(str integer)
                    | startWithOpt3(str integer)
                    | startWithOpt4(str integer)
                    ;

data WithMaskingPolicy = withMaskingPolicy(Identifier id, list[UsingColumnList] usingColumnList)
                            | withMaskingPolicyNoWith(Identifier id, list[UsingColumnList] usingColumnList)
                            ;

data CommentString = commentString(String string);

data OutOfLineConstraintOptionals = outOfLineConstraintUnique(UniquePrimaryKey uniquePrimaryKey, ColumnListWithBrackets columnListWithBrackets, list[CommonConstraintProperties] commonConstraintPropertiesList)
                                    | outOfLineConstraintForeign(ForeignKey foreignKey, ColumnListWithBrackets columnListWithBrackets1, ObjectColumnNameOrIdentifier objNameOrId, ColumnListWithBrackets columnListWithBrackets2, ConstraintProperties constraintProperties)
                                    ;

data ClusterBy = clusterBy(ExpListWithBrackets expListWithBrackets);

data StageFileFormat = stageFileFormatOpt1(String string)
                        | stageFileFormatOpt2(FormatType formatType, list[FormatTypeOptions] formatTypeOptionsList)
                        ;

data StageCopyEqCopyOptions = stageCopyEqCopyOptions(CopyOptions copyOptions);

data CopyOptions = onErrorOpts(OnErrorAction onErrorAction)
                    | sizeLimitInt(str integer)
                    | purgeTrueOrFalse(Boolean boolVal)
                    | returnedFailedOnly(Boolean boolVal)
                    | matchByColName(Sensitivity sensitivity)
                    | enforceLength(Boolean boolVal)
                    | truncateCol(Boolean boolVal)
                    | forceTrueOrFalse(Boolean boolVal)
                    ;

data OnErrorAction = continueAction()
                        | skipFile()
                        | skipFileInt(str integer)
                        | skipFileAbort(str integer)
                        ;

data Sensitivity = sensitivityOpt1()
                    | sensitivityOpt2()
                    | sensitivityOpt3()
                    ;

data ChangeTracking = changeTracking(Boolean boolVal);

data CopyGrants = copyGrants();

data WithRowAccessPolicy = withRowAccessPolicy(Identifier id, list[ObjectColumnNameOrIdentifier] objNameOrIdList)
                            | withRowAccessPolicyNoWith(Identifier id, list[ObjectColumnNameOrIdentifier] objNameOrIdList)
                            ;

data TableType = volatileType(list[LocalGlobal] localGlobalList)
                    | temporaryType(list[LocalGlobal] localGlobalList, Temporary temporary)
                    | transientType()
                    ;

data LocalGlobal = local()
                    | global()
                    ;

data Temporary = temp()
                    | temporary()
                    ;

data IfNotExistsObjectName = ifNotExistsObjectName(list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objNameOrId)
                                | objectNameIfNotExists(ObjectColumnNameOrIdentifier objNameOrId, IfNotExists ifNotExists)
                                ;

data InternalOrExternalStage = stageAtId(Identifier id)
                                | stageAtIdNoSlash(Identifier id)
                                | externallocation(ExternalLocation externalLocation)
                                ;

data ExternalLocation = externalLocationOpt1(S3OrGovAwsPath s3OrGovAwsPath)
                        | externalLocationOpt2(GcsPath gcsPath)
                        | externalLocationOpt3(AzurePath azurePath)
                        ;

data S3OrGovAwsPath = s3Path(str uri)
                        | s3govPath(str uri)
                        ;

data GcsPath = gcsPath(str uri);

data AzurePath = azurePath(str uri);

data FileFormat = fileFormat(FormatNameOrTypeFormat formatNameOrTypeFormat);

data FormatNameOrTypeFormat = formatNameOrTypeFormatOpt1(FormatName formatName)
                            | formatNameOrTypeFormatOpt2(TypeFormat typeFormat)
                            ;

data FormatName = formatName(String string);

data TypeFormat = typeFormat(FormatType formatType, list[FormatTypeOptions] formatTypeOptionsList);

data BracketColumnListWithComment = bracketColumnListWithComment(ColumnListWithComment colListWithComment);

data ColumnListWithComment = columnListWithComment(list[ColumnNameWithComment] columnNameWithCommentList);

data ColumnNameWithComment = columnNameWithComment(ObjectColumnNameOrIdentifier objNameOrId, list[CommentString] commentStringList);

data ViewCol = viewCol(ObjectColumnNameOrIdentifier objNameOrId, WithMaskingPolicy withMaskingPolicy, WithTags withTags);

data CopyIntoTable = copyIntoTableFromStage(ObjectColumnNameOrIdentifier objNameOrId, InternalOrExternalStage internalOrExternalStage,
                                list[Files] filesList, list[Pattern] patternList,
                                list[FileFormat] fileFormatList,
                                list[CopyOptions] copyOptionsList,
                                list[ValidationMode] validationModeList
                        )
                        | copyIntoTable(ObjectColumnNameOrIdentifier objNameOrId, list[ColumnListWithBrackets] columnListWithBrackets,
                                list[Files] filesList, list[Pattern] patternList,
                                list[FileFormat] fileFormatList,
                                list[CopyOptions] copyOptionsList
                        )
                        ;

data Files = fileEq(list[String] stringList);

data ValidationMode = validationMode(ReturnValidationType returnValidationType);

data ReturnValidationType = returnValidationTypeOpt1(str integer) 
                            | returnValidationTypeOpt2()
                            | returnValidationTypeOpt3()
                            ;

data CreateTableAsSelect = createTableAsSelect(list[OrReplace] orReplaceList, list[TableType] tableTypeList, IfNotExistsObjectName ifNotExistsObjectName,
                                        list[ColumnDeclItemListWithBrackets] columnDeclItemListWithBrackets,
                                        list[ClusterBy] clusterByList, list[CopyGrants] copyGrantsList,
                                        list[WithRowAccessPolicy] withRowAccessPolicyList, list[WithTags] withTagsList,
                                        list[CommentClause] commentClauseList, Query query
                                )
                                ;

data CreateTableLike = createTableLike(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId1, ObjectColumnNameOrIdentifier objNameOrId2,
                                list[ClusterBy] clusterByList, list[CopyGrants] copyGrantsList
                        )
                        | createTableLikeNoTransient(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId1, ObjectColumnNameOrIdentifier objNameOrId2,
                                list[ClusterBy] clusterByList, list[CopyGrants] copyGrantsList
                        )
                        ;

data CreateView = createViewOpt1(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                list[BracketColumnListWithComment] bracketColumnListWithComment, list[ViewCol] viewColList,
                                list[WithRowAccessPolicy] withRowAccessPolicyList, list[WithTags] withTagsList,
                                list[CopyGrants] copyGrantsList, list[CommentClause] commentClauseList,
                                Query query
                        )
                        | createViewOpt2(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                list[BracketColumnListWithComment] bracketColumnListWithComment, list[ViewCol] viewColList,
                                list[WithRowAccessPolicy] withRowAccessPolicyList, list[WithTags] withTagsList,
                                list[CopyGrants] copyGrantsList, list[CommentClause] commentClauseList,
                                Query query
                        )
                        | createViewOpt3(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                list[BracketColumnListWithComment] bracketColumnListWithComment, list[ViewCol] viewColList,
                                list[WithRowAccessPolicy] withRowAccessPolicyList, list[WithTags] withTagsList,
                                list[CopyGrants] copyGrantsList, list[CommentClause] commentClauseList,
                                Query query
                        )
                        | createViewOpt4(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                list[BracketColumnListWithComment] bracketColumnListWithComment, list[ViewCol] viewColList,
                                list[WithRowAccessPolicy] withRowAccessPolicyList, list[WithTags] withTagsList,
                                list[CopyGrants] copyGrantsList, list[CommentClause] commentClauseList,
                                Query query
                        )
                        ;

data WhSize = sizeXsmall()
                | sizeSmall()
                | sizeMedium()
                | sizeLarge()
                | sizeXlarge()
                | sizeXxlarge()
                | sizeXxxlarge()
                | sizeX4large()
                | sizeX5large()
                | sizeX6large()
                ;

data CreateAccount = createAccount(Identifier id1, Identifier id2, String string1, list[FirstName] firstNameList, list[LastName] lastNameList, 
                                String string2, list[MustChangePassword] mustChangePasswordList, EditionType editionType, list[RegionGroup] regionGroupList,
                                list[SnowflakeRegion] snowflakeRegionList, list[CommentClause] commentClauseList
                                ); 


data MustChangePassword = mustChangePassword(Boolean boolVal);

data FirstName = firstName(Identifier id);

data LastName = lastName(Identifier id);

data EditionType = standard()
                    | enterprise()
                    | businessCritical()
                    ;

data RegionGroup = regionGroup(Identifier id);

data SnowflakeRegion = snowflakeRegion(Identifier id);


data CreateFileFormat = createFileFormat(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                        list[TypeEqFormatType] typeEqFormatTypeList, list[FormatTypeOptions] formatTypeOptionsList, list[CommentClause] commentClauseList
                                 );

data TypeEqFormatType = typeEqFormatType(FormatType formatType);


data CreateUser = createUser(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, Identifier id, list[ObjectProperties] objectPropertiesList, list[ObjectParams] objectParamsList, list[SessionParams] sessionParamsList);

data CreateConnection = createConnection(list[IfNotExists] ifNotExistsList, Identifier id, list[AsReplicaOfObjectName] asReplicaOfObjectNameList, list[CommentClause] commentClauseList);

data AsReplicaOfObjectName = asReplicaOfObjectName(ObjectColumnNameOrIdentifier objNameOrId);

data CreateDynamicTable = createDynamicTable(list[OrReplace] orReplaceList, Identifier id1, String string, Identifier id2, Query qry);

data CreateEventTable = createEventTable(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, Identifier id,
                                list[ClusterBy] clusterByList, 
                                list[DataRetentionTimeEqInt] dataRetentionTimeEqIntList,
                                list[MaxDataExtentionTimeEqInt] maxDataExtentionTimeEqIntList, 
                                list[ChangeTracking] changeTrackingList, 
                                list[DefaultDdlCollation] defaultDdlCollationList,
                                list[CopyGrants] copyGrantsList, 
                                list[WithRowAccessPolicy] withRowAccessPolicyList, 
                                list[WithTags] withTagsList, 
                                list[WithCommentClause] withCommentClauseList
                                );

data WithCommentClause = withCommentClauseNoWith(CommentClause commentClause)
                                | withCommentClause(CommentClause commentClause)
                                ;


data CreateFailoverGroup = createFailoverGroupAsReplica(list[IfNotExists] ifNotExistsList, Identifier id, AsReplicaOfObjectName asReplicaOfObjectName)
                                | createFailoverGroupObjectTypes(list[IfNotExists] ifNotExistsList, Identifier id, 
                                        ObjectTypeList objectTypeList,
                                        list[AllowedDatabases] allowedDatabasesList,
                                        list[AllowedShares] allowedSharesList, 
                                        list[AllowedIntegrationTypes] allowedIntegrationTypesList,
                                        ObjectColumnNameOrIdentifier objNameOrId, 
                                        list[IgnoreEditionCheck] ignoreEditionCheckList, 
                                        list[ReplicationSchedule] replicationScheduleList
                                );

data AllowedDatabases = allowedDatabases(list[Identifier] idList);

data AllowedShares = allowedShares(list[Identifier] idList);

data AllowedIntegrationTypes = allowedIntegrationTypes(list[IntegrationTypeName] integrationTypeNameList);

data IntegrationTypeName =  securityIntegrations()
                                | apiIntegrations()
                                ;

data CreateManagedAccount = createManagedAccount(Identifier id1, Identifier id2, String string, list[CommaCommentClause] commaCommentClauselist);

data CommaCommentClause = commaCommentClause(CommentClause commentClause);

data CreateNetworkPolicy = createNetworkPolicy(list[OrReplace] orReplaceList, Identifier id, 
                                        AllowedIPList allowedIP,
                                        list[BlockedIPList] blockedIPList,
                                        list[CommentClause] commentClauselist
                                );


data CreateApiIntegration = apiAwsRole(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, Identifier id1, Identifier id2,
                                        String string1, list[ApiKey] apiKeyList, String string2,
                                        list[ApiBlockedPrefixes] apiBlockedPrefixesList, Enabled enabled, list[CommentClause] commentClauselist
                                )
                                | azureTenant(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, Identifier id1,
                                        Identifier id2, String string1, String string2, list[ApiKey] apiKeyList,
                                        String string3, list[ApiBlockedPrefixes] apiBlockedPrefixesList,
                                        Enabled enabled, list[CommentClause] commentClauselist
                                )
                                | googleAudience(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, Identifier id1, 
                                        Identifier id2, String string2, String string3, list[ApiBlockedPrefixes] apiBlockedPrefixesList,
                                        Enabled enabled, list[CommentClause] commentClauselist
                                )        
                                ;

data CreateExternalFunction = createExternalFunction(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId, list[ArgDataTypeList] argDataTypeList,
                                        DataType dataType, list[NullNotNull] nullNotNullList, list[CalledReturnsOrStrict] calledReturnsOrStrictList,
                                        list[VolatileOrImmutable] volatileOrImmutableList, list[CommentClause] commentClauselist, Identifier id, 
                                        list[Headers] headersList, list[ContextHeaders] contextHeadersList, list[MaxBatchRows] maxBatchRowsList, list[Compression] compressionList, 
                                        list[RequestTranslator] requestTranslatorList, list[ResponseTranslator] responseTranslatorList, String string
                                        )
                                | createExternalFunctionNoSecure(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId, list[ArgDataTypeList] argDataTypeList,
                                        DataType dataType, list[NullNotNull] nullNotNullList, list[CalledReturnsOrStrict] calledReturnsOrStrictList,
                                        list[VolatileOrImmutable] volatileOrImmutableList, list[CommentClause] commentClauselist, Identifier id, 
                                        list[Headers] headersList, list[ContextHeaders] contextHeadersList, list[MaxBatchRows] maxBatchRowsList, list[Compression] compressionList, 
                                        list[RequestTranslator] requestTranslatorList, list[ResponseTranslator] responseTranslatorList, String string
                                        );


data ArgDataTypeList = argDataTypeList(list[ArgDataType] argDataTypeList);

data ArgDataType = argDataType(Identifier id1, Identifier id2);

data VolatileOrImmutable = volatileOpt()
                                | immutableOpt()
                                ;

data Headers = headers(list[HeaderDecl] headerDeclList);

data ContextHeaders = contextHeaders(Identifier idList);

data MaxBatchRows = maxBatchRows(Int integer);

data ResponseTranslator = responseTranslator(Identifier id);

data RequestTranslator = requestTranslator(Identifier id);

data CreateExternalTable = createExternalTableAuto(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, 
                                        ObjectColumnNameOrIdentifier objNameOrId, ExternalTableColumnDeclList externalTableColumnDeclList, 
                                        list[CloudProviderParam] cloudProviderParamList, list[PartitionBy] partitionByList, 
                                        LocationEqInternalOrExternalStage locationEqInternalOrExternalStage, list[RefreshOnCreate] refreshOnCreateList, 
                                        list[AutoRefresh] autoRefreshList, list[Pattern] patternList, FileFormat fileFormat, list[AwsSNSTopic] awsSNSTopicList, 
                                        list[CopyGrants] copyGrantsList, list[WithRowAccessPolicy] withRowAccessPolicyList, list[WithTags] withTagsList, list[CommentClause] commentClauseList
                                        )
                                | createExternalTableManual(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, 
                                        ObjectColumnNameOrIdentifier objNameOrId, ExternalTableColumnDeclList externalTableColumnDeclList, 
                                        list[CloudProviderParam] cloudProviderParamList, list[PartitionBy] partitionByList, 
                                        LocationEqInternalOrExternalStage locationEqInternalOrExternalStage,
                                        PartitionType partitionType,
                                        FileFormat fileFormat,
                                        list[CopyGrants] copyGrantsList,
                                        list[WithRowAccessPolicy] withRowAccessPolicyList, list[WithTags] withTagsList, list[CommentClause] commentClauseList
                                )
                                | createExternalTableDeltaLake(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, 
                                        ObjectColumnNameOrIdentifier objNameOrId, ExternalTableColumnDeclList externalTableColumnDeclList, 
                                        list[CloudProviderParam] cloudProviderParamList, list[PartitionBy] partitionByList, 
                                        LocationEqInternalOrExternalStage locationEqInternalOrExternalStage,
                                        PartitionType partitionType,
                                        FileFormat FileFormat, 
                                        list[TableFormatEqDelta] tableFormatEqDeltaList, 
                                        list[CopyGrants] copyGrantsList,
                                        list[WithRowAccessPolicy] withRowAccessPolicyList, list[WithTags] withTagsList, list[CommentClause] commentClauseList
                                );


data ExternalTableColumnDeclList = externalTableColumnDeclList(list[ExternalTableColumnDecl] externalTableColumnDeclList);

data ExternalTableColumnDecl = externalTableColumnDecl(ObjectColumnNameOrIdentifier objNameOrId, DataType dataType, Exp exp, list[InlineConstraint] inlineConstraintList);


data CloudProviderParam = cloudProviderParamAws(String string, list[StorageAwsObject] storageAwsObjectList)
                                | cloudProviderParamGCS()
                                | cloudProviderParamAzure(String string)
                                ;

data StorageAwsObject = storageAwsObject(String string);

data LocationEqInternalOrExternalStage = withLocation(InternalOrExternalStage internalOrExternalStage)
                                                | noWithLocation(InternalOrExternalStage internalOrExternalStage)
                                                ;

data RefreshOnCreate = refreshOnCreate(Boolean boolVal); 

data AwsSNSTopic = awsSNSTopic(String string);

data PartitionType = partitionType();

data TableFormatEqDelta = tableFormatEqDelta();


data CreateNotificationIntegration = createNotificationAuto(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, Identifier id,
                                        Boolean boolVal, CloudProviderParamsAuto cloudProviderParamsAuto, list[CommentClause] commentClauseList
                                        )
                                | createNotificationPush(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, Identifier id,
                                        Boolean boolVal, CloudProviderParamsPush cloudProviderParamsPush, list[CommentClause] commentClauseList
                                );

data CreateProcedure = createProcedureLangSQL(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId, list[ArgDataTypeList] argDataTypeList,
                                ReturnsType returnsType, list[NullNotNull] nullNotNullList, list[CalledReturnsOrStrict] calledReturnsOrStrictList,
                                list[VolatileOrImmutable] volatileOrImmutableList, list[CommentClause] commentClauseList,
                                list[ExecuteAs] executeAsList, String string
                                )
                        | createProcedureLangJavascript(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId, list[ArgDataTypeList] argDataTypeList,
                                ReturnsType returnsType, list[CalledReturnsOrStrict] calledReturnsOrStrictList,
                                list[VolatileOrImmutable] volatileOrImmutableList, list[CommentClause] commentClauseList,
                                list[ExecuteAs] executeAsList, String string
                        )
                        | createProcedureLangJavascriptNoSecure(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId, list[ArgDataTypeList] argDataTypeList,
                                ReturnsType returnsType, list[CalledReturnsOrStrict] calledReturnsOrStrictList,
                                list[VolatileOrImmutable] volatileOrImmutableList, list[CommentClause] commentClauseList,
                                list[ExecuteAs] executeAsList, String string
                        )
                        ;

data ExecuteAs = executeAs(CallerOwner callerOwner);


data CreatePipe = createPipe(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                list[AutoIngest] autoIngestList, list[ErrorIntegration] errorIntegrationList,
                                list[AwsSNSTopic] awsSNSTopicList,
                                list[IntegrationString] integrationStringList,
                                list[CommentClause] commentClauseList,
                                CopyIntoTable copyIntoTable
                                );

data AutoIngest = autoIngest(Boolean boolVal);

data ErrorIntegration = errorIntegration(Identifier id);

data IntegrationString = integrationString(String string);

data CreateRole = createRole(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, Identifier id, list[WithTags] withTagsList, list[CommentClause] commentClauseList);

data CreateRowAccessPolicy = createRowAccessPolicy(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, Identifier id,
                                        list[ArgDataTypeList] argDataTypeList, Exp exp, list[CommentClause] commentClauseList
                                        );

data CreateReplicationGroup = replicationGroupAllowed(list[IfNotExists] ifNotExistsList, Identifier id, ObjectTypes objectTypes,
                                        list[AllowedDatabases] allowedDatabasesList, list[AllowedShares] allowedSharesList, list[AllowedIntegrationTypes] allowedIntegrationTypesList,
                                        ObjectColumnNameOrIdentifier objNameOrId, list[IgnoreEditionCheck] ignoreEditionCheckList, list[ReplicationSchedule] replicationScheduleList
                                        )
                                | replicationGroupReplica(list[IfNotExists] ifNotExistsList, Identifier id, AsReplicaOfObjectName asReplicaOfObjectName
                                        );

data CreateResourceMonitor = createResourceMonitor(list[OrReplace] orReplaceList, Identifier id, list[CreditQuota] creditQuotaList, list[Frequency] frequencyList,
                                        list[StartTimeStamp] startTimeStampList, list[EndTimeStamp] endTimeStampList, list[NotifyUsers] notifyUsersList, list[Triggers] triggersList
                                );

data CreateSequence = createSequence(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                list[StartWith] startWithList, list[IncrementBy] incrementByList, list[OrderNoOrder] orderNoOrderList, list[CommentClause] commentClauseList
                                )
                        | createSequenceNoWith(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                list[StartWith] startWithList, list[IncrementBy] incrementByList, list[OrderNoOrder] orderNoOrderList, list[CommentClause] commentClauseList
                                );

data CreateSessionPolicy = createSessionPolicy(list[OrReplace] orReplaceList, list[IfExists] ifExistsList, Identifier id,
                                        list[SessionIdleTimeOut] sessionIdleTimeOutList, list[SessionUIIdleTimeOut] sessionUIIdleTimeOutList, list[CommentClause] commentClauseList
                                );

data SessionIdleTimeOut = sessionIdleTimeOut(Int integer);

data SessionUIIdleTimeOut = sessionUIIdleTimeOut(Int integer);

data CreateShare = createShare(list[OrReplace] orReplaceList, Identifier id, list[CommentClause] commentClauseList);

data CreateFunction = createFunctionOpt1(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId, list[ArgDataTypeList] argDataTypeList,
                                ReturnsType returnsType, list[NullNotNull] nullNotNullList, list[CalledReturnsOrStrict] calledReturnsOrStrictList,
                                list[VolatileOrImmutable] volatileOrImmutableList, list[CommentClause] commentClauseList,  String string
                                )
                        | createFunctionOpt2(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId, list[ArgDataTypeList] argDataTypeList,
                                ReturnsType returnsType, list[NullNotNull] nullNotNullList, list[CalledReturnsOrStrict] calledReturnsOrStrictList,
                                list[VolatileOrImmutable] volatileOrImmutableList, list[CommentClause] commentClauseList,  String string
                                )
                        | createFunctionOpt3(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId, list[ArgDataTypeList] argDataTypeList,
                                ReturnsType returnsType, list[NullNotNull] nullNotNullList, list[CalledReturnsOrStrict] calledReturnsOrStrictList,
                                list[VolatileOrImmutable] volatileOrImmutableList, list[CommentClause] commentClauseList,  String string
                                )
                        | createFunctionOpt4(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId, list[ArgDataTypeList] argDataTypeList,
                                ReturnsType returnsType, list[NullNotNull] nullNotNullList, list[CalledReturnsOrStrict] calledReturnsOrStrictList,
                                list[VolatileOrImmutable] volatileOrImmutableList, list[CommentClause] commentClauseList,  String string
                                )
                        | createFunctionOpt5(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId, list[ArgDataTypeList] argDataTypeList,
                                ReturnsType returnsType, list[NullNotNull] nullNotNullList, list[CalledReturnsOrStrict] calledReturnsOrStrictList,
                                list[VolatileOrImmutable] volatileOrImmutableList, list[CommentClause] commentClauseList,  String string
                                )
                        | createFunctionOpt6(list[OrReplace] orReplaceList, ObjectColumnNameOrIdentifier objNameOrId, list[ArgDataTypeList] argDataTypeList,
                                ReturnsType returnsType, list[NullNotNull] nullNotNullList, list[CalledReturnsOrStrict] calledReturnsOrStrictList,
                                list[VolatileOrImmutable] volatileOrImmutableList, list[CommentClause] commentClauseList,  String string
                                );

data ReturnsType = returnsDataType(DataType dataType) 
                        | returnsTable(list[ColDeclList] colDeclList)
                        ;

data CalledReturnsOrStrict = calledOnNull()
                                | returnsNull()
                                | returnsStrict()
                                ;

data ColDeclList = colDeclList(list[ColDecl] colDeclList);

data CreateMaskingPolicy = createMaskingPolicy(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                        list[ArgDataTypeList] argDataTypeList, Identifier id, Exp exp, list[CommentClause] commentClauseList
                                        );

data CreateMaterializedView = createMaterializedViewNoSecure(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                        list[BracketColumnListWithComment] bracketColumnListWithComment,
                                        list[ViewCol] viewColList,
                                        list[WithRowAccessPolicy] withRowAccessPolicyList,
                                        list[WithTags] withTagsList, 
                                        list[CopyGrants] copyGrantsList, 
                                        list[CommentClause] commentClauseList,
                                        list[ClusterBy] clusterByList, SelectStatement selectStatement
                                        )
                                | createMaterializedViewSecure(list[OrReplace] orReplaceList, list[IfNotExists] ifNotExistsList, ObjectColumnNameOrIdentifier objNameOrId,
                                       list[BracketColumnListWithComment] bracketColumnListWithComment,
                                        list[ViewCol] viewColList,
                                        list[WithRowAccessPolicy] withRowAccessPolicyList,
                                        list[WithTags] withTagsList, 
                                        list[CopyGrants] copyGrantsList, 
                                        list[CommentClause] commentClauseList,
                                        list[ClusterBy] clusterByList, SelectStatement selectStatement
                                        )
                                ;

data Call = callClause(ObjectColumnNameOrIdentifier objNameOrId, list[ExpList] expListList);

data DropCommand = dropDatabaseCommand(DropDatabase dropDatabase)
                    | dropAlertCommand(DropAlert dropAlert)
                    | dropConnectionCommand(DropConnection dropConnection)
                    | dropObjectCommand(DropObject dropObject)
                    | dropRoleCommand(DropRole dropRole)
                    | dropTableCommand(DropTable dropTable)
                    | dropDynamicTableCommand(DropDynamicTable dropDynamicTable)
                    | dropExternalTableCommand(DropExternalTable dropExternalTable)
                    | dropFailoverGroupCommand(DropFailoverGroup dropFailoverGroup)
                    | dropFileFormatCommand(DropFileFormat dropFileFormat)
                    | dropFunctionCommand(DropFunction dropFunction)
                    | dropIntegrationCommand(DropIntegration dropIntegration)
                    | dropManagedAccountCommand(DropManagedAccount dropManagedAccount)
                    | dropMaskingPolicyCommand(DropMaskingPolicy dropMaskingPolicy)
                    | dropMaterializedViewsCommand(DropMaterializedViews dropMaterializedViews)
                    | dropPipeCommand(DropPipe dropPipe)
                    | dropReplicationGroupCommand(DropReplicationGroup dropReplicationGroup)
                    | dropResourceMonitorCommand(DropResourceMonitor dropResourceMonitor)
                    | dropShareCommand(DropShare dropShare)
                    | dropTaskCommand(DropTask dropTask)
                    | dropTagCommand(DropTag dropTag)
                    | dropUserCommand(DropUser dropUser)
                    | dropViewCommand(DropView dropView)
                    | dropWareHouseCommand(DropWareHouse dropWareHouse)
                    | dropNetworkPolicyCommand(DropNetworkPolicy dropNetworkPolicy)
                    | dropProcedureCommand(DropProcedure dropProcedure)
                    | dropRowAccessPolicyCommand(DropRowAccessPolicy dropRowAccessPolicy)
                    | dropSchemaCommand(DropSchema dropSchema)
                    | dropSequenceCommand(DropSequence dropSequence)
                    | dropSessionPolicyCommand(DropSessionPolicy dropSessionPolicy)
                    | dropStageCommand(DropStage dropStage)
                    | dropStreamCommand(DropStream dropStream)
                    ;

data DropDatabase = dropDatabase(list[IfExists] ifExistsList, Identifier id, list[CascadeRestrict] cascadeRestrictList);

data CascadeRestrict = cascadeRestrictOpt1()
                        | cascadeRestrictOpt2()
                        ;

data DropAlert = dropAlert(Identifier id);

data DropConnection = dropConnection(list[IfExists] ifExistsList, Identifier id);

data DropObject = dropObject(ObjectType objectTypeList, IfExists ifExists, Identifier id, list[CascadeRestrict] cascadeRestrictList);

data DropRole = dropRole(list[IfExists] ifExistsList, Identifier id);

data DropTable = dropTable(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, list[CascadeRestrict] cascadeRestrictList);

data DropDynamicTable = dropDynamicTable(Identifier id);

data DropExternalTable = dropExternalTable(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, list[CascadeRestrict] cascadeRestrictList);

data DropFailoverGroup = dropFailoverGroup(list[IfExists] ifExistsList, Identifier id);

data DropFileFormat = dropFileFormat(list[IfExists] ifExistsList, Identifier id);

data DropFunction = dropFunction(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, ArgTypes argTypes);

data ArgTypes = argTypes(list[DataTypeList] dataTypeList);

data DropIntegration = dropIntegration(list[IntegrationsOptionals] integrationsOptionalsList, list[IfExists] ifExistsList, Identifier id);

data IntegrationsOptionals = apiIntegrationsOpt()
                                    | notificationIntegrationsOpt() 
                                    | securityIntegrationsOpt()
                                    | storageIntegrationsOpt()
                                    ;

data DropManagedAccount =  dropManagedAccount(Identifier id);

data DropMaskingPolicy = dropMaskingPolicy(Identifier id); 

data DropMaterializedViews = dropMaterializedViews(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId);

data DropPipe = dropPipe(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId);

data DropReplicationGroup = dropReplicationGroup(list[IfExists] ifExistsList, Identifier id);

data DropResourceMonitor = dropResourceMonitor(Identifier id);

data DropShare = dropShare(Identifier id);

data DropTask = dropTask(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId);

data DropTag = dropTag(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId);

data DropUser = dropUser(list[IfExists] ifExistsList, Identifier id);

data DropView = dropView(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId);

data DropWareHouse = dropWareHouse(list[IfExists] ifExistsList, IdentifierFn identifierFn);

data DropNetworkPolicy = dropNetworkPolicy(list[IfExists] ifExistsList, Identifier id);

data DropProcedure = dropProcedure(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, ArgTypes argTypes);

data DropRowAccessPolicy = dropRowAccessPolicy(list[IfExists] ifExistsList, Identifier id);

data DropSchema = dropSchema(list[IfExists] ifExistsList, Identifier id, list[CascadeRestrict] cascadeRestrictList);

data DropSequence = dropSequence(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, list[CascadeRestrict] cascadeRestrictList);

data DropSessionPolicy = dropSessionPolicy(list[IfExists] ifExistsList, Identifier id);

data DropStage = dropStage(list[IfExists] ifExistsList, IdentifierType idType);

data DropStream = dropStream(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId);

data UndropCommand = undropDatabaseCommand(UndropDatabase undropDatabase)
                        | undropSchemaCommand(UndropSchema undropSchema)
                        | undropTableCommand(UndropTable undropTable)
                        | undropTagCommand(UndropTag undropTag)
                        ;

data UndropDatabase = undropDatabase(Identifier id);

data UndropSchema = undropSchema(ObjectColumnNameOrIdentifier objNameOrId);

data UndropTable = undropTable(ObjectColumnNameOrIdentifier objNameOrId);

data UndropTag = undropTag(ObjectColumnNameOrIdentifier objNameOrId);

data OtherCommand = copyIntoTableCommand(CopyIntoTable copyIntoTable)
                    | beginTransactionCommand(BeginTransaction beginTransaction)
                    | copyIntoLocationCommand(CopyIntoLocation copyIntoLocation)
                    | commentCommand(Comment comment)
                    | commitCommand(Commit commit) 
                    | executeImmediateCommand(ExecuteImmediate executeImmediate)
                    | executeTaskCommand(ExecuteTask executeTask)
                    | getDMLCommand(GetDML getDML)
                    | listCommand(List listCom)
                    | removeCommand(Remove remove)
                    | setCommand(Set setCom)
                    | unsetCommand(Unset unset)
                    | truncateTableCommand(TruncateTable truncateTable)
                    | truncateMaterializedViewCommand(TruncateMaterializedView truncateMaterializedView)
                    | revokeRoleCommand(RevokeRole revokeRole)
                    | callCommand(Call call)
                    | putCommand(Put put)
                    | rollbackCommand(Rollback rollback)
                    ;

data ShowCommand = showAlertsCommand(ShowAlerts showAlerts)
                    | showChannelsCommand(ShowChannels showChannels)
                    | showColumnsCommand(ShowColumns showColumns)
                    | showConnectionsCommand(ShowConnections showConnections)
                    | showDatabasesCommand(ShowDatabases showDatabases)
                    | showDatabasesInFailoverGroupCommand(ShowDatabasesInFailoverGroup showDatabasesInFailoverGroup)
                    | showDatabasesInReplicationGroupCommand(ShowDatabasesInReplicationGroup showDatabasesInReplicationGroup)
                    | showDelegatedAuthorizationsCommand(ShowDelegatedAuthorizations showDelegatedAuthorizations)
                    | showDynamicTablesCommand(ShowDynamicTables showDynamicTables)
                    | showEventTablesCommand(ShowEventTables showEventTables)
                    | showExternalFunctionsCommand(ShowExternalFunctions showExternalFunctions)
                    | showExternalTablesCommand(ShowExternalTables showExternalTables)
                    | showFailoverGroupsCommand(ShowFailoverGroups showFailoverGroups)
                    | showFileFormatsCommand(ShowFileFormats showFileFormats)
                    | showFunctionsCommand(ShowFunctions showFunctions)
                    | showGlobalAccountsCommand(ShowGlobalAccounts showGlobalAccounts)
                    | showGrantsCommand(ShowGrants showGrants)
                    | showIntegrationsCommand(ShowIntegrations showIntegrations)
                    | showLocksCommand(ShowLocks showLocks)
                    | showManagedAccountsCommand(ShowManagedAccounts showManagedAccounts)
                    | showMaskingPoliciesCommand(ShowMaskingPolicies showMaskingPolicies)
                    | showMaterializedViewsCommand(ShowMaterializedViews showMaterializedViews)
                    | showNetworkPoliciesCommand(ShowNetworkPolicies showNetworkPolicies)
                    | showObjectsCommand(ShowObjects showObjects)
                    | showOrganizationAccountsCommand(ShowOrganizationAccounts showOrganizationAccounts)
                    | showParametersCommand(ShowParameters showParameters)
                    | showPipesCommand(ShowPipes showPipes)
                    | showPrimaryKeysCommand(ShowPrimaryKeys showPrimaryKeys)
                    | showProceduresCommand(ShowProcedures showProcedures)
                    | showRegionsCommand(ShowRegions showRegions)
                    | showReplicationAccountsCommand(ShowReplicationAccounts showReplicationAccounts)
                    | showReplicationDatabasesCommand(ShowReplicationDatabases showReplicationDatabases)
                    | showReplicationGroupsCommand(ShowReplicationGroups showReplicationGroups)
                    | showResourceMonitorsCommand(ShowResourceMonitors showResourceMonitors)
                    | showRolesCommand(ShowRoles showRoles)
                    | showRowAccessPoliciesCommand(ShowRowAccessPolicies showRowAccessPolicies)
                    | showSchemasCommand(ShowSchemas showSchemas)
                    | showSequencesCommand(ShowSequences showSequences)
                    | showSessionPoliciesCommand(ShowSessionPolicies showSessionPolicies)
                    | showSharesCommand(ShowShares showShares)
                    | showSharesInFailoverGroupCommand(ShowSharesInFailoverGroup showSharesInFailoverGroup)
                    | showSharesInReplicationGroupCommand(ShowSharesInReplicationGroup showSharesInReplicationGroup)
                    | showStagesCommand(ShowStages showStages)
                    | showStreamsCommand(ShowStreams showStreams)
                    | showTablesCommand(ShowTables showTables)
                    | showTagsCommand(ShowTags showTags)
                    | showTasksCommand(ShowTasks showTasks)
                    | showTransactionsCommand(ShowTransactions showTransactions)
                    | showUserFunctionsCommand(ShowUserFunctions showUserFunctions)
                    | showUsersCommand(ShowUsers showUsers)
                    | showVariablesCommand(ShowVariables showVariables)
                    | showViewsCommand(ShowViews showViews)
                    | showWareHousesCommand(ShowWareHouses showWareHouses)
                    ;

data ShowAlerts = showAlerts(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)
                        | showAlertsNoTerse(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)
                        ;

data LikePattern = likePattern(String string);

data InShowOptionals = inShowOptionals(ShowOptionals showOptionals);

data ShowOptionals = accountIdShowOpt(list[Identifier] idList)
                            | databaseIdShowOpt(list[Identifier] idList)
                            | tableNameShowOpt(list[ObjectColumnNameOrIdentifier] objNameOrIdList)
                            | viewNameShowOpt(list[ObjectColumnNameOrIdentifier] objNameOrIdList)
                            | schemaNameShowOpt(list[ObjectColumnNameOrIdentifier] objNameOrIdList)
                            | objNameShowOpt(ObjectColumnNameOrIdentifier objNameOrId)
                            ;

data StartsWith = startsWith(String string);

data LimitRows = limitRows(str integer, list[FromString] fromStringList);

data FromString = fromString(String string);

data ShowChannels = showChannels(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList);

data ShowColumns = showColumns(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList);

data ShowConnections = showConnections(list[LikePattern] likePatternList);

data ShowDatabases = showDatabasesOpt1(list[LikePattern] likePatternList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)
                        | showDatabasesOpt2(list[LikePattern] likePatternList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)
                        | showDatabasesOpt3(list[LikePattern] likePatternList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)
                        | showDatabasesOpt4(list[LikePattern] likePatternList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)
                        ;

data ShowDatabasesInFailoverGroup = showDatabasesInFailoverGroup(Identifier id);

data ShowDatabasesInReplicationGroup = showDatabasesInReplicationGroup(Identifier id);

data ShowDelegatedAuthorizations = showDelegatedAuthorizations()
                                    | showDelegatedAuthorizationsByUser(Identifier id)
                                    | showDelegatedAuthorizationsToSecurity(Identifier id)
                                    ;

data ShowDynamicTables = showDynamicTables(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList);

data ShowEventTables = showEventTables(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)
                        | showEventTablesNoTerse(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)
                        ;

data ShowExternalFunctions = showExternalFunctions(list[LikePattern] likePatternList);

data ShowExternalTables = showExternalTables(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)
                                | showExternalTablesNoTerse(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)
                                ;

data ShowFailoverGroups = showFailoverGroups(list[InShowOptionals] inShowOptionalsList);

data ShowFileFormats = showFileFormats(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList);

data ShowFunctions = showFunctions(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList);

data ShowGlobalAccounts = showGlobalAccounts(list[LikePattern] likePatternList);

data ShowGrants = showGrantsOptionals(list[ShowGrantOptionals] showGrantOptionalsList)
                    | showGrantsInSchema(ObjectColumnNameOrIdentifier objNameOrId)
                    | showGrantsInDatabase(Identifier id)
                    ;

data ShowGrantOptionals = onAccountShowGrantOpt()
                            | onObjectNameShowGrantOpt(ObjectType objectType, ObjectColumnNameOrIdentifier objNameOrId)
                            | toRoleShareShowGrantOpt(RoleUserOrShareId roleUserOrShareId)
                            | ofRoleShowGrantOpt(Identifier id)
                            | ofShareShowGrantOpt(Identifier id)
                            ;

data RoleUserOrShareId = roleId(Identifier id) 
                            | userId(Identifier id) 
                            | shareId(Identifier id)
                            ;

data ShowIntegrations = showIntegrations(list[IntegrationsOptionals] integrationsOptionalsList, list[LikePattern] likePatternList);

data ShowLocks = showLocks(list[InAccount] inAccountList);

data InAccount = inAccount();

data ShowManagedAccounts = showManagedAccounts(list[LikePattern] likePatternList);

data ShowMaskingPolicies = showMaskingPolicies(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList);

data ShowMaterializedViews = showMaterializedViews(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList);

data ShowNetworkPolicies = showNetworkPolicies();

data ShowObjects = showObjects(list[LikePattern] likePatternList, list[ShowOptionals] showOptionalsList);

data ShowOrganizationAccounts = showOrganizationAccounts(list[LikePattern] likePatternList);

data ShowParameters = showParameters(list[LikePattern] likePatternList, list[InOrForShowParameter] inOrForShowParameterList);

data InOrForShowParameter = inOrForShowParameter(InOrFor inOrFor, ShowParameterOptionals showParameterOptionals);

data InOrFor = inOrForOpt1()
                | inOrForOpt2()
                ;
 
data ShowParameterOptionals = sessionShowParameterOpt()
                                | accountShowParameterOpt()
                                | userIdShowParameterOpt(list[Identifier] idList)
                                | paramObjShowParameterOpt(ShowParameterObjects showParameterObjects) 
                                | tableNameShowParameterOpt(ObjectColumnNameOrIdentifier objNameOrId)
                                ;

data ShowParameterObjects = warehouseIdShowParameterObj(list[Identifier] idList)
                                | databaseidShowParameterObj(list[Identifier] idList)
                                | schemaIdShowParameterObj(list[Identifier] idList)
                                | taskIdShowParameterObj(list[Identifier] idList)
                                ;

data ShowPipes = showPipes(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList);

data ShowPrimaryKeys = showPrimaryKeysNoTerse(list[InShowOptionals] inShowOptionalsList)
                        | showPrimaryKeys(list[InShowOptionals] inShowOptionalsList)
                        ;

data ShowProcedures = showProcedures(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList);

data ShowRegions = showRegions(list[LikePattern] likePatternList);

data ShowReplicationAccounts = showReplicationAccounts(list[LikePattern] likePatternList);

data ShowReplicationDatabases = showReplicationDatabases(list[LikePattern] likePatternList, list[WithPrimaryColName] withPrimaryColNameList);

data WithPrimaryColName = withPrimaryColName(ObjectColumnNameOrIdentifier objNameOrId);

data ShowReplicationGroups = showReplicationGroups(list[InShowOptionals] inShowOptionalsList);

data ShowResourceMonitors = showResourceMonitors(list[LikePattern] likePatternList);

data ShowRoles = showRoles(list[LikePattern] likePatternList);

data ShowRowAccessPolicies = showRowAccessPolicies(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList);

data ShowSchemas = showSchemasOpt1(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)
                        | showSchemasOpt2(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)
                        | showSchemasOpt3(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)
                        | showSchemasOpt4(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)
                        ;

data ShowSequences = showSequences(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList);

data ShowSessionPolicies = showSessionPolicies();

data ShowShares = showShares(list[LikePattern] likePatternList);

data ShowSharesInFailoverGroup = showSharesInFailoverGroup(Identifier id);

data ShowSharesInReplicationGroup = showSharesInReplicationGroup(Identifier id);


data ShowStages = showStages(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList);

data ShowStreams = showStreams(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList);

data ShowTables = showTables(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList);

data ShowTags = showTags(list[LikePattern] likePatternList, list[ShowTagsOptionals] showTagsOptionalsList);

data ShowTagsOptionals = inAccountShowTagsOpt(InAccount inAccount)
                            | databaseIdShowTagsOpt(list[Identifier] idList)
                            | schemaIdShowTagsOpt(list[Identifier] idList)
                            | idShowTagsOpt(Identifier id)
                            ;

data ShowTasks = showTasks(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)
                        | showTasksNoTerse(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)
                        ;

data ShowTransactions = showTransactions(list[InAccount] inAccountList);

data ShowUserFunctions = showUserFunctions(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList);

data ShowUsers = showUsers(list[LikePattern] likePatternList, list[StartsWith] startsWithList, list[LimitInt] limitIntList, list[FromString] fromStringList)
                        | showUsersNoTerse(list[LikePattern] likePatternList, list[StartsWith] startsWithList, list[LimitInt] limitIntList, list[FromString] fromStringList)
                        ;

data LimitInt = limitInt(str integer);

data ShowVariables = showVariables(list[LikePattern] likePatternList);

data ShowViews = showViews(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)
                        | showViewsNoTerse(list[LikePattern] likePatternList, list[InShowOptionals] inShowOptionalsList, list[StartsWith] startsWithList, list[LimitRows] limitRowsList)
                        ;

data ShowWareHouses = showWareHouses(list[LikePattern] likePatternList);

data UseCommand = useDatabaseCommand(UseDatabase useDatabase)
                    | useRoleCommand(UseRole useRole)
                    | useSchemaCommand(UseSchema useSchema)
                    | useSecondaryRolesCommand(UseSecondaryRoles useSecondaryRoles)
                    | useWarehouseCommand(UseWarehouse useWarehouse)
                    ;

data UseDatabase = useDatabase(Identifier id);

data UseRole = useRole(Identifier id);

data UseSchema = useSchema(ObjectColumnNameOrIdentifier objNameOrId)
                        | useNoSchema(ObjectColumnNameOrIdentifier objNameOrId)
                        ;

data UseSecondaryRoles = useSecondaryRoles(AllOrNone allOrNone);

data AllOrNone = allOrNoneOpt1()
                | allOrNoneOpt2()
                ;

data UseWarehouse = useWarehouse(IdentifierFn idFn);

data DescribeCommand = describeAlertCommand(DescribeAlert describeAlert)
                        | describeDatabaseCommand(DescribeDatabase describeDatabase)
                        | describeDynamicTableCommand(DescribeDynamicTable describeDynamicTable)
                        | describeEventTableCommand(DescribeEventTable describeEventTable)
                        | describeExternalTableCommand(DescribeExternalTable describeExternalTable)
                        | describeFileFormatCommand(DescribeFileFormat describeFileFormat)
                        | describeFunctionCommand(DescribeFunction describeFunction)
                        | describeIntegrationCommand(DescribeIntegration describeIntegration)
                        | describeMaskingPolicyCommand(DescribeMaskingPolicy describeMaskingPolicy)
                        | describeMaterializedViewCommand(DescribeMaterializedView describeMaterializedView)
                        | describeNetworkPolicyCommand(DescribeNetworkPolicy describeNetworkPolicy)
                        | describePipeCommand(DescribePipe describePipe)
                        | describeProcedureCommand(DescribeProcedure describeProcedure)
                        | describeResultCommand(DescribeResult describeResult)
                        | describeRowAccessPolicyCommand(DescribeRowAccessPolicy describeRowAccessPolicy)
                        | describeSchemaCommand(DescribeSchema describeSchema)
                        | describeSearchOptimizationCommand(DescribeSearchOptimization describeSearchOptimization)
                        | describeSequenceCommand(DescribeSequence describeSequence)
                        | describeSessionPolicyCommand(DescribeSessionPolicy describeSessionPolicy)
                        | describeShareCommand(DescribeShare describeShare)
                        | describeStageCommand(DescribeStage describeStage)
                        | describeStreamCommand(DescribeStream describeStream)
                        | describeTableCommand(DescribeTable describeTable)
                        | describeTaskCommand(DescribeTask describeTask)
                        | describeTransactionCommand(DescribeTransaction describeTransaction)
                        | describeUserCommand(DescribeUser describeUser)
                        | describeViewCommand(DescribeView describeView)
                        | describeWareHouseCommand(DescribeWareHouse describeWareHouse)
                        ;

data DescribeAlert = describeAlert(Describe describe, Identifier id);

data Describe = describeOpt1()
                | describeOpt2()
                ;

data DescribeDatabase = describeDatabase(Describe describe, Identifier id);

data DescribeDynamicTable = describeDynamicTable(Describe describe, Identifier id);

data DescribeEventTable = describeEventTable(Describe describe, Identifier id);

data DescribeExternalTable = describeExternalTable(Describe describe, ObjectColumnNameOrIdentifier objNameOrId, list[DescribeTableType] describeTableTypeList);

data DescribeTableType = describeTypeColumns()
                            | describeTypeStage()
                            ;

data DescribeFileFormat = describeFileFormat(Describe describe, Identifier id);

data DescribeFunction = describeFunction(Describe describe, ObjectColumnNameOrIdentifier objNameOrId, ArgTypes argTypes);

data DescribeIntegration = describeIntegration(Describe describe, list[IntegrationsOptionals] integrationsOptionalsList, Identifier id);

data DescribeMaskingPolicy = describeMaskingPolicy(Describe describe, Identifier id);

data DescribeMaterializedView = describeMaterializedView(Describe describe, ObjectColumnNameOrIdentifier objNameOrId);

data DescribeNetworkPolicy = describeNetworkPolicy(Describe describe, Identifier id);

data DescribePipe = describePipe(Describe describe, ObjectColumnNameOrIdentifier objNameOrId);

data DescribeProcedure = describeProcedure(Describe describe, ObjectColumnNameOrIdentifier objNameOrId, ArgTypes argTypes);

data DescribeResult = describeResultStr(Describe describe, String string)
                        | describeResultLastQuery(Describe describe)
                        ;

data DescribeRowAccessPolicy = describeRowAccessPolicy(Describe describe, Identifier id);

data DescribeSchema = describeSchema(Describe describe, ObjectColumnNameOrIdentifier objNameOrId);

data DescribeSearchOptimization = describeSearchOptimization(Describe describe, ObjectColumnNameOrIdentifier objNameOrId);

data DescribeSequence = describeSequence(Describe describe, ObjectColumnNameOrIdentifier objNameOrId);

data DescribeSessionPolicy = describeSessionPolicy(Describe describe, Identifier id);

data DescribeShare = describeShare(Describe describe, Identifier id);

data DescribeStage = describeStage(Describe describe, IdentifierFn idFn);

data DescribeStream = describeStream(Describe describe, ObjectColumnNameOrIdentifier objNameOrId);

data DescribeTable = describeTable(Describe describe, ObjectColumnNameOrIdentifier objNameOrId, list[DescribeTableType] describeTableTypeList);

data DescribeTask = describeTask(Describe describe, ObjectColumnNameOrIdentifier objNameOrId);

data DescribeTransaction = describeTransaction(Describe describe, str integer);

data DescribeUser = describeUser(Describe describe, Identifier id);

data DescribeView = describeView(Describe describe, ObjectColumnNameOrIdentifier objNameOrId);

data DescribeWareHouse = describeWareHouse(Describe describe, Identifier id);

data BeginTransaction = beginTransaction(list[WorkOrTransaction] workOrTransactionList, list[NameId] nameIdList)
                        | startTransaction(list[NameId] nameIdList)
                        ;

data WorkOrTransaction = workOrTransactionOpt1()
                            | workOrTransactionOpt2()
                            ;

data NameId = nameId(Identifier id);

data CopyIntoLocation = copyIntoLocation(InternalOrExternalStage internalOrExternalStage,
                                ObjectNameOrQuery objectNameOrQuery, list[PartitionBy] partitionByList,
                                list[FileFormat] fileFormatList, list[CopyOptions] copyOptionsList,
                                list[ValidationMode] validationModeList
                        )
                        | copyIntoLocationNoHeader(InternalOrExternalStage internalOrExternalStage,
                                ObjectNameOrQuery objectNameOrQuery, list[PartitionBy] partitionByList,
                                list[FileFormat] fileFormatList, list[CopyOptions] copyOptionsList,
                                list[ValidationMode] validationModeList
                        )
                        ;

data ObjectNameOrQuery = objectNameOrQueryOpt1(ObjectColumnNameOrIdentifier objNameOrId)
                            | objectNameOrQueryOpt2(Query query)
                            ;

data Comment = commentFuncSignature(list[IfExists] ifExistsList, ObjectTypeName objectTypeName, ObjectColumnNameOrIdentifier objNameOrId, list[ArgTypes] argTypesList, String string)
                | commentColumn(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId, String string)
                ;

data ObjectTypeName = roleObjectTypeName()
                        | userObjectTypeName()
                        | warehouseObjectTypeName()
                        | integrationObjectTypeName()
                        | networkObjectTypeName()
                        | sessionObjectTypeName()
                        | databaseObjectTypeName()
                        | schemaObjectTypeName()
                        | tableObjectTypeName()
                        | viewObjectTypeName()
                        | stageObjectTypeName()
                        | fileFormatObjectTypeName()
                        | streamObjectTypeName()
                        | taskObjectTypeName()
                        | maskingObjectTypeName()
                        | rowAccessObjectTypeName()
                        | tagObjectTypeName()
                        | pipeObjectTypeName()
                        | functionObjectTypeName()
                        | procedureObjectTypeName()
                        | sequenceObjectTypeName()
                        ;

data Commit = commitClause()
                | commitClauseNoWork()
                ;

data ExecuteImmediate = executeImmediateId(StringId stringId, list[UsingColumnList] usingColumnList);

data StringId = stringIdOpt1(String string)
                | stringIdOpt2(Identifier id)
                ;

data ExecuteTask = executeTask(ObjectColumnNameOrIdentifier objNameOrId);

data GetDML = getDML(InternalOrExternalStage internalOrExternalStage, FilePath filePath, list[Parallel] parallelList, list[Pattern] patternList);

data Parallel = parallelClause(str integer);

data List = listClause(InternalOrExternalStage internalOrExternalStage, list[Pattern] patternList);

data Remove = removeClause(InternalOrExternalStage internalOrExternalStage, list[Pattern] patternList);

data Set =  setId(Identifier id, Exp exp)
            | setCols(ColumnListWithBrackets columnListWithBrackets, ExpListWithBrackets expListWithBrackets)
            ;

data Unset = unsetId(Identifier id)
                | unsetCols(ColumnListWithBrackets columnListWithBrackets)
                ;

data TruncateTable = truncateTable(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId)
                        | truncateTableNoTable(list[IfExists] ifExistsList, ObjectColumnNameOrIdentifier objNameOrId)
                        ;

data TruncateMaterializedView = truncateMaterializedView(ObjectColumnNameOrIdentifier objNameOrId);

data RevokeRole = revokeRole(RoleName roleName, RoleOrUser roleOrUser);

data RoleName = systemDefinedRoleName(SystemDefinedRole systemDefinedRole)
                | idRoleName(Identifier id)
                ;

data RoleOrUser = roleOrUserOpt1(RoleName roleName)
                    | roleOrUserOpt2(Identifier id)
                    ;

data SystemDefinedRole = orgAdminDefinedRole()
                            | accountAdminDefinedRole()
                            | securityAdminDefinedRole()
                            | userAdminDefinedRole()
                            | sysAdminDefinedRole()
                            | publicDefinedRole()
                            ;

data Put = put(FilePath filePath, InternalOrExternalStage internalOrExternalStage,
                        list[Parallel] parallelList, list[AutoCompress] autoCompressList,
                        list[SourceCompression] sourceCompressionList, list[OverWrite] overWriteList
                )
                ;

data AutoCompress = autoCompress(Boolean boolVal);

data SourceCompression = sourceCompression(CompressionType compressionType);

data OverWrite = overWrite(Boolean boolVal);

data FilePath = filePath1(str uri)
                | filePath2(str windowsPath)
                ;

data Rollback = rollback()
                | rollbackNoWork()
                ;