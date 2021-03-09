#! /bin/bash
# @JennerSarmiento
# Leer numerando los argumentos
#-------------------------------------
ERROR_NARG=1
# 1) Confirmar que hi ha almenys 1 arg
if [ $# -eq 0 ]
then
  echo "ERROR:no hi ha arguments"
  echo "USAGE: $0 arg[...]"
  exit $ERROR_NARG
fi

# 2) XIXA
num=1
for arg in $*
do
  echo "$num: $arg"
  ((num++))
done
exit 0
