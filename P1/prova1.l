%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>

void yyerror(const char *msg);
int yylex();
%}

%option noyywrap

%%

"//".* { }
"\\\\".* { }

"print"                 { return PRINT; }
"concat"                { return CONCAT; }
"length"                { return LENGTH; }

[a-zA-Z_][a-zA-Z0-9_]* { return IDENT; }
\"[^\"\n]*\"            { return STRING; }
[0-9]+(\.[0-9]+)?       { return NUM; }

"="                     { return ASSIGN; }
"+"                     { return PLUS; }
"-"                     { return MINUS; }
"*"                     { return TIMES; }
"/"                     { return DIV; }
"("                     { return LPAREN; }
")"                     { return RPAREN; }
","                     { return COMMA; }

[ \t\r\n]+              { }

.                       { return ERROR; }

%%
