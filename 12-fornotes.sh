#! /bin/bash
# @JennerSarmiento ASIX 2021 Scripts2020-2021
# prog notes[....] --> minim 1 arg o més
# -rep 1 o més arguments
# -per cada nota [0-10]
# - per cada nota dir si és suspès, aprovat, notable, excel·lent (XIXA
#------------------------------------------------
# 1) validar numero d'arguments (if)
# 2) iterar per cada nota (for)
#	2.1) validar la nota   (if/elif/else)
#	2.2) determinar el valor

OK=0
ERR_NARGS=1
ERR_VALOR=2

# 1)Si num args no es correcte parar
if [ $# -eq 0 ]
then
  echo "ERROR: num arg incorrecte"
  echo "Usage: $0 nota[...]"
  exit $ERR_NARGS
fi

# 2) iterar per cada nota
for nota in $*
do
  if ! [ $nota -ge 0 -a $nota -le 10 ]
  then
    echo "Error: nota $nota no valida [0,10]" >> /dev/stderr
    echo "nota pren valors [0,10]"
# XIXA
  elif [ $nota -lt 5 ]
  then
     echo "Suspes"
  elif [ $nota -lt 7 ]
  then
     echo "Aprovat"
  elif [ $nota -lt 9 ]
  then
     echo "Notable"
  else
     echo "Excelent"
  fi
done
 exit $OK
