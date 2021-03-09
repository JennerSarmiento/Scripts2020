#! /bin/bash
# @JennerSarmiento
#Descripción:10. Fer un programa que rep com a argument un número indicatiu
#del número màxim de línies a mostrar. El programa processa stdin línia a
#línia i mostra numerades un màxim de num línies.
#-----------------------------------------------------
ERROR_NARG=1
ERROR_LIMITE=2
# 1) Minimo 1 arg
if [ $# -ne 1 ]
then
  echo "ERROR: argumento inexistente"
  echo "USAGE: $0 lim "
  exit $ERROR_NARG
fi
# 2) Confirmar que el primer argumento no sea 0
limite=$1
if [ $limite -eq 0 ]
then
  echo "ERROR: Limite=0"
  echo "USAGE: $0 lim"
  exit $ERROR_LIMITE
fi

