%{
void yyerror(char *s);
#include <stdio.h>
#include <stdlib.h>

%}

%token string true false number null
%left object_begin object_end array_begin array_end 
%left comma 
%left colon 
%start start



%%

start			: array
				| object
				;


object			:	object_begin obj_data object_end 
				| 	object_begin object_end 
				;


obj_data		:  	string colon value
				| 	string colon value comma object_data
				;

array			: array_begin array_elements array_end
				| array_begin array_end 
				;

array_elements 	: 	value
				| 	value comma array_elements
				;

value			: string
				| null 
				| number
				| true
				| false
				| object
				| array
				;



%%
void yyerror(char *s){
	fprintf(stderr, "%s\n", s);
}

int main(){
	yyparse();
	return 1;
}