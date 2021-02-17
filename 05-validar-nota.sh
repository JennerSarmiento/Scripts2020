#! /bin/bash
# @JennerSarmiento ISO-M01
# Febrer 2021
# Descripció: Mostar si esta aprovat o si està suspes
# -Validar arg, validar [0,10]
# prog nota
#--------------------------
ERR_NARGS=1
ERR_VALOR=2

# 1) Validar arguments

if [ $# -ne 1 ]
then 
  echo "Error: #Arguments incorrectes"
  echo "Usage: $0 nota"
  exit $ERR_NARGS
fi

#  2) Validar nota pren un valor [0,10]

nota=$1
if ! [ $nota -ge 0 -a $nota -le 10 ]
then
  echo "Error: nota no vàlida"
  echo "nota: pren valors [0,10]"
  exit $ERR_VALOR
fi

if [ $nota -lt 5 ]
then
  echo "Suspès"
else
  echo "Aprovat"
fi
exit 0
