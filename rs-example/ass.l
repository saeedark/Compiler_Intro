%option noyywrap

%{
#include <stdio.h>

#define YY_DECL int yylex()

#include "ass.tab.h"

%}

%%

[ \t]	; // ignore all whitespace
[0-9]+\.[0-9]+ 	{yylval.fval = atof(yytext); return T_FLOAT;}
[0-9]+		{yylval.ival = atoi(yytext); return T_INT;}
\n		{return T_NEWLINE;}
"if"	{return T_IF;}
"do"	{return T_DO;}
"while"	{return T_WHILE;}
"begin"	{return T_BEGIN;}
"else"	{return T_ELSE;}
"end"	{return T_END;}
"then"	{return T_THEN;}
"e"		{return T_E;}
"s"		{return T_S;}
";"		{return T_SEMI;}
"exit"		{return T_QUIT;}
"quit"		{return T_QUIT;}

%%
