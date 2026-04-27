%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>

void yyerror(const char *msg);
int yylex();
%}

%option noyywrap

%%

/* copiar E2 e fazer as extensões */
"//".* { }
"\\".* { }

"print"                 { return PRINT; }
"concat"                { return CONCAT; }
"length"                { return LENGTH; }
\"[^\"\n]*\"            { return STRING; }
[a-zA-Z_][a-zA-Z0-9_]* { return IDENT; }
[ \t\r\n]+            { }
"("                 { return LPAREN; }
")"                 { return RPAREN; }
[0-9]+(\.[0-9]+)?   { return NUM; }
"+"                 { return PLUS; }
"-"                 { return MINUS; }
"*"                 { return TIMES; }
"/"                 { return DIV; }
"="                     { return ASSIGN; }
","                     { return COMMA; }
.            { return ERROR; }

%%
