#!/bin/bash

bison -d calculadora.y
flex calculadora.l
gcc calculadora.tab.c lex.yy.c -lfl
./a.out