module prettyprint::Expressions

extend prettyprint::Names;

import ast::SnowFlake;

import List;

public str prettySnowFlake(Exp::primitiveExp(PrimitiveExp primitiveExpression)) = "<prettySnowFlake(primitiveExpression)>";

public str prettySnowFlake(Exp::bracketExp(Exp exp)) = "( <prettySnowFlake(exp)> )";

public str prettySnowFlake(Exp::minExp(Exp exp)) = "- <prettySnowFlake(exp)>";

public str prettySnowFlake(Exp::plusExp(Exp exp)) = "+ <prettySnowFlake(exp)>";

public str prettySnowFlake(Exp::functionCallExp(FunctionCall functionCall)) = "<prettySnowFlake(functionCall)>";

public str prettySnowFlake(Exp::arrayAccess(Exp exp1, Exp exp2)) = "<prettySnowFlake(exp1)> [ <prettySnowFlake(exp2)> ]";

public str prettySnowFlake(Exp::arrayExp(ArrayLiteral arrayLiteral)) = "<prettySnowFlake(arrayLiteral)>";

public str prettySnowFlake(Exp::jsonAccess(Exp exp1, Exp exp2)) = "<prettySnowFlake(exp1)>:<prettySnowFlake(exp2)>";

public str prettySnowFlake(Exp::jsonLiteral(JsonLiteral jsonLiteral)) = "<prettySnowFlake(jsonLiteral)>";

public str prettySnowFlake(Exp::expCollateString(Exp exp, Collate collate)) = "<prettySnowFlake(exp)> <prettySnowFlake(collate)>";

public str prettySnowFlake(Exp::castExp(Exp exp, DataType dataType)) = "<prettySnowFlake(exp)>::<prettySnowFlake(dataType)>";

public str prettySnowFlake(Exp::overClauseExp(Exp exp, OverClause overClause)) = "<prettySnowFlake(exp)> <prettySnowFlake(overClause)>";

public str prettySnowFlake(Exp::castExpr(Exp exp, DataType dataType)) = "CAST( <prettySnowFlake(exp)> AS <prettySnowFlake(dataType)> )";

public str prettySnowFlake(Exp::tryCastExp(TryCastExp tryCastExp)) = "<prettySnowFlake(tryCastExp)>";

public str prettySnowFlake(Exp::caseExp(CaseExpression caseExpression)) = "<prettySnowFlake(caseExpression)>";

public str prettySnowFlake(Exp::trimExp(TrimExpression trimExpression)) = "<prettySnowFlake(trimExpression)>";

public str prettySnowFlake(Exp::iffExp(IffExp iffExp)) = "<prettySnowFlake(iffExp)>";

public str prettySnowFlake(Exp::expIsNullNotNull(Exp exp, NullNotNull nullNotNull)) = "<prettySnowFlake(exp)> IS <prettySnowFlake(nullNotNull)>";

public str prettySnowFlake(Exp::expBetween(Exp exp1, Exp exp2, Exp exp3)) = "<prettySnowFlake(exp1)> BETWEEN <prettySnowFlake(exp2)> AND <prettySnowFlake(exp3)>";

public str prettySnowFlake(Exp::expNotBetween(Exp exp1, Exp exp2, Exp exp3)) = "<prettySnowFlake(exp1)> NOT BETWEEN <prettySnowFlake(exp2)> AND <prettySnowFlake(exp3)>";

public str prettySnowFlake(Exp::expNotInList(Exp exp, ExpList expList)) = "<prettySnowFlake(exp)> NOT IN ( <prettySnowFlake(expList)> )";

public str prettySnowFlake(Exp::expNotInListNoNot(Exp exp, ExpList expList)) = "<prettySnowFlake(exp)> IN ( <prettySnowFlake(expList)> )";

public str prettySnowFlake(Exp::expNotIlikeEscape(Exp exp1, LikeIlike likeIlike, Exp exp2, list[EscapeExp] escapeExpList)) = "<prettySnowFlake(exp1)> NOT <prettySnowFlake(likeIlike)> <prettySnowFlake(exp2)> <for(escapeExpr <- escapeExpList) {> <prettySnowFlake(escapeExpr)> <}>";

public str prettySnowFlake(Exp::expNotIlikeEscapeNoNot(Exp exp1, LikeIlike likeIlike, Exp exp2, list[EscapeExp] escapeExpList)) = "<prettySnowFlake(exp1)> <prettySnowFlake(likeIlike)> <prettySnowFlake(exp2)> <for(escapeExpr <- escapeExpList) {> <prettySnowFlake(escapeExpr)> <}>";

