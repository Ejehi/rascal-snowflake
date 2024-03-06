module grammar::Test

import ast::SnowFlake;

import grammar::SnowFlake;

import ParseTree;

bool parseAndImplode(loc code) {
  code_pt = parse(#start[SnowFlakeBatch], code);
  code_ast = implode(#SnowFlakeBatch, code_pt);
  return true;
}

test bool testSelect() {
  loc file = |project://snowflake/examples/dml.sql|;
  return parseAndImplode(file);
}
