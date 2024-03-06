module LanguageServer

import ParseTree;

import analysis::typepal::TypePal;
import util::Reflective;
import util::LanguageServer;
import ast::SnowFlake;
import grammar::SnowFlake;
import prettyprint::SnowFlake;

// import Message;
import Prelude;
import IO;


// a minimal implementation of a DSL in rascal
// users can add support for more advanced features
set[LanguageService] snowFlakeContributions() = {
    parser(parser(#start[SnowFlakeBatch]))
    , lenses(snowflakeLenses)
    , executor(snowflakeCommandHandler)
};



public void printSnowFlake(start[SnowFlakeBatch] snowflakebatch) {
  tr = implode(#SnowFlakeBatch, parse(#start[SnowFlakeBatch], snowflakebatch@\loc));
  writeFile(snowflakebatch@\loc, prettySnowFlake(tr));
}

data Command  = prettySnowFlake(start[SnowFlakeBatch] snowflakebatch);

// detect places to put lenses:
rel[loc,Command] snowflakeLenses(start[SnowFlakeBatch] input) 
  = {
      <input@\loc, prettySnowFlake(input, title= "Pretty Print SnowFlake")>
    };
 
value snowflakeCommandHandler(prettySnowFlake(start[SnowFlakeBatch] snowflakebatch)){
  printSnowFlake(snowflakebatch);
  return ("result": true);
}


void setupIDE() {
  registerLanguage(
    language(
    pathConfig(srcs = [|std:///|, |project://snowflake/src|]),
    "SnowFlake Lang", 
    "sql", 
    "LanguageServer",
    "snowFlakeContributions"
    ));
}