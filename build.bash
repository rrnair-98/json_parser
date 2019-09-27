bison -d json.y
flex json.l
gcc lex.yy.c json.tab.c

