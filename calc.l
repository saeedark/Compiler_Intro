
%{
#include<string.h>
#include<stdio.h>
#include "y.tab.h"
%}

%%

[0-9]+                          { yylval.dval=atof(yytext); return NUM; }
[0-9]+\.[0-9]+                  { yylval.dval=atof(yytext); return NUM; }
[- + ( ) * / ]                  { return *yytext; }
[\n]                            { yyterminate(); }
.				                        { printf("invalid char."); }

%%

int yywrap()
{
   return(1);
}