public str prettySnowFlake(Exp::expNotRlikeNoNot(Exp exp1, Exp exp2)) = "<prettySnowFlake(exp1)> RLIKE <prettySnowFlake(exp2)>";

public str prettySnowFlake(Exp::expNotRlike(Exp exp1, Exp exp2)) = "<prettySnowFlake(exp1)> NOT RLIKE <prettySnowFlake(exp2)>";

public str prettySnowFlake(Exp::mul(Exp exp1, Exp exp2)) = "<prettySnowFlake(exp1)> * <prettySnowFlake(exp2)>";

public str prettySnowFlake(Exp::div(Exp exp1, Exp exp2)) = "<prettySnowFlake(exp1)> / <prettySnowFlake(exp2)>";

public str prettySnowFlake(Exp::modulus(Exp exp1, Exp exp2)) = "<prettySnowFlake(exp1)> % <prettySnowFlake(exp2)>";

public str prettySnowFlake(Exp::sub(Exp exp1, Exp exp2)) = "<prettySnowFlake(exp1)> - <prettySnowFlake(exp2)>";

public str prettySnowFlake(Exp::add(Exp exp1, Exp exp2)) = "<prettySnowFlake(exp1)> + <prettySnowFlake(exp2)>";

public str prettySnowFlake(Exp::eq(Exp exp1, Exp exp2)) = "<prettySnowFlake(exp1)> = <prettySnowFlake(exp2)>";

public str prettySnowFlake(Exp::gt(Exp exp1, Exp exp2)) = "<prettySnowFlake(exp1)> \> <prettySnowFlake(exp2)>";

public str prettySnowFlake(Exp::lt(Exp exp1, Exp exp2)) = "<prettySnowFlake(exp1)> \< <prettySnowFlake(exp2)>";

public str prettySnowFlake(Exp::gte(Exp exp1, Exp exp2)) = "<prettySnowFlake(exp1)> \>= <prettySnowFlake(exp2)>";

public str prettySnowFlake(Exp::lte(Exp exp1, Exp exp2)) = "<prettySnowFlake(exp1)> \<= <prettySnowFlake(exp2)>";

public str prettySnowFlake(Exp::neq1(Exp exp1, Exp exp2)) = "<prettySnowFlake(exp1)> != <prettySnowFlake(exp2)>";

public str prettySnowFlake(Exp::neq2(Exp exp1, Exp exp2)) = "<prettySnowFlake(exp1)> \<\> <prettySnowFlake(exp2)>";

public str prettySnowFlake(Exp::not(Exp exp)) = "NOT <prettySnowFlake(exp)>";

public str prettySnowFlake(Exp::doublePipe(Exp exp1, Exp exp2)) = "<prettySnowFlake(exp1)> || <prettySnowFlake(exp2)>";

public str prettySnowFlake(Exp::and(Exp exp1, Exp exp2)) = "<prettySnowFlake(exp1)> AND <prettySnowFlake(exp2)>";

public str prettySnowFlake(Exp::or(Exp exp1, Exp exp2)) = "<prettySnowFlake(exp1)> OR <prettySnowFlake(exp2)>";

public str prettySnowFlake(PrimitiveExp::literal(Literal literal)) = "<prettySnowFlake(literal)>";

public str prettySnowFlake(PrimitiveExp::defaultVal()) = "DEFAULT";

// public str prettySnowFlake(PrimitiveExp::stringLit(String stringVal)) = "<prettySnowFlake(stringVal)>";

// public str prettySnowFlake(PrimitiveExp::integer(str integer)) = "<integer>";

// public str prettySnowFlake(PrimitiveExp::float(str floatingPoint)) = "<floatingPoint>";

// public str prettySnowFlake(PrimitiveExp::boolean(Boolean boolVal)) = "<prettySnowFlake(boolVal)>";

public str prettySnowFlake(PrimitiveExp::nullExp()) = "NULL";

public str prettySnowFlake(PrimitiveExp::objectColId(ObjectColumnNameOrIdentifier objNameOrId)) = "<prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(Collate::collateString(String string)) = " COLLATE <prettySnowFlake(string)>";

public str prettySnowFlake(ColumnListWithBrackets::colListWithBrackets(ColumnList columnList)) = "( <prettySnowFlake(columnList)> )";

public str prettySnowFlake(ColumnList::columnList(list[ObjectColumnNameOrIdentifier] objNameOrIdList)) = "<intercalate(", ", [ prettySnowFlake(objNameOrIdListVal) | objNameOrIdListVal <- objNameOrIdList ])>";

