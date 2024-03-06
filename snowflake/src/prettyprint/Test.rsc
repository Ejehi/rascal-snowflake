module prettyprint::Test

import prettyprint::SnowFlake;

import ast::SnowFlake;

import grammar::SnowFlake;

import ParseTree;
import IO;
import Prelude;

bool prettyCond(loc file) {
    ast = implode(#SnowFlakeBatch, parse(#start[SnowFlakeBatch], file));
    x = implode(#SnowFlakeBatch, parse(#start[SnowFlakeBatch], prettySnowFlake(ast)));
    return ast := x;
}

test bool testCTE() {
  loc cte = |project://snowflake/examples/other.sql|;
  return prettyCond(cte);
}
