#! /bin/bash
# @JennerSarmiento
# Sinopsis : $0 file dirdesti
#-----------------------------
ERROR_NARG=1
ERROR_FILE=2
ERROR_DIR=3
#1) Validar que haguin 2 arguments
if [ $# -ne 2 ]
then
  echo "ERROR: Numero de argumentos no validos"
  echo "USAGE: $0 file dirdesti"
  exit $ERROR_NARG
fi

# 2) Confirmar que el primer argumento sea un file
file=$1
dirdesti=$2
if ! [ -f $file ]
then
  echo "ERROR: el primer argumento no es un file"
  echo "USAGE: $0 file dir"
  exit $ERROR_FILE
fi

#3) Confirmar que el segundo argumento sea un dir
if ! [ -d $dirdesti ]
then
  echo "ERROR: El segon arg no es un dir"
  echo "USAGE: $0 file dir"
  exit $ERROR_DIR
fi
# 3) XIXA
cp $file $dirdesti
exit 0