public str prettySnowFlake(AllDistinct::allNoDistinct() ) = "ALL";

public str prettySnowFlake(AllDistinct::distinct()) = "DISTINCT";

public str prettySnowFlake(ColumnElem::objectNameStar(list[ObjectNameDot] objectNameDotList)) = "<for(objNameDot <- objectNameDotList) {> <prettySnowFlake(objNameDot)><}>*";

public str prettySnowFlake(ColumnElem::objectNameColName(Exp exp, list[AsAlias] asAliasList)) = "<prettySnowFlake(exp)> <for(asAlias <- asAliasList) {> <prettySnowFlake(asAlias)><}>";

public str prettySnowFlake(ColumnElem::objectNameColPosition(list[ObjectNameDot] objNameDotList, str integer, list[AsAlias] asAliasList)) = "<for(objNameDot <- objNameDotList) {> <prettySnowFlake(objNameDot)><}>$<integer> <for(asAlias <- asAliasList) {> <prettySnowFlake(asAlias)> <}>";

public str prettySnowFlake(ObjectNameDot::objectNameDot(ObjectColumnNameOrIdentifier objNameOrId)) = "<prettySnowFlake(objNameOrId)>.";

public str prettySnowFlake(AsAlias::asAlias(Identifier id)) = "AS <prettySnowFlake(id)>";

public str prettySnowFlake(AsAlias::asAliasNoAs(Identifier id)) = "<prettySnowFlake(id)>";

public str prettySnowFlake(VarList::varList(list[Variable] variableList)) = "<intercalate(", ", [ prettySnowFlake(variableListVal) | variableListVal <- variableList ])>";

public str prettySnowFlake(Variable::variable(Identifier id)) = ": <prettySnowFlake(id)>";

public str prettySnowFlake(OnSearchCondition::onSearchCondition(SearchCondition searchCondition)) = "ON <prettySnowFlake(searchCondition)>";

public str prettySnowFlake(SearchCondition::searchCondition(Exp exp)) = "<prettySnowFlake(exp)>";

public str prettySnowFlake(UsingColumnList::usingColumnList(ColumnList columnList)) = "USING ( <prettySnowFlake(columnList)> )";

public str prettySnowFlake(AtBefore::atTimeStamp(Exp exp)) = "AT( TIMESTAMP =\>  <prettySnowFlake(exp)> )";

public str prettySnowFlake(AtBefore::atOffset(Exp exp)) = "AT( OFFSET =\>  <prettySnowFlake(exp)> )";

public str prettySnowFlake(AtBefore::atStatement(String string)) = "AT( STATEMENT =\>  <prettySnowFlake(string)> )";

public str prettySnowFlake(AtBefore::atStream(String string)) = "AT( STREAM =\>  <prettySnowFlake(string)> )";

public str prettySnowFlake(AtBefore::beforeStatement(String string)) = "BEFORE( STATEMENT =\> <prettySnowFlake(string)> )";

public str prettySnowFlake(Changes::changes(DefaultAppendOnly defaultAppendOnly, AtBefore atBefore, list[End] endList)) = "CHANGES( INFORMATION =\> <prettySnowFlake(defaultAppendOnly)> ) <prettySnowFlake(atBefore)> <for(endIn <- endList) {> <prettySnowFlake(endIn)> <}>";

public str prettySnowFlake(DefaultAppendOnly::defaultNoAppendOnly()) = "DEFAULT";

public str prettySnowFlake(DefaultAppendOnly::appendOnly()) = "APPEND ONLY";

public str prettySnowFlake(End::endTimeStampString(String string)) = "END( TIMESTAMP -\> <prettySnowFlake(string)> )";

public str prettySnowFlake(End::endOffset(String string)) = "END( OFFSET -\> <prettySnowFlake(string)> )";

public str prettySnowFlake(End::endStatement(Identifier id)) = "END( STATEMENT -\> <prettySnowFlake(id)> )";

public str prettySnowFlake(PartitionBy::partitionBy(ExpList expList)) = "PARTITION BY <prettySnowFlake(expList)>";

public str prettySnowFlake(ExpList::expList(list[Exp] exprList)) = "<intercalate(", ", [ prettySnowFlake(exprListVal) | exprListVal <- exprList ])>";

public str prettySnowFlake(AsOrDesc::asc()) = "ASC";

public str prettySnowFlake(AsOrDesc::desc()) = "DESC";

