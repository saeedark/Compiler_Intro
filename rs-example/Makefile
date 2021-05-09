all: graph


graph:
	bison -v --graph assignment.y
	dot assignment.dot -Tpng -o assignmentGraph.png

clean:
	rm assignment assignment.tab.c lex.yy.c assignment.tab.h assignment.output assignmentGraph.png assignment.dot 	
