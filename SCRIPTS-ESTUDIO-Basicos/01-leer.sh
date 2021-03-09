#! /bin/bash
# @JennerSarmiento
#Mostrar la entrada estandar numerat linia a linia
#--------------------
num=1
while read -r line
do
  echo "$num --> $line"
  ((num++))
done
exit 0
