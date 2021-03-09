#! /bin/bash
# @JennerSarmiento
# Contador hasta 0 
#-------------------
ERROR_NARG=1
# 1) Confirmar el numero de argumentos=0
if [ $# -ne 1 ]
then
  echo "ERROR:numero de argumentos erroneo"
fi

#2) programa
num=0
MAX="$1"
while [ $num -le $MAX ]
do
  echo "$num"
  num=$((num+1))
done


