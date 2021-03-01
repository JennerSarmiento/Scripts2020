#! /bin/bash
# @edt ASIX M01-ASO Curs 2020-2021
# Febrer 2021
# $ llistar-dir.sh dir
# fa un 'ls' del directori rebut
# verificar 1 arg, i que és un dir
# -------------------------------------
ERR_NARGS=1
ERR_NODIR=2
# 1) validar arguments
if [ $# -ne 1 ]
then
  echo "Error: número args no vàlid"
  echo "usarge: $0 dir"
  exit $ERR_NARGS
fi
dir=$1
# 2) validar arg és un dir
if ! [ -d $dir ]
then
  echo "Error: $dir no és un directori"
  echo "usarge: $0 dir"
  exit $ERR_NODIR
fi
# 3) xixa
num=1
fileList=$(ls $dir)
for file in $fileList
do
  echo "$num $file"
  num=$((num+1))
done
exit 0



