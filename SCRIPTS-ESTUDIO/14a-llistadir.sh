#! /bin/bash
# @JennerSarmiento
# llistar amb ls el directori
# ----------------------------
ERROR_NARG=1
# 1)Confirmar que sigui un argument
if ! [ $# -eq 1 ]
then
  echo "ERROR: Numero de argumentos no valido"
  echo "USAGE: $0 dir"
  exit $ERROR_NARG
fi

# 2) Confimar que sigui un directori
dir=$1
if ! [ -d $dir ]
then
  echo "ERROR: No es un directori"
  echo "USAGE: $0 dir"
  exit $ERROR_DIR
fi
# 3)
ls $dir
exit 0
