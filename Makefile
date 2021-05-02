all: calc

parser:
	bison -t -v -d calc.y

scanner:
	flex calc.l

calc: parser scanner
	gcc -o calc lex.yy.c calc.tab.c

graph:
	bison --graph calc.y
	dot calc.dot -Tpng -o calcGraph.png

clean:
	rm calc calc.tab.c lex.yy.c calc.tab.h calc.output calcGraph.png calc.dot 	
