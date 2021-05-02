%{
    #include<stdio.h>
    #include<string.h>
    #include<stdlib.h>   
  
  int yylex();
  int yyerror(char *s);

  void addQuadruple(char [],char [],char [],char []);
  void display_Quadruple();
  void push(char*);
  char* pop();
  char* get_tmp();
  
  int Index = 0;

  struct Quadruple
  {
    char operator[5];
    char operand1[10];
    char operand2[10];
    char result[10];
  }QUAD[75];

 struct Stack
  {
    char * items[100];
    int top;
  }Stk;
  
  struct Temp
  {
    char text[2];
    int number;
  }tmp_var;

%}

%union
{
  double dval;
}


%token<dval> NUM

/* declaring precedence */
%left '+' '-'
%left '*' '/'
%left UMINUS

%%

E : E '+' T                  { char * res = get_tmp(); addQuadruple("+", pop(), pop(), res); push(res);}
  | E '-' T                  { char * res = get_tmp(); addQuadruple("-", pop(), pop(), res); push(res); }
  | T
  ;

T : T '*' F                  { char * res = get_tmp(); addQuadruple("*", pop(), pop(), res); push(res); }
  | T '/' F                  { char * res = get_tmp(); addQuadruple("/", pop(), pop(), res); push(res); }
  | F
  ;

F : '(' E ')'                 
  | '-' F %prec UMINUS       { char * res = get_tmp(); addQuadruple("*", "-1", pop(), res); push(res); } 
  | NUM                      { char temp[10]; snprintf(temp,10,"%f",$1); push(temp); }
  ;
  
%%

int main(){
  strcpy(tmp_var.text, "t");
  tmp_var.number = 0;
  Stk.top = -1;
  yyparse();
  display_Quadruple();
  printf("\n");
  /* todo llvm IR output */
  /* llvm IR run*/
  return(0);
}

char * get_tmp()
  {
    char * outstr = (char *)malloc(16);
    char num[10];
    strcpy(outstr, tmp_var.text);
    sprintf(num, "%d", tmp_var.number);
    strcat(outstr, num);
    tmp_var.number++ ;
    return outstr;
  }

void display_Quadruple(){
  int i;
  printf("\n The Quadruple Table");
  printf("\n     Result     Operator      Operand1        Operand2  ");
  for(i=0;i<Index;i++)
    printf("\n %d     %s          %s          %s        %s",i,QUAD[i].result,QUAD[i].operator,QUAD[i].operand1,QUAD[i].operand2);
}

void push(char *str)
{
  Stk.top++;
  Stk.items[Stk.top]= (char *)malloc(strlen(str)+1);
  strcpy(Stk.items[Stk.top],str);
}

char * pop()
{
  int i;
  if(Stk.top==-1){
     printf("\nStack Empty!! \n");
     exit(0);
  }
  char * str = (char *) malloc (strlen(Stk.items[Stk.top])+1);
  strcpy(str,Stk.items[Stk.top]);
  Stk.top--;
  return(str);
}
 
void addQuadruple(char op[10],char op2[10],char op1[10],char res[10]){
  strcpy(QUAD[Index].operator,op);
  strcpy(QUAD[Index].operand2,op2);
  strcpy(QUAD[Index].operand1,op1);
  strcpy(QUAD[Index].result,res);
  Index++;
}

int yyerror(char * s)
{
   printf("\nERROR!!\n");
   return(1);
}
