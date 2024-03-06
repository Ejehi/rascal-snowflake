module grammar::Layout


lexical COMMENT_LIT 
	= @category="COMMENT_LIT" "--" ![\n]* $
	| @category="COMMENT_LIT" "//" ![\n]* $
	;

layout Standard 
  = WhitespaceOrComment* !>> [\u0009-\u000D \u0020 \u0085 \u00A0 \u1680 \u180E \u2000-\u200A \u2028 \u2029 \u202F \u205F \u3000] !>> "//";
  
lexical WhitespaceOrComment 
  = whitespace: Whitespace
  | comment_lit: COMMENT_LIT
  ; 

lexical Whitespace
	= [\u0009-\u000D \u0020 \u0085 \u00A0 \u1680 \u180E \u2000-\u200A \u2028 \u2029 \u202F \u205F \u3000]
  ; 