public str prettySnowFlake(ExpAsAlias::expAsAlias(Exp exp, AsAlias asAlias)) = "<prettySnowFlake(exp)> <prettySnowFlake(asAlias)>";

public str prettySnowFlake(ExpAsAliasList::expAsAliasList(list[ExpAsAlias] expAsAliasList)) = "<intercalate(", ", [ prettySnowFlake(expAsAliasListVal) | expAsAliasListVal <- expAsAliasList ])>";

public str prettySnowFlake(OverClause::overPartitionBy(PartitionBy partitionBy, list[OrderByClause] orderByClauseList)) = "OVER( <prettySnowFlake(partitionBy)> <for(orderByClause <- orderByClauseList) {> <prettySnowFlake(orderByClause)> <}>)";

public str prettySnowFlake(OverClause::overOrderBy(OrderByClause orderByClause)) = "OVER( <prettySnowFlake(orderByClause)> )";

public str prettySnowFlake(OrderByClause::orderByClause(list[OrderItem] orderItemList)) = "ORDER BY <intercalate(", ", [ prettySnowFlake(orderItemListVal) | orderItemListVal <- orderItemList ])>";

public str prettySnowFlake(OrderItem::orderItem(Exp exp, list[AsOrDesc] asOrDescList, list[NullsFirstOrLast] nullsFirstOrLastList)) = "<prettySnowFlake(exp)> <for(asOrDesc <- asOrDescList) {> <prettySnowFlake(asOrDesc)> <}> <for(nullsFirstOrLast <- nullsFirstOrLastList) {> <prettySnowFlake(nullsFirstOrLast)> <}>";

public str prettySnowFlake(NullsFirstOrLast::nullsFirstOrLast(FirstOrLast firstOrLast)) = "NULLS <prettySnowFlake(firstOrLast)>";

public str prettySnowFlake(FirstOrLast::firstOrLast1()) = "FIRST";

public str prettySnowFlake(FirstOrLast::firstOrLast2()) = "LAST";

public str prettySnowFlake(CommaString::commaString(String string)) = ", <prettySnowFlake(string)>";

public str prettySnowFlake(WithinGroupOrder::withinGroupOrder(OrderByClause orderByClause)) = "WITHIN GROUP ( <prettySnowFlake(orderByClause)> )";

public str prettySnowFlake(IgnoreOrRepectNulls::ignoreOrRepectNulls(IgnoreOrRespect ignoreOrRespect)) = "<prettySnowFlake(ignoreOrRespect)> NULLS";

public str prettySnowFlake(IgnoreOrRespect::ignore()) = "IGNORE";

public str prettySnowFlake(IgnoreOrRespect::respect()) = "RESPECT";

public str prettySnowFlake(FirstValueOrLastValue::firstValue()) = "FIRST_VALUE";

public str prettySnowFlake(FirstValueOrLastValue::lastValue()) = "LAST_VALUE";

public str prettySnowFlake(ExpListWithBrackets::expListWithBrackets(ExpList expList)) = "( <prettySnowFlake(expList)> )";

public str prettySnowFlake(FunctionCall::rankingWindowedFunc(RankingWindowedFunction rankingWindowedFunction)) = "<prettySnowFlake(rankingWindowedFunction)>";

public str prettySnowFlake(FunctionCall::aggregateFunc(AggregateFunction aggregateFunction)) = "<prettySnowFlake(aggregateFunction)>";

public str prettySnowFlake(FunctionCall::listOpFunc(ListOperator listOperator, ExpList expList)) = "<prettySnowFlake(listOperator)>( <prettySnowFlake(expList)> )";

public str prettySnowFlake(FunctionCall::binaryOrTernaryBuiltInFunc(BinaryOrTernaryBuiltInFunction binaryOrTernaryBuiltInFunction, ExpList expList)) = "<prettySnowFlake(binaryOrTernaryBuiltInFunction)> ( <prettySnowFlake(expList)> )";

public str prettySnowFlake(RankingWindowedFunction::rankDenseRowNumberFunc(RankDenseRowNumber rankDenseRowNumber, OverClause overClause)) = "<prettySnowFlake(rankDenseRowNumber)> () <prettySnowFlake(overClause)>";

public str prettySnowFlake(RankingWindowedFunction::ntileFunc(Exp exp, OverClause overClause)) = "NTILE( <prettySnowFlake(exp)> ) <prettySnowFlake(overClause)>";

