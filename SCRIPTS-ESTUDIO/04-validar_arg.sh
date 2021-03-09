#! /bin/bash
# @JennerSarmiento Scripts2020
# 04-Validar argumentos
# prog arg1 arg2
#--------------------------
ERROR_NARGS=1

#1) Comprovació d'arguments
if [ $# -ne 2 ]
then
  echo "ERROR: Numero d'argumentos no vàlid"
  echo "USAGE: program.sh arg1 arg2"
  exit $ERROR_NARGS
fi
#2) Xixa
echo $1
echo $2
exit 0
