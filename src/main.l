
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

WS [\n ]*
OPEN \{
CLOSE \}

%%

{OPEN} {return '{';}

{CLOSE} {return '}';}

{WS}\[{WS} {return '[';}

{WS}\]{WS} {return ']';}

{WS}\"{WS} {return '"';}

{WS}\:{WS} {return ':';}

{WS}\,{WS} {return ',';}

{WS}[0-9]+{WS} {return INT;}

{WS}[0-9]+[.][0-9]+{WS} {return FLOAT;}

{WS}\"[A-Za-z0-9 ]+\"{WS} {return STR;}

[A-Za-z0-9]+;

\n {return '\n';}

. ;


%%

int yywrap() {
  return 1;
}
