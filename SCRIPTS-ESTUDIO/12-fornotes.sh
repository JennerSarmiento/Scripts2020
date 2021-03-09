#! /bin/bash
# @JennerSarmiento
# fornotes.sh
# $*
#----------------------
ERROR_NARG=1
ERROR_NONUM=2
OK=0
#1 Confirmar el numero de argumentos
if [ $# -eq 0 ]
then
  echo "ERROR: no hay argumentos"
  echo "USAGE: $0 [...]"
  exit $ERROR_NARG
fi

#2 Confirmar que siguin numero els arguments i iterar per arg
for nota in $*
do
  if ! [ $nota -ge 0 -a $nota -le 10 ]
  then
    echo "ERROR:Les notes han de tenir entre 0 i 10" >> /dev/stderr
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
