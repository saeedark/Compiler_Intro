
%{
#include<string.h>
#include<stdio.h>
#include "calc.tab.h"
%}

%%

[0-9]+                          { yylval.dval=atof(yytext); return NUM; }
[0-9]+\.[0-9]+                  { yylval.dval=atof(yytext); return NUM; }
[- + ( ) * / ]                  { return *yytext; }
[\n]                            { yyterminate(); }
.				                    { printf("invalid char."); }

%%

// wrapup, return 1 if done, 0 if not done
int yywrap()
{
   return(1);
}
