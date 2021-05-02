%{

#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror(const char* s);
%}

%token T_IF T_DO T_WHILE T_BEGIN T_ELSE T_END T_THEN T_E T_S T_SEMI
%token T_NEWLINE T_QUIT

// operator precedence

%left T_PLUS T_MINUS
%left T_MULTIPLY T_DIVIDE


%start Stmt

%%

Stmt:
        | T_IF T_E T_THEN Stmt
        | T_IF T_E T_THEN Stmt T_ELSE Stmt
        | T_WHILE T_E T_DO Stmt
        | T_BEGIN List T_END
        | T_S
;

List:
        | T_SEMI List
        | Stmt
;

%%

int main() {
	yyin = stdin;

	do {
		yyparse();
	} while(!feof(yyin));

	return 0;
}

void yyerror(const char* s) {
	fprintf(stderr, "Parse error: %s\n", s);
	exit(1);
}
