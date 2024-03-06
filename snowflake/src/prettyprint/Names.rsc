module prettyprint::Names

import ast::SnowFlake;

extend prettyprint::Literals;

import List;


public str prettySnowFlake(Identifier::unquotedId(str unquotId)) = "<unquotId>";

public str prettySnowFlake(Identifier::quotedId(str quotId)) = "<quotId>";

public str prettySnowFlake(ObjectColumnNameOrIdentifier::objectColumnNameOrIdentifier(list[Identifier] idList)) = "<intercalate(".", [ prettySnowFlake(idListVal) | idListVal <- idList ])>";
