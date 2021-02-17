#! /bin/bash
# JennerSarmiento ASIX2020 Scripts2020
# Febrer 2021
# Fer un programa que ens llista quants dies te el mes pasat per argument.
# Validar 1 o més arguments
# Per cada mes validar el mes [1,12]
# Per cada mes dir el número de dies
# $ programa $arg1 $arg2...
# -------------------------

# CONSTANTS
ERR_NARGS=1
OK=0

# 1) Validem que hi ha un argument:
if [ $# -ne 1 ]
then
  echo "ERROR: nº arguments incorrecte"
  echo "Usage: $0 mes"
  exit $ERR_NARGS
fi

# 2) Xixa:
llista_mes=$1
for mes in $llista_mes
do
  if ! [ $mes -ge 1 -a $mes -le 12 ]
  then
     echo "ERROR: Valor de l'argument no vàlid." >> /dev/stderr
     echo "Usage: $0 mes (valor de l'1 al 12)." >> /dev/stderr
  fi
  case $mes in
      "2")
        dies=28;;
      "4"|"6"|"9"|"11")
        dies=30;;
      *)
        dies=31;;
  esac
done

echo "El mes: $mes, te $dies díes."
exit $OK
