#! /bin/bash
# @JennerSarmiento Scripts2020
# Validar nota
#-----------------------------------
ERR_NARGS=1
ERR_VALOR=2

# 1) Validem arguments
if [ $# -ne 1 ]
then
  echo "Error: numero arguments incorrecte"
  echo "Usage: $0 nota"
  exit $ERR_NARGS
fi

# 2) Colocar los valores entre 0 y 10
nota=$1
if ! [ $nota -ge 0 -a $nota -le 10 ]
then
  echo "Error: numero no vàlid"
  echo "USAGE: $0 [0-10]"
  exit $ERR_VALOR
fi

# 3) Programa
if [ $nota -lt 5 ]
then
  echo "Suspendido"
else
  echo "Aprobado"
fi
exit 0
