#! /bin/bash
# @JennerSarmiento
# tipusfile [regular_file,dir,link]
#-----------------------------------
ERR_NARGS=1
ERROR_EXISTENCIA=2
#1) Validar el numero de argumentos
if [ $# -ne 1 ]
then
  echo "Error: numero arguments incorrecte"
  echo "Usage: $0 dir"
  exit $ERR_NARGS
fi

#2) Confirmar que existeixi
if ! [ -e $1 ]
then
  echo "ERROR: No existe"
  echo "Usage: $0 file"
  exit $ERROR_EXISTENCIA
fi

#3) XIXA
if [ -d $1 ]
then
  echo "$1 --> Es un directorio"
elif [ -h $1 ]
then
  echo "$1 --> Es un regular link"
elif [ -f $1 ]
then
  echo "$1 --> Es un regular file"
fi
exit 0
