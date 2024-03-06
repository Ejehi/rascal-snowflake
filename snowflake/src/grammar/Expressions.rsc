module grammar::Expressions

extend grammar::Names;

syntax Exp = primitiveExp: PrimitiveExp
            | bracketExp: "(" Exp ")"
            > minExp: "-" Exp
            > plusExp: "+" Exp
            > functionCallExp: FunctionCall
            > arrayAccess: Exp "[" Exp "]" //array access
            > arrayExp: ArrayLiteral
            > left jsonAccess: Exp ":" Exp //json access
            > jsonLiteral: JsonLiteral
            > expCollateString: Exp Collate
            > castExp: Exp "::" DataType //cast
            > overClauseExp: Exp OverClause
            > castExpr: 'CAST' "(" Exp 'AS' DataType ")"
            > tryCastExp: TryCastExp
            > caseExp: CaseExpression
            > trimExp: TrimExpression
            > iffExp: IffExp
            > left expIsNullNotNull: Exp 'IS' NullNotNull
            > left expBetween: Exp 'BETWEEN' Exp //and is already an expression
            > left expNotBetween: Exp 'NOT' 'BETWEEN' Exp 
            > left expNotInList: Exp 'NOT' 'IN' "(" ExpList ")"
            > left expNotInListNoNot: Exp 'IN' "(" ExpList ")"
            > left expNotIlikeEscape: Exp 'NOT' LikeIlike Exp EscapeExp?
            > left expNotIlikeEscapeNoNot: Exp LikeIlike Exp EscapeExp?
            > left expNotRlikeNoNot: Exp 'RLIKE' Exp
            > left expNotRlike: Exp 'NOT' 'RLIKE' Exp
            > left mul: Exp lhs "*" Exp rhs
            > non-assoc div: Exp lhs "/" Exp rhs
            > non-assoc modulus: Exp lhs "%" Exp rhs
            > left sub: Exp lhs "-" Exp rhs
            > left add: Exp lhs "+" Exp rhs
            > non-assoc eq: Exp lhs "=" Exp rhs
            > non-assoc gt: Exp lhs "\>" Exp rhs
            > non-assoc lt: Exp lhs "\<" Exp rhs
            > non-assoc gte: Exp lhs "\>=" Exp rhs
            > non-assoc lte: Exp lhs "\<=" Exp rhs
            > non-assoc neq1: Exp lhs "!=" Exp rhs
            > non-assoc neq2: Exp lhs "\<\>" Exp rhs
            > right not: 'NOT' Exp
            > left doublePipe: Exp lhs "||" Exp rhs
            > left and: Exp lhs 'AND' Exp rhs
            > left or: Exp lhs 'OR' Exp rhs
            ;


syntax PrimitiveExp = literal: Literal
                    | defaultVal: 'DEFAULT'
                    | nullExp: 'NULL'
                    | objectColId: ObjectColumnNameOrIdentifier
                    ;

syntax Collate = collateString: 'COLLATE' String;

syntax ColumnListWithBrackets = colListWithBrackets: "(" ColumnList ")";

syntax ColumnList = columnList: {ObjectColumnNameOrIdentifier ","}+;


syntax AllDistinct =  allNoDistinct: 'ALL' 
                    | distinct: 'DISTINCT';


syntax ColumnElem = objectNameStar: ObjectNameDot? "*"
                    | objectNameColName: Exp AsAlias?
                    | objectNameColPosition: ObjectNameDot? "$" Int AsAlias?
                    ;

syntax ObjectNameDot = objectNameDot: ObjectColumnNameOrIdentifier ".";


syntax AsAlias = asAlias: 'AS' Identifier
                | asAliasNoAs: Identifier
                ;

syntax VarList = varList: {Variable ","}+;

syntax Variable = variable: ":" Identifier;

syntax OnSearchCondition = onSearchCondition: 'ON' SearchCondition;

syntax SearchCondition = searchCondition: Exp;

syntax UsingColumnList = usingColumnList: 'USING' "(" ColumnList ")";

syntax AtBefore = atTimeStamp: 'AT' "(" 'TIMESTAMP' "=\>" Exp ")"
                | atOffset: 'AT' "(" 'OFFSET' "=\>" Exp ")"
                | atStatement: 'AT' "(" 'STATEMENT' "=\>" String ")"
                | atStream: 'AT' "(" 'STREAM' "=\>" String ")"
                | beforeStatement: 'BEFORE' "(" 'STATEMENT' "=\>" String ")"
                ;

syntax Changes = changes: 'CHANGES' "(" 'INFORMATION' "=\>" DefaultAppendOnly ")" AtBefore End?;


syntax DefaultAppendOnly = defaultNoAppendOnly: 'DEFAULT'
                           | appendOnly: 'APPEND' 'ONLY'
                            ;

syntax End = endTimeStampString: 'END' "(" 'TIMESTAMP' "-\>" String ")"
            | endOffset: 'END' "(" 'OFFSET' "-\>" String ")"
            | endStatement: 'END' "(" 'STATEMENT' "-\>" Identifier ")"
            ;
            
