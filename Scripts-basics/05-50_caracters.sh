#! /bin/bash
# @JennerSarmiento Scripts2020
# Entrada estandard, -c50
#---------------------------
#While read -r per llegir la llista
while read -r line
do
#Utilitzem un cut per que només surtin els 50 primers caràcter
  echo $line | cut -c1-50
done
