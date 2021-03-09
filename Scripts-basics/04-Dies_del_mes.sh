#! /bin/bash
# @JennerSarmiento M01
# Descripció: Dir quins dies tenen per mes
# ----------------------------------------
ERROR_NARGS=1
ERROR_NMES=2
ok=0

# 1) Validem que hi ha com a mínim un argument:
if [ $# -eq 0 ]
then
  echo "ERROR: nº arguments incorrecte"
  exit $ERR_NARGS
fi

# 2)For para iterar por cada argumento puesto
for mes in $*
do
#Si un numero es diferente de 1-12
  if [ $mes -lt 1 -o $mes -gt 12 ]
  then
    echo "Error: Mes incorrecte, no es [1,12]"
    exit $ERROR_NMES
  else	
    case $mes in 
      "2") echo "28/29 dies";;
      "1"|"3"|"5"|"7"|"8"|"10"|"12") echo "31 dies";;
      "2"|"4"|"6"|"9"|"11") echo "30 dies";;
      *) 
      echo "No es un més[1-12]";;
    esac
  fi
done