syntax PartitionBy = partitionBy: 'PARTITION' 'BY' ExpList;

syntax ExpList = expList: {Exp ","}+;


syntax AsOrDesc = asc: 'ASC' 
                | desc: 'DESC'
                ;

syntax ExpAsAlias = expAsAlias: Exp AsAlias;

syntax ExpAsAliasList = expAsAliasList: {ExpAsAlias ","}+;

syntax OverClause = overPartitionBy: 'OVER' "(" PartitionBy OrderByClause? ")"
                    | overOrderBy: 'OVER' "(" OrderByClause ")"
                    ;

syntax OrderByClause = orderByClause: 'ORDER' 'BY' {OrderItem ","}+;

syntax OrderItem = orderItem: Exp AsOrDesc? NullsFirstOrLast?;

syntax NullsFirstOrLast = nullsFirstOrLast: 'NULLS' FirstOrLast;

syntax FirstOrLast = firstOrLast1: 'FIRST' 
                    | firstOrLast2: 'LAST'
                    ;

syntax CommaString = commaString: "," String;

syntax WithinGroupOrder = withinGroupOrder: 'WITHIN' 'GROUP' "(" OrderByClause ")";

syntax IgnoreOrRepectNulls = ignoreOrRepectNulls: IgnoreOrRespect 'NULLS';

syntax IgnoreOrRespect = ignore: 'IGNORE' 
                        | respect: 'RESPECT'
                        ;

syntax FirstValueOrLastValue = firstValue: 'FIRST_VALUE' 
                                | lastValue: 'LAST_VALUE'
                                ;

syntax ExpListWithBrackets = expListWithBrackets: "(" ExpList ")";

syntax FunctionCall = rankingWindowedFunc: RankingWindowedFunction
                    | aggregateFunc: AggregateFunction
                    | listOpFunc: ListOperator "(" ExpList ")"
                    | binaryOrTernaryBuiltInFunc: BinaryOrTernaryBuiltInFunction "(" ExpList ")"
                    ;

syntax RankingWindowedFunction = rankDenseRowNumberFunc: RankDenseRowNumber "("")" OverClause
                                | ntileFunc: 'NTILE' "(" Exp ")" OverClause
                                | leadOrLagFunc: LeadOrLag "(" ExpList? ")" IgnoreOrRepectNulls? OverClause
                                | firstValueOrLastValueFunc: FirstValueOrLastValue "(" Exp ")" IgnoreOrRepectNulls? OverClause
                                ;

syntax RankDenseRowNumber = rank: 'RANK' 
                            | denseRank: 'DENSE_RANK'
                            | rowNumber: 'ROW_NUMBER'
                            ;

syntax LeadOrLag = lead: 'LEAD'
                | lag: 'LAG'
                ;

syntax AggregateFunction = idDistinct: ObjectColumnNameOrIdentifier "(" 'DISTINCT' ExpList? ")"
                            | idStar: ObjectColumnNameOrIdentifier "(" "*" ")"
                            | idNoDistinct: ObjectColumnNameOrIdentifier "(" ExpList? ")"
                            | listOrArrayAggNoDistinct: ListAggOrArrayAgg "(" Exp CommaString? ")" WithinGroupOrder?
                            | listOrArrayAgg: ListAggOrArrayAgg "(" 'DISTINCT' Exp CommaString? ")" WithinGroupOrder?
                            ;

syntax ListAggOrArrayAgg = listAgg: 'LISTAGG'
                            | arrayAgg: 'ARRAY_AGG'
                            ;


syntax ListOperator = concat: 'CONCAT'
                        | concatWS: 'CONCAT_WS'
                        | coalesce: 'COALESCE'
                        ;

syntax IdentifierType = identifierTypeOpt1: BinaryOrTernaryBuiltInFunction
                        | identifierTypeOpt2: ObjectColumnNameOrIdentifier
                        ;

syntax BinaryOrTernaryBuiltInFunction = ifNullBuiltInFunction: 'IFNULL' 
                                | nvlBuiltInFunction: 'NVL'
                                | getBuiltInFunction: 'GET'
                                | leftBuiltInFunction: 'LEFT'
                                | rightBuiltInFunction: 'RIGHT'
                                | datePartBuiltInFunction: 'DATE_PART'
                                | splitBuiltInFunction: 'SPLIT'
                                | nullIfBuiltInFunction: 'NULLIF'
                                | equalNullBuiltInFunction: 'EQUAL_NULL'
                                | containsBuiltInFunction: 'CONTAINS'
                                | collateBuiltInFunction: 'COLLATE'
                                | toDateBuiltInFunction: 'TO_DATE'
                                | dateBuiltInFunction: 'DATE'
                                | charIndexBuiltInFunction: 'CHARINDEX'
                                | replaceBuiltInFunction: 'REPLACE'
                                | substringBuiltInFunction: 'SUBSTRING' 
                                | substrBuiltInFunction: 'SUBSTR'
                                | likeBuiltInFunction: 'LIKE' 
                                | ilikeBuiltInFunction: 'ILIKE'
                                ;

