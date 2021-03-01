#! /bin/bash
# @JennerSarmiento Scripts-2020
# Febrer 2021
# Mostrar els arguments rebuts linia a linia, tot numerant-los.
#-----------------------------------------------------------------
#Control que siguin arguments
ERROR_NOARGS=1
num=1
#Validar el numero de arguments:

if [ $# -lt 1 ]
then
  echo "Error: Has de posar un argument"
  echo "Usage: program.sh [...]"
  exit $ERROR_NOARGS
fi

#Programa
for arg in $*
do
  echo "$num : $arg "
  ((num++))
done

exit 0
