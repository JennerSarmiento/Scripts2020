#! /bin/bash 
# @edt ASIX-M01 Curs 2020-2021 
# febrer 2021
# Descripcio: exemples bucle while 
# ---------------------------------
# 9) numerar stdin  línia a línia
#    i mostrar-la en majúscules
num=1
while read -r line
do
  echo "$num: $line" | tr '[a-z]' '[A-Z]'
  ((num++))
done
exit 0

# 8) motrar stdin fins a token FI    
read -r line
while [ "$line" != "FI" ] 
do
  echo "$line"
  read -r line
done
exit 0

# 7) numerar stdin  línia a línia
num=1
while read -r line
do
  echo "$num: $line"
  ((num++))
done
exit 0

# 6) mostrar la entrada estandard línia a línia
while read -r line
do
  echo $line
done
exit 0

# mostrar els arguments
num=1
while [ $# -gt 0 ]
do
  echo "$num: $1, $#, $*"
  num=$((num+1))
  shift
done
exit 0

# mostrar els arguments
while [ -n "$1" ]
do
  echo "$1 $#:  $*"
  shift
done
exit 0

# comptador recrexeint del arg rebut [n-0]
MIN=0
num=$1
while [ $num -ge $MIN ]
do
  echo -n "$num, "
  ((num--))
done
exit 0

# mostrar del [1-10]
MAX=10
num=1
while [ $num -le $MAX ]
do
  echo "$num"
  ((num++))
done
exit 0