public str prettySnowFlake(RankingWindowedFunction::leadOrLagFunc(LeadOrLag leadOrLag, list[ExpList] expList, list[IgnoreOrRepectNulls] ignoreOrRepectNullsList, OverClause overClause)) = "<prettySnowFlake(leadOrLag)> ( <for(exp <- expList) {> <prettySnowFlake(exp)><}> ) <for(ignoreOrRepectNulls <- ignoreOrRepectNullsList) {> <prettySnowFlake(ignoreOrRepectNulls)> <}> <prettySnowFlake(overClause)>";

public str prettySnowFlake(RankingWindowedFunction::firstValueOrLastValueFunc(FirstValueOrLastValue firstValueOrLastValue, Exp exp, list[IgnoreOrRepectNulls] ignoreOrRepectNullsList, OverClause overClause)) = "<prettySnowFlake(firstValueOrLastValue)> ( <prettySnowFlake(exp)> ) <for(ignoreOrRepectNulls <- ignoreOrRepectNullsList) {> <prettySnowFlake(ignoreOrRepectNulls)> <}> <prettySnowFlake(overClause)>";

public str prettySnowFlake(RankDenseRowNumber::rank()) = "RANK";

public str prettySnowFlake(RankDenseRowNumber::denseRank()) = "DENSE_RANK";

public str prettySnowFlake(RankDenseRowNumber::rowNumber()) = "ROW_NUMBER";

public str prettySnowFlake(LeadOrLag::lead()) = "LEAD";

public str prettySnowFlake(LeadOrLag::lag()) = "LAG";

public str prettySnowFlake(AggregateFunction::idDistinct(ObjectColumnNameOrIdentifier objNameOrId, list[ExpList] expList)) = "<prettySnowFlake(objNameOrId)> ( DISTINCT <for(exp <- expList) {> <prettySnowFlake(exp)><}> )";

public str prettySnowFlake(AggregateFunction::idStar(ObjectColumnNameOrIdentifier objNameOrId)) = "<prettySnowFlake(objNameOrId)>( * )";

public str prettySnowFlake(AggregateFunction::idNoDistinct(ObjectColumnNameOrIdentifier objNameOrId, list[ExpList] expList)) = "<prettySnowFlake(objNameOrId)>( <for(exp <- expList) {> <prettySnowFlake(exp)><}> )";

public str prettySnowFlake(AggregateFunction::listOrArrayAggNoDistinct(ListAggOrArrayAgg listAggOrArrayAgg, Exp exp, list[CommaString] commaStringList, list[WithinGroupOrder] withinGroupOrderList)) = "<prettySnowFlake(listAggOrArrayAgg)>( <prettySnowFlake(exp)> <for(commaString <- commaStringList) {> <prettySnowFlake(commaString)><}> ) <for(withinGroupOrder <- withinGroupOrderList) {> <prettySnowFlake(withinGroupOrder)><}>";

public str prettySnowFlake(AggregateFunction::listOrArrayAgg(ListAggOrArrayAgg listAggOrArrayAgg, Exp exp, list[CommaString] commaStringList, list[WithinGroupOrder] withinGroupOrderList)) = "<prettySnowFlake(listAggOrArrayAgg)>( DISTINCT <prettySnowFlake(exp)> <for(commaString <- commaStringList) {> <prettySnowFlake(commaString)><}> ) <for(withinGroupOrder <- withinGroupOrderList) {> <prettySnowFlake(withinGroupOrder)><}>";

public str prettySnowFlake(ListAggOrArrayAgg::listAgg()) = "LISTAGG";

public str prettySnowFlake(ListAggOrArrayAgg::arrayAgg()) = "ARRAY_AGG";

public str prettySnowFlake(ListOperator::concat()) = "CONCAT";

public str prettySnowFlake(ListOperator::concatWS()) = "CONCAT_WS";

public str prettySnowFlake(ListOperator::coalesce()) = "COALESCE";

public str prettySnowFlake(IdentifierType::identifierTypeOpt1(BinaryOrTernaryBuiltInFunction binaryOrTernaryBuiltInFunction)) = "<prettySnowFlake(binaryOrTernaryBuiltInFunction)>";

public str prettySnowFlake(IdentifierType::identifierTypeOpt2(ObjectColumnNameOrIdentifier objNameOrId)) = "<prettySnowFlake(objNameOrId)>";

public str prettySnowFlake(BinaryOrTernaryBuiltInFunction::ifNullBuiltInFunction()) = "IFNULL";

public str prettySnowFlake(BinaryOrTernaryBuiltInFunction::nvlBuiltInFunction()) = "NVL";

