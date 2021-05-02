# Lex and YACC examples

Practice code for examples in [Lex and YACC primer/HOWTO](https://ds9a.nl/lex-yacc/cvs/output/lexyacc.html) of myself.

### Compile Guide

#### Example1
```
lex example1.l
cc lex.yy.c -o example1 -ll
```


#### Example2
```
lex example2.l
yacc -d example2.y
cc lex.yy.c y.tab.c -o example2
```

#### Example3
```
lex example3.l
yacc -d example3.y
cc lex.yy.c y.tab.c -o example3
```
