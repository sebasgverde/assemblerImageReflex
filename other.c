#include <stdio.h>
#include "other.h"
 
char *b;
char a [] = "sebastian";
	
char* funcion()
{

	b = a;
	printf("el nombre es %s\n", b);
	printf("%d\n", b);
	return b;
}