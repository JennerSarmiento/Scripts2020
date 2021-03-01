#! /bin/bash 
# @edt ASIX-M01 Curs 2019-2020 
# gener 2018 
# Descripcio: dir els dies que té un més 
# Synopsis: prog mes 
# --------------------------------- 
ERR_NARGS=1 
ERR_NORANG=2 
OK=0 
#1) Validar existeix un arg 
if [ $# -ne 1 ] 
then
  echo "Error, numero d'arguments no valid"
  echo "Usage: $0 mes"
  exit $ERR_NARGS
fi

#2) 
mes=$1
if ! [ $mes -ge 1 -a $mes -le 12 ]
then
  echo "Error, valor argument no valid"
  echo "Usage: $0 mes (valord de [1,12]"
  exit $ERR_NORANG
fi	
exit 0



