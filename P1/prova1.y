%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
void yyerror(const char *msg);

%}

%token ERROR
%token NUM IDENT STRING
%token PRINT CONCAT LENGTH
%token ASSIGN LPAREN RPAREN COMMA
%token PLUS MINUS TIMES DIV

%left PLUS MINUS
%left TIMES DIV

%start program

%%

program
: stmt_list 
| 
;

stmt_list
: stmt
| stmt_list stmt
;

stmt
: IDENT ASSIGN expr
| PRINT LPAREN exprlist RPAREN
| expr
;

expr
: expr PLUS expr
| expr MINUS expr
| expr TIMES expr
| expr DIV expr
| LPAREN expr RPAREN
| NUM
| IDENT
| STRING
| CONCAT LPAREN exprlist RPAREN
| LENGTH LPAREN expr RPAREN
;

exprlist
: expr
| exprlist COMMA expr
;

%%
