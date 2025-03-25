module lexer.lex;

import std.stdio;
import std.format;
import std.conv;
import std.range;

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
  WHITESPACE,
  OTHER,
  EOF,
}

struct Token {
  TOK tokenType;
  string lexeme;

  this(string _lex, TOK _tokenType) {
    tokenType = _tokenType;
    lexeme = _lex;
  }

  public string toStr() {
    return format("%s %s", tokenType, lexeme);
  }
}

struct Lexer(R) if (isInputRange!R)
{
  R src;
  Token[] tokens;
  private int start = 0;
  private int current = 0;
  private int line = 1;

  this(R input) { src = input; }

  public Token[] scan() {
    if (src.empty) return null;

    for (;;) {
      if (src.empty) break;

      auto c = src.front;

      switch (c)
      {

      case 'A': .. case 'z':
        lexIdent();
        break;

      case '0': .. case '9':
        lexNumber();
        break;

      case ' ':
      case '\n':
      case '\t':
        tokens ~= Token(to!R(c), TOK.WHITESPACE);
        src.popFront();
        break;

      case '<':
      case '>':
        lexOp();
        break;

      default:
        tokens ~= Token(to!R(c), TOK.OTHER);
        src.popFront;
        break;
      }

    }
    return tokens;
  }

  private void lexNumber() {
    // TODO: Get NUMBER token
    R tmpNumber;
    while (!src.empty &&
           (src.front >= '0' && src.front <= '9')) {
      tmpNumber ~= src.front;
      src.popFront();
    }
    tokens ~= Token(tmpNumber, TOK.NUMBER);
  }

  private void lexIdent() {
    // TODO: Get IDENT token
    R tmpIdent;
    while  (!src.empty &&
           ((src.front >= 'A' && src.front <= 'z') ||
           (src.front >= '0' && src.front <= '9'))) {
      tmpIdent ~= src.front;
      src.popFront();
    }
    tokens ~= Token(tmpIdent, TOK.IDENT);
  }

  private void lexOp() {
    // TODO: Get one of EQ tokens
  }

}
