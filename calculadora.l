%{
#include "calculadora.tab.h"
%}

NUMBER [0-9]+(\.[0-9]+)?
ADD "+"
SUB "-"
MUL "*"
DIV "/"
ABS "|"
LPAREN "("
RPAREN ")"

%%

{NUMBER}    { yylval.val = atof(yytext); return NUMBER; }
{ADD}       { return ADD; }
{SUB}       { return SUB; }
{MUL}       { return MUL; }
{DIV}       { return DIV; }
{ABS}       { return ABS; }
{LPAREN}    { return LPAREN; }
{RPAREN}    { return RPAREN; }
\n          { return EOL; }

[ \t]       ;
.           { printf("Caracter no reconocido: %s\n", yytext); }

%%

