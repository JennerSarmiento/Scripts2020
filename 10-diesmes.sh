#! /bin/bash
# JennerSarmiento ASIX 2020 SCRIPTS2020
# Febrer 2021
# Fer un programa que ens llista quants dies te el mes pasat per argument.
# $ programa $arg
# -------------------------

# CONSTANTS
ERR_NARGS=1
ERR_VALORARG=2
OK=0

# 1) Validem que hi ha un argument:
if [ $# -ne 1 ] 
then
  echo "ERROR: nº arguments incorrecte"
  echo "Usage: $0 mes"
  exit $ERR_NARGS
fi

# 2) Validem que l'argument sigui un número entre l'1 i el 12:
mes=$1
if ! [ $mes -ge 1 -a $mes -le 12 ]
then
  echo "ERROR: Valor de l'argument no vàlid."
  echo "Usage: $0 mes (valor de l'1 al 12)."
  exit $ERR_VALORARG
fi

# 3) XIXA:
case $mes in
    "2")
      dies=28;;
    "4"|"6"|"9"|"11")     
      dies=30;;   
    *)
      dies=31;;
esac

echo "El mes: $mes, te $dies."
exit $OK

