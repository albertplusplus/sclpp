import lexer.lex;
import std.stdio;


void main()
{
  auto lexer = Lexer!string("albert = 30");
  auto toks = lexer.scan();
  foreach (t; toks) {
    writeln(t);
  }
}
