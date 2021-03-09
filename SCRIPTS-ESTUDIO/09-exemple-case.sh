#! /bin/bash
# @JennerSarmiento
# Exemples de case
case $1 in
  "lunes"|"martes"|"miercoles"|"jueves"|"viernes")
    echo "$1 es un dia laboral"
    ;;
  "sabado"|"domingo")
    echo "$1 es un dia libre"
    ;;
esac
exit 0

case $1 in
  [aeiou])
    echo "és una vocal";;
  [bcdfghjklmnpqrstvwxyz])
    echo "és una consonant";;
  *)
    echo "és una altra cosa";;
esac
exit 0