public str prettySnowFlake(BinaryOrTernaryBuiltInFunction::getBuiltInFunction()) = "GET";

public str prettySnowFlake(BinaryOrTernaryBuiltInFunction::leftBuiltInFunction()) = "LEFT";

public str prettySnowFlake(BinaryOrTernaryBuiltInFunction::rightBuiltInFunction()) = "RIGHT";

public str prettySnowFlake(BinaryOrTernaryBuiltInFunction::datePartBuiltInFunction()) = "DATE_PART";

public str prettySnowFlake(BinaryOrTernaryBuiltInFunction::splitBuiltInFunction()) = "SPLIT";

public str prettySnowFlake(BinaryOrTernaryBuiltInFunction::nullIfBuiltInFunction()) = "NULLIF";

public str prettySnowFlake(BinaryOrTernaryBuiltInFunction::equalNullBuiltInFunction()) = "EQUAL_NULL";

public str prettySnowFlake(BinaryOrTernaryBuiltInFunction::containsBuiltInFunction()) = "CONTAINS";

public str prettySnowFlake(BinaryOrTernaryBuiltInFunction::collateBuiltInFunction()) = "COLLATE";

public str prettySnowFlake(BinaryOrTernaryBuiltInFunction::toDateBuiltInFunction()) = "TO_DATE";

public str prettySnowFlake(BinaryOrTernaryBuiltInFunction::dateBuiltInFunction()) = "DATE";

public str prettySnowFlake(BinaryOrTernaryBuiltInFunction::charIndexBuiltInFunction()) = "CHARINDEX";

public str prettySnowFlake(BinaryOrTernaryBuiltInFunction::replaceBuiltInFunction()) = "REPLACE";

public str prettySnowFlake(BinaryOrTernaryBuiltInFunction::substringBuiltInFunction()) = "SUBSTRING";

public str prettySnowFlake(BinaryOrTernaryBuiltInFunction::substrBuiltInFunction()) = "SUBSTR";

public str prettySnowFlake(BinaryOrTernaryBuiltInFunction::likeBuiltInFunction()) = "LIKE";

public str prettySnowFlake(BinaryOrTernaryBuiltInFunction::ilikeBuiltInFunction()) = "ILIKE";

public str prettySnowFlake(DataType::intAlias(IntAlias intAlias)) = "<prettySnowFlake(intAlias)>";

public str prettySnowFlake(DataType::numberAlias(NumberAlias numberAlias)) = "<prettySnowFlake(numberAlias)>";

public str prettySnowFlake(DataType::floatAlias(FloatAlias floatAlias)) = "<prettySnowFlake(floatAlias)>";

public str prettySnowFlake(DataType::boolDataType()) = "BOOLEAN";

public str prettySnowFlake(DataType::dateDataType()) = "DATE";
public str prettySnowFlake(DataType::varCharAlias(VarCharAlias varCharAlias, list[DataTypeSize] dataTypeSizeList)) = "<prettySnowFlake(varCharAlias)> <for(dataTypeSize <- dataTypeSizeList) {> <prettySnowFlake(dataTypeSize)><}>";

public str prettySnowFlake(DataType::dateTimeDataType(list[DataTypeSize] dataTypeSizeList)) = "DATETIME <for(dataTypeSize <- dataTypeSizeList) {> <prettySnowFlake(dataTypeSize)><}>";

public str prettySnowFlake(DataType::timeDataType(list[DataTypeSize] dataTypeSizeList)) = "TIME <for(dataTypeSize <- dataTypeSizeList) {> <prettySnowFlake(dataTypeSize)><}>";

public str prettySnowFlake(DataType::timeStampDataType(list[DataTypeSize] dataTypeSizeList)) = "TIMESTAMP <for(dataTypeSize <- dataTypeSizeList) {> <prettySnowFlake(dataTypeSize)><}>";

public str prettySnowFlake(DataType::timeStamp_LTZ(list[DataTypeSize] dataTypeSizeList)) = "TIMESTAMP_LTZ <for(dataTypeSize <- dataTypeSizeList) {> <prettySnowFlake(dataTypeSize)><}>";

public str prettySnowFlake(DataType::timeStampLTZ(list[DataTypeSize] dataTypeSizeList)) = "TIMESTAMPLTZ <for(dataTypeSize <- dataTypeSizeList) {> <prettySnowFlake(dataTypeSize)><}>";

