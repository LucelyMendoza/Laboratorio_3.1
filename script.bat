@echo off
D:\FLEX\GnuWin32\GnuWin32\bin\flex ANALIZADOR.l
echo "FLEX compilo la especificacion del archivo ANALIZADOR.l"
pause
D:\FLEX\GnuWin32\GnuWin32\bin\gcc.exe lex.yy.c -o a.exe
echo "Finalizo la ejecucion del compilador de C sobre el archivo lex.yy.c"
pause
a.exe PRUEBA_02.txt
echo "Se ejecuto el analizador lexico sobre el archivo PRUEBA_02.txt"
del lex.yy.c
del a.exe
echo "Se borraron los archivos..."
pause