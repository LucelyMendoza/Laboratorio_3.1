%{
#include<stdio.h>
#include<stdlib.h>
#include<conio.h>
#include<string.h>
FILE *yyin;
%}

%option noyywrap
%option yylineno

DIGITO [0-9]
LETRA [a-zA-Z]
CHAR_PUNTO ["."]
CONST_INTEGER (-?[1-9][0-9]{0,4})|0

DEFINE	  "DEFINE"
FINDEFINE "FINDEFINE"
INTEGER   "INTEGER"|"Integer"
FLOAT     "FLOAT"|"Float"
WRITE     "WRITE"|"Write"

VARIABLE {LETRA}({LETRA}|{DIGITO})*
NUM_FLOAT   {DIGITO}{0,8}{CHAR_PUNTO}{DIGITO}{1,8}

DOSPUNTOS [":"]
PUNTOYCOMA [";"]
%%

{DEFINE} { printf("\nPalabra reservada-->DEFINE ...ok (%s)",yytext); }
{INTEGER} { printf("\nTipo de dato (%s)...OK",yytext); }
{FLOAT} { printf("\nTipo de dato (%s)...OK",yytext); }
{VARIABLE} { printf("\nVARIABLE ....OK(%s)",yytext); }
{DOSPUNTOS} { printf("\nDOS_PUNTOS (%s)...OK",yytext); }
{PUNTOYCOMA} { printf("\nPUNTOYCOMA (%s)...OK",yytext); }
{CONST_INTEGER} { printf("\nCONST_INTEGER (%s)",yytext); }
{FINDEFINE} { printf("\nPalabra reservada-->FINDEFINE (%s)",yytext); }
{WRITE} { printf("\nPalabra reservada-->WRITE (%s)",yytext); }

.  yyerror();
%%

int main(int argc, char *argv[]){
/*lectura de archivo*/
  if( (yyin = fopen(argv[1],"rt")) == NULL ){
    printf("\nNo se puede abrir el TXT: %s \n", argv[1]);
    return 1;
  }
  else{
      printf("\nEl archivo %s se abrio ok.\n", argv[1]);
      yylex();
  }
  printf("\nFLEX termino de leer el archivo %s \n", argv[1]);
  fclose(yyin);
  return 0;
}

int yyerror(void){
  printf("\nError lexico: Invalido: %s, debe revisar...\n",yytext);
  exit(1);
}