syntax DataType = intAlias: IntAlias
                | numberAlias: NumberAlias
                | floatAlias: FloatAlias
                | boolDataType: 'BOOLEAN'
                | dateDataType: 'DATE'
                | varCharAlias: VarCharAlias DataTypeSize?
                | dateTimeDataType: 'DATETIME' DataTypeSize?
                | timeDataType: 'TIME' DataTypeSize?
                | timeStampDataType: 'TIMESTAMP' DataTypeSize?
                | timeStamp_LTZ: 'TIMESTAMP_LTZ' DataTypeSize?
                | timeStampLTZ: 'TIMESTAMPLTZ' DataTypeSize?
                | timeStamp_NTZ: 'TIMESTAMP_NTZ' DataTypeSize?
                | timeStampNTZ: 'TIMESTAMPNTZ' DataTypeSize?
                | timeStamp_TZ: 'TIMESTAMP_TZ' DataTypeSize?
                | timeStampTZ: 'TIMESTAMPTZ' DataTypeSize?
                | charAlias: CharAlias DataTypeSize?
                | binaryAlias: BinaryAlias DataTypeSize?
                | variantDataType: 'VARIANT'
                | objectDataType: 'OBJECT'
                | arrayDataType: 'ARRAY'
                | geographyDataType: 'GEOGRAPHY'
                | geometryDataType: 'GEOMETRY'
                ;

syntax DataTypeList = dataTypeList: { DataType ","}+;

syntax StringList = stringList: { String "," }+;

syntax IntAlias = intType: 'INT'
                | integerType: 'INTEGER'
                | smallIntType: 'SMALLINT'
                | tinyIntType: 'TINYINT'
                | byteIntType: 'BYTEINT'
                | bigIntType: 'BIGINT'
                ;

syntax NumberAlias = numberType: 'NUMBER' ListOfIntWithBracket?
                    | numericType: 'NUMERIC' ListOfIntWithBracket?
                    | decimalType: 'DECIMAL' ListOfIntWithBracket?
                    ;

syntax ListOfIntWithBracket = listOfIntWithBracket: "(" {Int ","}+ ")";


syntax FloatAlias = floatType: 'FLOAT'
                    | float4Type: 'FLOAT4' 
                    | float8Type: 'FLOAT8' 
                    | doubleType: 'DOUBLE' 
                    | doublePrecisionType: 'DOUBLE' 'PRECISION' 
                    | realType: 'REAL'
                    ;

syntax VarCharAlias = charVarying: 'CHAR' 'VARYING' 
                    | ncharVarying: 'NCHAR' 'VARYING'
                    | nvarchar2: 'NVARCHAR2'
                    | nvarchar: 'NVARCHAR' 
                    | stringVarChar: 'STRING'
                    | textVarChar: 'TEXT'
                    | varChar: 'VARCHAR';

syntax DataTypeSize = dataTypeSize: "(" Int ")";

syntax CharAlias = charType: 'CHAR'
                    | ncharType: 'NCHAR'
                    | characterType: 'CHARACTER'
                    ;

syntax BinaryAlias = binaryType: 'BINARY'
                    | varBinaryType: 'VARBINARY'
                    ;

syntax TryCastExp = tryCastExpression: 'TRY_CAST' "(" Exp 'AS' DataType ")";

syntax LikeIlike = like: 'LIKE' 
                    | ilike: 'ILIKE'
                    ;

syntax EscapeExp = escapeExp: 'ESCAPE' Exp;

syntax NullNotNull = nullNotNull: 'NOT' 'NULL'
                    | nullNotNullNoNot: 'NULL'
                    ;

syntax CaseExpression = caseSwitchSection: 'CASE' Exp SwitchSection+ ElseExp? 'END'
                        | caseSwitchSearchCondition: 'CASE' SwitchSearchConditionSection+ ElseExp? 'END'
                        ;

syntax SwitchSection = switchSection: 'WHEN' Exp 'THEN' Exp;

syntax ElseExp = elseExp: 'ELSE' Exp;

syntax SwitchSearchConditionSection = switchSearchConditionSection: 'WHEN' SearchCondition 'THEN' Exp;

syntax IffExp = iffExpression: 'IFF' "(" SearchCondition "," Exp "," Exp ")";

syntax ArrayLiteral = arrayExpList: "[" ExpList "]"
                    | emptyArray: "[" "]"
                    ;

syntax JsonLiteral = jsonKvPair: "{" {KvPair ","}+ "}"
                    | emptyJson: "{" "}"
                    ;

syntax KvPair = kvPair: String ":" Exp;

syntax TrimExpression = trimExpression: TrimType "(" Exp CommaString* ")";

syntax TrimType = trimType: 'TRIM'
                | ltrimType: 'LTRIM' 
                | rtrimType: 'RTRIM'
                ; 