

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
int aux = 0;

%}

%token '{' '}' ':' ',' '\n' '[' ']' STR INT FLOAT

%%

json:
  element '\n' {aux = 1; printf("VALIDO\n");} 
  ;

element:
  '{' C '}' {}
  ;

C:
  STR ':' V {}
  | C ',' C
  |
  ;

V:
  INT {}
  | FLOAT {}
  | STR {}
  | LIST {}
  | element {}
  ;

LIST:
  '[' A ']' {}
  |'[' ']' {} 
  ;

A:
  A ',' A {}
  | INT {}
  | FLOAT {}
  | STR {}
  | LIST {}
  | element {}
  ;

%%

void yyerror(char *s) {
  if(aux == 0) printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;

}
