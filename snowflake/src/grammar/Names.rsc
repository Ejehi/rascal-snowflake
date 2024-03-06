module grammar::Names

extend grammar::Layout;

extend grammar::Literals;

syntax Identifier = unquotedId: UnQuotedIdentifier
                    | quotedId: QuotedIdentifier
                    ;

lexical UnQuotedIdentifier = ([a-z A-Z _] !<< [a-z A-Z _] [a-z A-Z 0-9 _ @ $]* !>> [a-z A-Z 0-9 _ $]) \ Keyword;

lexical QuotedIdentifier = [\"] StringCharacter* [\"];

lexical WhIdentifier = ([a-z A-Z _] !<< "$" [a-z A-Z _] [a-z A-Z 0-9 _]* !>> [a-z A-Z 0-9 _]) \ Keyword;

syntax ObjectColumnNameOrIdentifier = objectColumnNameOrIdentifier: {Identifier "."}+;

keyword Keyword = 'DISTINCT'
                | 'UNION'
                | 'EXCEPT'
                | 'MINUS'
                | 'OVER'
                | 'LISTAGG'
                | 'ARRAY_AGG'
                | 'LEAD'
                | 'LAG'
                | 'TRUE'
                | 'FALSE'
                | 'FIRST'
                | 'LAST'
                | 'CONCAT'
                | 'CONCAT_WS'
                | 'COALESCE'
                | 'IFNULL' 
                | 'NVL'
                | 'GET'
                | 'LEFT'
                | 'RIGHT'
                | 'DATE_PART'
                | 'SPLIT'
                | 'NULLIF'
                | 'EQUAL_NULL'
                | 'CONTAINS'
                | 'COLLATE'
                | 'TO_DATE'
                | 'DATE'
                | 'CHARINDEX'
                | 'REPLACE'
                | 'SUBSTRING' 
                | 'SUBSTR'
                | 'LIKE' 
                | 'ILIKE'
                | 'NULL'
                | 'OR'
                | 'NOT'
                | 'ALL'
                | 'AND'
                | 'THEN'
                | 'ACCOUNT'
                | 'DATABASE'
                | 'TABLE'
                | 'SCHEMA'
                | 'VIEW'
                | 'IFF'
                | 'TRIM'
                | 'CAST'
                | 'LTRIM'
                | 'RTRIM'
                | 'INNER'
                ;