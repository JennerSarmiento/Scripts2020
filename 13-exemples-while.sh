#! /bin/bash
# @JennerSarmiento ASIX-M01 Scripts2020-2021
# Febrer2021
# Descripció: exemples bucle while
#-------------------------------------------

# while [ cond ]
#do
#  accions
# done
MIN=0
num=$1

# 3) mostrar els arguments 
while [ $# -gt 0 ]
do
  echo "$#:  $*"
  shift
done
exit 0

# 2) mostrar de n a 0 countdown [n,0]

while [ $num -ge $MIN]
do
  echo $num
  ((num--))
done
exit 0


# 1) mostar numeros del 1 al 10
MAX=10
num=1
while [ $num -eq 1 ]
do
  echo $num
  ((num++))
done
