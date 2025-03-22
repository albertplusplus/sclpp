module lexer.lex;

import std.stdio;

enum TOK {
  OPEN_PAREN,
  CLOSE_PAREN,
  NUMBER,
  IDENT,
  EQUAL,
  LESS_EQ,
  LESS,
  GREATER,
  GREATER_EQ,
}

struct Lexer {
  string _input;

  this(string input) { _input = input; }

  public void run() {
    writeln("Tokenizing...");
  }

}
