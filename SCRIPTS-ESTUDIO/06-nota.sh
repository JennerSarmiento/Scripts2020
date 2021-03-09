#! /bin/bash 
# @JennerSarmiento Scripts Estudio
# prog [0-10]
#------------------------
ERROR_NARGS=1
ERROR_NUM=2
#1) Comprobar numero de argumentos
if [ $# -ne 1 ]
then
  echo "Error: Numero de argumentos no valido."
  echo "Usage: program-sh [0-10]"
  exit $ERROR_NARGS
fi

#2) Comprobar que esté entre los valores de 0 y 10 con una variable
nota=$1

if ! [ $nota -ge 0 -a $nota -le 10 ]
then
  echo "Error: Numero no esta entre 0 y 10"
  echo "Usage: program-sh [0-10]"
  exit $ERROR_NUM
fi
#3) Xixa

if [ $nota -lt 5 ]
then
  echo "Suspendido"
elif [ $nota -lt 7 ]
then  
  echo "Aprobado"
elif [ $nota -lt 9 ]
then
  echo "Notable"
else
  echo "Excelente"
fi
exit 0