public str prettySnowFlake(DataType::timeStamp_NTZ(list[DataTypeSize] dataTypeSizeList)) = "TIMESTAMP_NTZ <for(dataTypeSize <- dataTypeSizeList) {> <prettySnowFlake(dataTypeSize)><}>";

public str prettySnowFlake(DataType::timeStampNTZ(list[DataTypeSize] dataTypeSizeList)) = "TIMESTAMPNTZ <for(dataTypeSize <- dataTypeSizeList) {> <prettySnowFlake(dataTypeSize)><}>";

public str prettySnowFlake(DataType::timeStamp_TZ(list[DataTypeSize] dataTypeSizeList)) = "TIMESTAMP_TZ <for(dataTypeSize <- dataTypeSizeList) {> <prettySnowFlake(dataTypeSize)><}>";

public str prettySnowFlake(DataType::timeStampTZ(list[DataTypeSize] dataTypeSizeList)) = "TIMESTAMPTZ <for(dataTypeSize <- dataTypeSizeList) {> <prettySnowFlake(dataTypeSize)><}>";

public str prettySnowFlake(DataType::charAlias(CharAlias charAlias, list[DataTypeSize] dataTypeSizeList)) = "<prettySnowFlake(charAlias)> <for(dataTypeSize <- dataTypeSizeList) {> <prettySnowFlake(dataTypeSize)><}>";

public str prettySnowFlake(DataType::binaryAlias(BinaryAlias binaryAlias, list[DataTypeSize] dataTypeSizeList)) = "<prettySnowFlake(binaryAlias)> <for(dataTypeSize <- dataTypeSizeList) {> <prettySnowFlake(dataTypeSize)><}>";

public str prettySnowFlake(DataType::variantDataType()) = "VARIANT";

public str prettySnowFlake(DataType::objectDataType()) = "OBJECT";

public str prettySnowFlake(DataType::arrayDataType()) = "ARRAY";

public str prettySnowFlake(DataType::geographyDataType()) = "GEOGRAPHY";

public str prettySnowFlake(DataType::geometryDataType()) = "GEOMETRY";

public str prettySnowFlake(DataTypeList::dataTypeList(list[DataType] dataType)) = "<intercalate(", ", [ prettySnowFlake(dataTypeVal) | dataTypeVal <- dataType ])>";

public str prettySnowFlake(StringList::stringList(list[String] string)) = "<intercalate(", ", [ prettySnowFlake(stringVal) | stringVal <- string ])>";

public str prettySnowFlake(IntAlias::intType()) = "INT";

public str prettySnowFlake(IntAlias::integerType()) = "INTEGER";

public str prettySnowFlake(IntAlias::smallIntType()) = "SMALLINT";

public str prettySnowFlake(IntAlias::tinyIntType()) = "TINYINT";

public str prettySnowFlake(IntAlias::byteIntType()) = "BYTEINT";

public str prettySnowFlake(IntAlias::bigIntType()) = "BIGINT";

public str prettySnowFlake(NumberAlias::numberType(list[ListOfIntWithBracket] listOfIntWithBracket)) = "NUMBER <for(intWithBracket <- listOfIntWithBracket) {> <prettySnowFlake(intWithBracket)><}>";

public str prettySnowFlake(NumberAlias::numericType(list[ListOfIntWithBracket] listOfIntWithBracket)) = "NUMERIC <for(intWithBracket <- listOfIntWithBracket) {> <prettySnowFlake(intWithBracket)><}>";

public str prettySnowFlake(NumberAlias::decimalType(list[ListOfIntWithBracket] listOfIntWithBracket)) = "DECIMAL <for(intWithBracket <- listOfIntWithBracket) {> <prettySnowFlake(intWithBracket)><}>";

public str prettySnowFlake(ListOfIntWithBracket::listOfIntWithBracket(list[str] integer)) = "( <intercalate(", ", [ <intVal> | intVal <- integer ])> )";

public str prettySnowFlake(FloatAlias::floatType()) = "FLOAT";

public str prettySnowFlake(FloatAlias::float4Type()) = "FLOAT4";

public str prettySnowFlake(FloatAlias::float8Type()) = "FLOAT8";

public str prettySnowFlake(FloatAlias::doubleType()) = "DOUBLE";

public str prettySnowFlake(FloatAlias::doublePrecisionType()) = "DOUBLE PRECISION";

public str prettySnowFlake(FloatAlias::realType()) = "REAL";

public str prettySnowFlake(VarCharAlias::charVarying()) = "CHAR VARYING";

public str prettySnowFlake(VarCharAlias::ncharVarying()) = "NCHAR VARYING";

