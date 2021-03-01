#! /bin/bash
# @JenerSarmiento  ASIX M01-ASO Curs 2020-2021
# Febrer 2021
# $ llistar-dir.sh dir
# fa un 'ls' del directori rebut
# verificar 1 arg, i que és un dir
# -------------------------------------
ERROR_NARGS=1
ERROR_NODIR=2

# 1) VALIDAR EL NUMERO D'ARGUMENTS
if [ $# -ne 1 ]
then
  echo "Error: número args no vàlid"
  echo "usarge: $0 dir"
  exit $ERROR_NARGS
fi
dir=$1

# 2) VALIDAR SI L'ARGUMENT DONAT ES UN DIRECTORI
if ! [ -d $dir ]
then
  echo "Error: $dir no és un directori"
  echo "usarge: $0 dir"
  exit $ERROR_NODIR
fi

# 3) PROGRAMA
contador=1
fileList=$(ls $dir)
for elem in $fileList
do
  if [ -h $dir/$elem ]
  then
    echo "$contador $elem --> Aquest es un  link"
  elif [ -d $dir/$elem ]
  then
    echo "$contador $elem --> Aquest es un directori"
  elif [ -f $dir/$elem ]
  then
    echo "$contador $elem --> Aquest es un regular file"
  else
    echo "$contador $elem --> Es un altre tipus de file"
  fi 
  contador=$((contador+1))
done
exit 0
