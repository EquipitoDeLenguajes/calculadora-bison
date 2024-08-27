%{
#include <stdio.h>

void yyerror(const char *s);
int yylex(void);
%}

%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL
%token LPAREN RPAREN

%%
calclist:
 | calclist exp EOL { printf("= %d\n", $2); }
 ;
exp: factor { $$ = $1; }
 | exp ADD factor { $$ = $1 + $3; }
 | exp SUB factor { $$ = $1 - $3; }
;
factor: term { $$ = $1; }
 | factor MUL term { $$ = $1 * $3; }
 | factor DIV term { $$ = $1 / $3; }
 ;
term: NUMBER { $$ = $1; }
 | ADD NUMBER { $$ = +$2; }
 | SUB NUMBER { $$ = -$2; }
 | ABS term ABS{ $$ = $2 >= 0 ? $2 : -$2; }
 | LPAREN exp RPAREN { $$ = $2; } 
 | SUB LPAREN exp RPAREN {$$ = -$3; }
 ;
%%

int main(int argc, char **argv)
{
    return yyparse();
}

void yyerror(const char *s)
{
    fprintf(stderr, "error: %s\n", s);
}