public str prettySnowFlake(VarCharAlias::nvarchar2()) = "NVARCHAR2";

public str prettySnowFlake(VarCharAlias::nvarchar()) = "NVARCHAR";

public str prettySnowFlake(VarCharAlias::stringVarChar()) = "STRING";

public str prettySnowFlake(VarCharAlias::textVarChar()) = "TEXT";

public str prettySnowFlake(VarCharAlias::varChar()) = "VARCHAR";

public str prettySnowFlake(DataTypeSize::dataTypeSize(str integer)) = "( <integer> )";

public str prettySnowFlake(CharAlias::charType()) = "CHAR";

public str prettySnowFlake(CharAlias::ncharType()) = "NCHAR";

public str prettySnowFlake(CharAlias::characterType()) = "CHARACTER";

public str prettySnowFlake(BinaryAlias::binaryType()) = "BINARY";

public str prettySnowFlake(BinaryAlias::varBinaryType()) = "VARBINARY";

public str prettySnowFlake(TryCastExp::tryCastExpression(Exp exp, DataType dataType)) = "TRY_CAST( <prettySnowFlake(exp)> AS <prettySnowFlake(dataType)> )";

public str prettySnowFlake(LikeIlike::like()) = "LIKE";

public str prettySnowFlake(LikeIlike::ilike()) = "ILIKE";

public str prettySnowFlake(EscapeExp::escapeExp(Exp exp)) = "ESCAPE <prettySnowFlake(exp)>";

public str prettySnowFlake(NullNotNull::nullNotNull()) = "NOT NULL";

public str prettySnowFlake(NullNotNull::nullNotNullNoNot()) = "NULL";

public str prettySnowFlake(CaseExpression::caseSwitchSection(Exp exp, list[SwitchSection] switchSectionList, list[ElseExp] elseExpList)) = "CASE <prettySnowFlake(exp)> <for(switchSection <- switchSectionList) {> <prettySnowFlake(switchSection)> <}> <for(elseExp <- elseExpList) {><prettySnowFlake(elseExp)><}> END";

public str prettySnowFlake(CaseExpression::caseSwitchSearchCondition(list[SwitchSearchConditionSection] switchSearchConditionSectionList, list[ElseExp] elseExpList)) = "CASE <for(switchSearchConditionSection <- switchSearchConditionSectionList) {> <prettySnowFlake(switchSearchConditionSection)> <}> <for(elseExp <- elseExpList) {><prettySnowFlake(elseExp)><}> END";

public str prettySnowFlake(SwitchSection::switchSection(Exp exp1, Exp exp2)) = "WHEN <prettySnowFlake(exp1)> THEN <prettySnowFlake(exp2)>";

public str prettySnowFlake(ElseExp::elseExp(Exp exp)) = "ELSE <prettySnowFlake(exp)>";

public str prettySnowFlake(SwitchSearchConditionSection::switchSearchConditionSection(SearchCondition searchCondition, Exp exp)) = "WHEN <prettySnowFlake(searchCondition)> THEN <prettySnowFlake(exp)>";

public str prettySnowFlake(IffExp::iffExpression(SearchCondition searchCondition, Exp exp1, Exp exp2)) = "IFF ( <prettySnowFlake(searchCondition)>, <prettySnowFlake(exp1)>, <prettySnowFlake(exp2)> )";

public str prettySnowFlake(ArrayLiteral::arrayExpList(ExpList expList)) = "[ <prettySnowFlake(expList)> ]";

public str prettySnowFlake(ArrayLiteral::emptyArray()) = "[]";

public str prettySnowFlake(JsonLiteral::jsonKvPair(list[KvPair] kvPair)) = "{ <intercalate(", ", [ prettySnowFlake(kv) | kv <- kvPair ])> }";

public str prettySnowFlake(JsonLiteral::emptyJson()) = "{}";

public str prettySnowFlake(KvPair::kvPair(String string, Exp exp)) = "<prettySnowFlake(string)>:<prettySnowFlake(exp)>";

public str prettySnowFlake(TrimExpression::trimExpression(TrimType trimType, Exp exp, list[CommaString] commaStringList)) = "<prettySnowFlake(trimType)> ( <prettySnowFlake(exp)> <for(commaString <- commaStringList) {> <prettySnowFlake(commaString)> <}>)";

public str prettySnowFlake(TrimType::trimType()) = "TRIM";

public str prettySnowFlake(TrimType::ltrimType()) = "LTRIM";

public str prettySnowFlake(TrimType::rtrimType()) = "RTRIM";
