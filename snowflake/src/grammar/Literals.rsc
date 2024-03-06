module grammar::Literals

lexical Int = @category="Constant"  [0-9] !<< [0-9]+ !>> [0-9];

lexical FloatingPoint = [\-]? [0-9]+ "." [0-9]* !>> [0-9];

syntax Literal
            = number: Number
            | stringLit: String
            | boolean: Boolean
            ;

syntax Number
            = integer: Int
            | float: FloatingPoint
            ;

syntax Boolean
            = boolTrue: 'TRUE'
            | boolFalse: 'FALSE'
            ;

lexical CharacterLiteral = @category="Constant"  [\'] SingleQuoteStringCharacter [\'];

syntax String = string: StringConstant;

lexical StringConstant = @category="Constant" "$$" DollarStringCharacter* "$$"
                        | @category="Constant" [\'] SingleQuoteStringCharacter* [\']
                        ;


lexical HexString = [A-Za-z0-9|.] [A-Za-z0-9+\-|.]*;

lexical Uri = HexString DivideHexString*
            | HexString DivideHexString* "/"
            ;

lexical WindowsPath = [A-Z] ":" BackSlashHexString*
                    | [A-Z] ":" BackSlashHexString* "\\"
                    ;

lexical BackSlashHexString = backSlashHexString: "\\" HexString;

lexical DivideHexString = divideHexString: "/" HexString;

lexical StringCharacter = "\\" [\" \\ b f n r t] 
                        | UnicodeEscape 
                        | ![\" \\]
                        | [\n][\ \t \u00A0 \u1680 \u2000-\u200A \u202F \u205F \u3000]* [\'] // margin 
                        | "\\" Int
                        ;

lexical DollarStringCharacter = ![$]  | "\\$" | "$" ![$];
                        
lexical SingleQuoteStringCharacter = "\\" [\' \\ b f n r t] 
                                    | UnicodeEscape 
                                    | ![\' \\]
                                    | [\n][\ \t \u00A0 \u1680 \u2000-\u200A \u202F \u205F \u3000]* [\'] // margin 
                                    | "\\" Int
                                    ; 

lexical UnicodeEscape   = utf16: "\\" [u] [0-9 A-F a-f] [0-9 A-F a-f] [0-9 A-F a-f] [0-9 A-F a-f] 
                        | utf32: "\\" [U] (("0" [0-9 A-F a-f]) | "10") [0-9 A-F a-f] [0-9 A-F a-f] [0-9 A-F a-f] [0-9 A-F a-f] // 24 bits 
                        | ascii: "\\" [a] [0-7] [0-9A-Fa-f]
                        ;