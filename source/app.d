import lexer.lex;

void main()
{
  auto lexer = new Lexer("string to lex");
  lexer.run();
}
