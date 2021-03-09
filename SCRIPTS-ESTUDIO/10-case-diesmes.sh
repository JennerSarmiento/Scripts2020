#! /bin/bash
# @JennerSarmiento Mendoza
# Sinopsis: 1 mes [1-12] i dies [29,30,31]
# Descripcion: Posar un numero de mes i que digui quants dies té cada mes
#-------------------------------------------------------------------------
ERROR_NARG=1
ERROR_NUM=2
OK=0
#1 Validar el numero d'argument
if [ $# -ne 1 ]
then
  echo "ERROR: $0 només acepta 1 argument."
  echo "USAGE: $0 [1-2]"
  exit $ERROR_NARG
fi

#2 Validar que $1 sigui entre 1 i 12
mes=$1
if ! [ $mes -ge 1 -a $mes -le 12 ]
then
  echo "ERROR: $mes no es numero entre [1-12]"
  echo "USAGE: program.sh [1-2]"
  exit $ERROR_NUM
fi

#3 Case para los siguientes meses
case $mes in
  "2")
    dies=28
    ;;
  "4"|"6"|"9"|"11")
    dies=28
    ;;
  *)
    dies=31  
esac
echo "Mes: $mes --> Dies: $dies"
exit $OK
