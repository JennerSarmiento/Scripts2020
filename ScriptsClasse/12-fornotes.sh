#! /bin/bash
# @edt ASIX-M01 Curs 2020-2021
# febrer 2021
# Descripcio: processar nota a nota i 
#   - rep 1 o més arguments 
#   - per cada nota [0-10]
#   - indicar si suspès, aprovat, notable o excel·lent
# Synopsis:
#     prog nota[...]
# ---------------------------------

# prog notes[...]
#   - rep 1 o més arguments 
#   - per cada nota [0-10]
#   - per cada nota dir si és suspès, aprovat, notable , excel·lent  (XIXA)

# processant errors en un bucle:
#    a) errors irrecuperables --> msg error, plegar exit nº
#    b) error recuperable --> msg error stderr, continuar


# 1) validar numero d'arguments (if)

# 2) iterar per cada nota (for)
#       2.1) validar la nota   (if/elif/else)
#       2.2) determinar valor     

ERR_NARGS=1
OK=0

# 1) si num args no es correcte plegar
if [ $# -eq 0 ]
then
  echo "ERROR: num args incorrecte"
  echo "usage: $0 nota[...]"
  exit $ERR_NARGS
fi

# 2) iterar per cada nota
for nota in $*
do
  if ! [ $nota -ge 0 -a $nota -le 10 ]
  then
    echo "Error: nota $nota no vàlida [0,10]" >> /dev/stderr
  elif [ $nota -lt 5 ]
  then
    echo "Suspès"
  elif [ $nota -lt 7 ]
  then
    echo "Aprovat"
  elif [ $nota -lt 9 ]
  then
    echo "Notable"
  else
    echo "Excel·lent"
  fi
done

exit $OK


