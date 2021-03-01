#! /bin/bash
# @JennerSarmiento M01
# Descripción:3. Fer un comptador des de zero fins al valor indicat per l’argument rebut.
#---------------------------------------------------------
ERROR_NARGS=1
#1 Control d'errors per argument
if [ $# -ne 1 ]
then
  echo "Error:No has col·locat els arguments."
  echo "Usage: program.sh int"
  exit $ERROR_NARGS
fi

#Programa=Xixa
MAX=$1
num=0
while [ $num -le $MAX ]
do
  echo "$num"
  ((num++))
done
exit 0

