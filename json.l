%{
#include "json.tab.h"
%}

%%
[+-]?[0-9]+(\.?[0-9]+)?							{printf("number %s\n", yytext);return number;}
\"([-!,/:+()\.$@_a-zA-Z0-9 ]*)?\"				{printf("string %s\n", yytext);return string;}
true											{printf("Data %s\n", yytext);return true;}
false											{printf("Data %s\n", yytext);return false;}
null											{printf("Data %s\n", yytext);return null;}
,												{printf("comma \n");return comma;}
:												{printf("colon \n");return colon;}
[ \t\n]+										{printf("spaces \n");} 
\{												{printf("object_begin \n");return object_begin;}
\}												{printf("object end \n");return object_end;}
\[												{printf("array_begin %s", yytext);return array_begin;}
\]												{printf("array_end %s", yytext);return array_end;}
.												{printf("Unexpected: %c\nExiting...\n",*yytext);}
%%

int yywrap(){return 1;}
