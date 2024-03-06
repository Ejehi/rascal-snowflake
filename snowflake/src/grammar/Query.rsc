module grammar::Query

extend grammar::Expressions;

syntax Exp = subQuery: Query;

syntax Query =  query: WithExpression? SelectStatement SetOperators*;


syntax WithExpression = withExpression: 'WITH' { CommonTableExpression "," }+;

syntax CommonTableExpression = cte: Identifier ColumnListWithBrackets? 'AS' "(" SelectStatement SetOperators* ")";


syntax SelectStatement = selectWithLimit: SelectClause SelectOptionalClauses LimitClause?
                        | selectWithTop: SelectTopClause SelectOptionalClauses //TOP and LIMIT are not allowed together
                        ;

syntax SetOperators = unionSelectStmt: 'UNION' 'ALL' SelectStatement
                    | bracketSelectStmt: "(" SelectStatement ")"
                    | unionSelectStmtNoAll: 'UNION' SelectStatement
                    | exceptSelectStmt: 'EXCEPT' SelectStatement
                    | minusSelectStmt: 'MINUS' SelectStatement
                    | intersectSelectStmt: 'INTERSECT' SelectStatement
                    ;

syntax SelectClause = selectClause: 'SELECT' SelectListNoTop;

syntax SelectListNoTop = selectNoTop: AllDistinct? SelectList;

syntax SelectList = selectList: {SelectListElem ","}+;

syntax SelectListElem = columnElem: ColumnElem;

syntax SelectOptionalClauses = selectOptionalClause: IntoClause? FromClause? WhereClause? GroupByClause? QualifyClause? OrderByClause?;

syntax IntoClause =  intoClause: 'INTO' VarList;

syntax OuterJoin = leftOuter: 'LEFT' 'OUTER'
                    | leftNoOuter: 'LEFT'
                    | rightOuter: 'RIGHT' 'OUTER'
                    | rightNoOuter: 'RIGHT'
                    | fullOuter: 'FULL' 'OUTER'
                    | fullNoOuter: 'FULL'
                    ;

syntax JoinType = innerJoin: 'INNER'
                    | outerJoin: OuterJoin
                    ;

syntax MatchRecognize = matchRecognize: 'MATCH_RECOGNIZE' "(" PartitionBy? OrderItem? Measures? RowMatch? AfterMatch? Pattern? Define? ")";

syntax Measures = measures: 'MEASURES' ExpAsAliasList;


syntax RowMatch = oneRow: 'ONE' 'ROW' 'PER' 'MATCH' MatchOptions?
                    | allRows: 'ALL' 'ROWS' 'PER' 'MATCH' MatchOptions?
                    ;

syntax MatchOptions = showEmpty: 'SHOW' 'EMPTY' 'MATCHES' 
                    | omitEmpty: 'OMIT' 'EMPTY' 'MATCHES' 
                    | unmatchedRows: 'WITH' 'UNMATCHED' 'ROWS'
                    ;

syntax AfterMatch = afterMatchLast: 'AFTER' 'MATCH' 'SKIP' 'PAST' 'LAST' 'ROW'
                    | afterMatchNext: 'AFTER' 'MATCH' 'SKIP' 'TO' 'NEXT' 'ROW'
                    | aftermatchSymbol: 'AFTER' 'MATCH' 'SKIP' 'TO' FirstOrLast? Symbol
                    ;

syntax Symbol = symbol: 'SYMBOL'; // - Dummy Reference

syntax Pattern = pattern: 'PATTERN' "=" String;

syntax Define = define: 'DEFINE' SymbolList;

syntax SymbolList = symbolList: {SymbolAsExp ","}+;

syntax SymbolAsExp = symbolAsExp: Symbol 'AS' Exp;

syntax PivotUnpivot = pivot: 'PIVOT' "(" Identifier "(" Identifier ")" 'FOR' Identifier 'IN' "(" {Literal ","}+ ")" ")"
                    | unpivot: 'UNPIVOT' "(" Identifier 'FOR' ObjectColumnNameOrIdentifier 'IN' "(" ColumnList ")" ")"
                    ;

syntax AsColumnList = asColumnList: AsAlias ColumnAliasList?;

syntax ColumnAliasList = columnAliasList: "(" {Identifier ","}+ ")";


syntax Sample = sample: 'SAMPLE' SampleMethod? SampleOpts
                | tableSample: 'TABLESAMPLE' SampleMethod? SampleOpts
                ;


syntax SampleMethod = rowSamplMethod: RowSampling
                    | blockSampleMethod: BlockSampling
                    ;

syntax RowSampling = bernoulliSampling: 'BERNOULLI'
                    | rowSampling: 'ROW'
                    ;

syntax BlockSampling = systemSampling: 'SYSTEM' 
                        | blockSampling: 'BLOCK'
                        ;


syntax SampleOpts = sampleOpts: "(" Int 'ROWS' ")" RepeatableSeed?
                    | sampleOptNoRows: "(" Int ")" RepeatableSeed?
                    ;

