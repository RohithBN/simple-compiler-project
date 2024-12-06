%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char *s);
%}

%token IF ELSE INT FLOAT IDENTIFIER INTEGER FLOATING
%token GE LE EQ NE

%%
Program: StatementList 
       { printf("PARSER: Completed parsing program\n"); }
       ;

StatementList: Statement
             { printf("PARSER: Found single statement\n"); }
             | StatementList Statement
             { printf("PARSER: Found multiple statements\n"); }
             ;

Statement: Declaration
         { printf("PARSER: Parsed declaration statement\n"); }
         | Assignment
         { printf("PARSER: Parsed assignment statement\n"); }
         | IfStatement
         { printf("PARSER: Parsed if statement\n"); }
         ;

Declaration: Type IDENTIFIER ';'
          { printf("PARSER: Parsed variable declaration\n"); }
          ;

Assignment: IDENTIFIER '=' Expression ';'
          { printf("PARSER: Parsed assignment expression\n"); }
          ;

IfStatement: IF '(' Condition ')' '{' StatementList '}'
           { printf("PARSER: Parsed if statement without else\n"); }
           | IF '(' Condition ')' '{' StatementList '}' ELSE '{' StatementList '}'
           { printf("PARSER: Parsed if-else statement\n"); }
           ;

Condition: Expression RelOp Expression
         { printf("PARSER: Parsed condition with comparison\n"); }
         | Expression
         { printf("PARSER: Parsed condition without comparison\n"); }
         ;

RelOp: '>'  { printf("PARSER: Found > operator\n"); }
     | '<'  { printf("PARSER: Found < operator\n"); }
     | GE   { printf("PARSER: Found >= operator\n"); }
     | LE   { printf("PARSER: Found <= operator\n"); }
     | EQ   { printf("PARSER: Found == operator\n"); }
     | NE   { printf("PARSER: Found != operator\n"); }
     ;

Expression: Term
          { printf("PARSER: Parsed simple expression\n"); }
          | Expression '+' Term
          { printf("PARSER: Parsed addition expression\n"); }
          | Expression '-' Term
          { printf("PARSER: Parsed subtraction expression\n"); }
          ;

Term: Factor
    { printf("PARSER: Parsed simple term\n"); }
    | Term '*' Factor
    { printf("PARSER: Parsed multiplication term\n"); }
    | Term '/' Factor
    { printf("PARSER: Parsed division term\n"); }
    ;

Factor: '(' Expression ')'
      { printf("PARSER: Parsed parenthesized expression\n"); }
      | IDENTIFIER
      { printf("PARSER: Parsed identifier factor\n"); }
      | INTEGER
      { printf("PARSER: Parsed integer factor\n"); }
      | FLOATING
      { printf("PARSER: Parsed floating factor\n"); }
      ;

Type: INT    { printf("PARSER: Found int type\n"); }
    | FLOAT  { printf("PARSER: Found float type\n"); }
    ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Starting compilation...\n");
    yyparse();
    printf("Compilation finished\n");
    return 0;
}