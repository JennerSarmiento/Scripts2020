#!/bin/bash
# @JennerSarmiento
# Febrer 2021
# prog file dirdesti
# copiar un fitxer al directori desti
# copyfiles file[...] dir desti
#	n.args
#	llista arg
#	ultim arg
#	llista files
# [carta treball informe apunts]
#------------------------------------

# 1) Validar el número d'argument

ERROR_NARGS=1
ERROR_FILE=2
ERROR_DIR=3
if [ $# -lt 2 ]
then
  echo "Error, numero d'arguments no valid"
  echo "Usage: program.sh file[...] directori_desti"
  exit $ERROR_NARGS
fi
# 2) Llista els arguments.
echo $#
echo $*
echo $*| sed 's/ [^ ]*$//'
echo $*| sed 's/^.* //'
echo 
echo $*| cut -d' ' -f1-$(($#-1))
echo $*| cut -d' '  -f$#
