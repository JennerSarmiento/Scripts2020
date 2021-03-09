#! /bin/bash
# @JennerSarmiento
# exemples del while
#--------------------------
# 8) numerar stdin linia a linia i mostrar en majuscules
num=1
while read -r line
do
  echo "$num: $line " | tr '[:lower:]' '[:upper:]'
  ((num++))
done
exit 0

# 7) numerar stdin linia a linia
num=1
while read -r line
do
  echo "$num: $line "
  ((num++))
done
exit 0

# 6) mostrar stdin fin "FI"
read -r line
while [ "$line" != "FI" ] 
do
  echo "$line"
  read -r line
done
exit 0

# 5) Mostrar la entrada estandar linia per linia
while read -r line
do
  echo $line
done
exit 0

# 4) Mostrar els arguments
num=1
while [ $# -gt 0 ]
do
 echo "$num $#, $*"
 shift
done
exit 0
# 3) Mostrar argumentos
while [ -n "$1" ]
do
  echo "$1 $#: $*"
  shift
done
exit 0

# 2) Comptador decreixent del arg rebut [n-0]
MIN=0
num=$1
while [ $num -ge $MIN ]
do
  echo -n "$num  " 
  ((num--))
done
exit 0

# 1) mostrar del 1 al 10
MAX=10
MIN=1
while [ $MIN -le $MAX ]
do
  echo $MIN
  MIN=$((MIN+1))
done
exit 0