syntax RepeatableSeed = repeatableSeed1: 'REPEATABLE' "(" Int ")"
                        | repeatableSeed2: 'SEED'  "(" Int ")"
                        ;


syntax PriorList = priorList: {PriorItem ","}+;

syntax PriorItem = priorItemPriorEq: 'PRIOR' Identifier "=" Identifier
                    | priorItemPriorEqPrior: 'PRIOR' Identifier "=" 'PRIOR' Identifier
                    | priorItemNoPrior: Identifier "=" Identifier
                    | priorItemEqPrior: Identifier "=" 'PRIOR' Identifier
                    ;

syntax ValuesTable = valuesTableWithoutParenthesis: ValuesBuilder AsColumnAlias?
                    | valuesTableWithParenthesis: "(" ValuesBuilder ")" AsColumnAlias?
                    ;

syntax ValuesBuilder = valuesBuilder: 'VALUES' { ExpListWithBrackets ","}+;

syntax AsColumnAlias = asColumnAlias: AsAlias ColumnAliasList?;

syntax FlattenTable = flattenTable: 'FLATTEN' "(" InputAssociation? Exp CommaFlattenTableOpt* ")";

syntax InputAssociation = inputAssociation: 'INPUT' "=\>";

syntax CommaFlattenTableOpt = commaFlattenTableOpt: "," FlattenTableOpt;

syntax FlattenTableOpt = pathAssoc: 'PATH' "=\>" String
                            | outerAssoc: 'OUTER' "=\>" Boolean
                            | recursiveAssoc: 'RECURSIVE' "=\>" Boolean
                            | modeAssocArray: 'MODE' "=\>" '\'ARRAY\'' 
                            | modeAssocObj: 'MODE' "=\>" '\'OBJECT\''
                            | modeAssocBoth: 'MODE' "=\>" '\'BOTH\''
                            ;

syntax SplitedTable = splitedTable: 'SPLIT_TO_TABLE' ExpListWithBrackets;

syntax WhereClause = whereClause: 'WHERE' SearchCondition;

syntax GroupByClause = groupByHaving: 'GROUP' 'BY' ExpList HavingClause?
                        | groupByCube: 'GROUP' 'BY' 'CUBE' ExpListWithBrackets
                        | groupBySets: 'GROUP' 'BY' 'GROUPING' 'SETS' ExpListWithBrackets
                        | groupByRollup: 'GROUP' 'BY' 'ROLLUP' ExpListWithBrackets
                        | groupByAll: 'GROUP' 'BY' 'ALL'
                        ;

syntax HavingClause = havingClause: 'HAVING' SearchCondition;

syntax QualifyClause = qualifyClause: 'QUALIFY' Exp;

syntax LimitClause = limitNoFetch: 'LIMIT' Int OffsetInt?
                    | limitWithFetch: OffsetInt? RowRows? 'FETCH' FirstNext? Int RowRows? 'ONLY'
                    ;

syntax OffsetInt = offsetInt: 'OFFSET' Int;

syntax RowRows = row: 'ROW' 
                | rows: 'ROWS'
                ;

syntax FirstNext = first: 'FIRST' 
                    | next: 'NEXT'
                    ;

syntax SelectTopClause = selectTopClause: 'SELECT' SelectListTop;

syntax SelectListTop = selectListTop: AllDistinct? TopClause SelectList;

syntax TopClause = topClause: 'TOP' Int;

syntax FromClause = fromClause: 'FROM' TableSources;

syntax TableSources = tableSources: {TableSource ","}+;

syntax TableSource = itemJoined: TableSourceItemJoined;

syntax TableSourceItemJoined = objectRefJoinClause: ObjectRef JoinClause*
                                | bracketTableItemJoined: "(" TableSourceItemJoined ")" JoinClause*
                                ;

syntax ObjectRef = objectRefMatch: ObjectColumnNameOrIdentifier AtBefore? Changes?  MatchRecognize? PivotUnpivot? AsColumnList? Sample?
                    | objectRefConnect: ObjectColumnNameOrIdentifier 'START' 'WITH' Exp 'CONNECT' 'BY' PriorList?
                    | objectRefFuncCall: 'TABLE' "(" FunctionCall ")" PivotUnpivot? AsAlias? Sample?
                    | objectRefValuesTable: ValuesTable Sample?
                    | objectRefLateralSubQuery: 'LATERAL' "(" Query ")" PivotUnpivot? AsAlias?
                    | objectRefNoLateralSubQuery: "(" Query ")" PivotUnpivot? AsAlias?
                    | objectRefLateralFlatten: 'LATERAL' FlattenTable AsAlias?
                    | objectRefLateralSplitted: 'LATERAL' SplitedTable AsAlias?
                    ;

syntax JoinClause = joinOnSearch: JoinType? 'JOIN' ObjectRef OnSearchCondition?
                    | joinUsingColumn: JoinType? 'JOIN' ObjectRef UsingColumnList?
                    | joinNatural: 'NATURAL' OuterJoin? 'JOIN' ObjectRef
                    | joinCross: 'CROSS' 'JOIN' ObjectRef
                    ;