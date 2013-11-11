#include <stdio.h>
#include "other.h"
 
char *b;
char a [] = "sebastian";
	
char* funcion()
{

	b = a;
	printf("el nombre es %s\n", b);
	printf("%d\n",b);
	return b;
}

int sumando(int num1, int num2)
{
	return num1 + num2;
}

int llamarSumar()
{
	char num[10];
	printf("ingrese numero 1\n");
	scanf("%s",num);
	char num2[10];
	printf("ingrese numero 2\n");
	scanf("%s",num2);
	return sumando(atoi(num), atoi(num2));
}