#! /bin/bash
# @JennerSarmiento Scripts
# Argumento dies de la setmana (dies laborables i festius)
# Si dona error l'arg generar error per stderr
# dl dt dc dj dv ds dm
#-------------------------------------------------------------
ERROR_NARGS=1
#1) Control D'error per arguments
if [ $# -lt 1 ]
then
  echo "ERROR: Numero d'arguments buit"
  echo "Usage: program.sh [...]"
  exit $ERORR_NARGS
fi
#Comencem amb el contador de laborables i festius
laborable=0
festiu=0

#Fer un for per iterar per cada arg
for dia in $*
do
#Utilitzem un case per als dies laborals,festius i els errors
  case $dia in
  d[ltcjv]) 
    laborables=$((laborables+1));;
  ds|dm) 
    festius=$((festius+1));;
#Aquest case té dins per si dona error, enviar-ho per stderror
  *) 
    echo "ERROR: $dia " >> /dev/stderr;; 
  esac
done
echo "laborables: $laborables"
echo "festius: $festius"
