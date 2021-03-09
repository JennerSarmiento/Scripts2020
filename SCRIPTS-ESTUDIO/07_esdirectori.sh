#! /bin/bash
# @JennerSarmiento Scripts Estudio
# prog -h, prog file
#---------------------------------
ERROR_NARGS=1
ERROR_NODIR=2

#1) Confirmar numero de arguments
if [ $# -ne 1 ]
then
  echo "ERROR: Numero de argumentos no validos"
  echo "USAGE: program.sh arg1"
  exit $ERROR_NARGS
fi

#2) Confirmar que el argumento dado sea un directorio
if ! [ -d $1 ]
then
  echo "ERROR: El argumento dado no es un directorio"
  echo "USAGE: program.sh arg1"
  exit $ERROR_NODIR
fi

#3) XIXA

ls $1
exit 0
