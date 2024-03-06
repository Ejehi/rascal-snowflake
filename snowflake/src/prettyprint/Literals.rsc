module prettyprint::Literals

import ast::SnowFlake;

import String;

public str prettySnowFlake(Literal::number(Number number)) = "<prettySnowFlake(number)>";

public str prettySnowFlake(Literal::stringLit(String stringVal)) = "<prettySnowFlake(stringVal)>";

public str prettySnowFlake(Literal::boolean(Boolean boolVal)) = "<prettySnowFlake(boolVal)>";

public str prettySnowFlake(Number::integer(str integer)) = "<integer>";

public str prettySnowFlake(Number::float(str floatingPoint)) = "<floatingPoint>";

public str prettySnowFlake(Boolean::boolTrue()) = "TRUE";

public str prettySnowFlake(Boolean::boolFalse()) = "FALSE";

public str prettySnowFlake(String::string(str stringConstant)) = "<stringConstant>";
