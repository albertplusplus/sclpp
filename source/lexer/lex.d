module lexer.lex;

import std.stdio;

class Lexer {

  this(string input) { _input = input; }
  public void run() {
    writeln("Tokenizing...");
  }
  private string _input;
}
