#! /bin/bash
# @JennerSarmiento ASIX M01-ASO Curs 2020-2021
# Febrer 2021
# Mostrar per entrada estandar numerat linia a linia
#
#----------------------------------------------
num=1
while read -r line
do
  echo "$num: $line"
  ((num++))
done
exit 0
 
