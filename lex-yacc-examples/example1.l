%{
#include <stdio.h>
%}
%%
[0-9]+                  printf("NUMBER\n");
stop                    printf("Stop command received\n");
start                   printf("Start command received\n");
%%
