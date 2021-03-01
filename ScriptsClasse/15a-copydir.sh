#!/bin/bash
# @JennerSarmiento
# Febrer 2021
# prog file dirdesti
# copiar un fitxer al directori desti
#------------------------------------

# 1) Validar el número d'argument

ERROR_NARGS=1
ERROR_FILE=2
ERROR_DIR=3
if [ $# -ne 2 ]
then
  echo "Error, numero d'arguments no valid"
  echo "Usage: program.sh file 	directori_desti"
  exit $ERROR_NARGS
fi

# 2) Validar si el primer argument sigui un file

if [ ! -e $1 ]
then
  echo "Error: el fitxer origen no existeix"
  echo "Usage: programa.sh file directori_desti"
  exit $ERROR_FILE
fi

# 3) Validar si el segon argument sigui un directori

if [ ! -d $2 ]
then
  echo "Error: el segon argument no es un directori"
  echo "Usage: programa.sh file directori_desti"
  exit $ERROR_DIR
fi

# 4) Programa (copiar el file del $1 al directori desti $2)
file=$1
dir=$2
cp $file $dir
exit 0
