#! /bin/bash
# @JennerSarmiento
# llistar amb ls el directori
# ----------------------------
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
cont=1
fileList=$(ls $dir)
for elem in $fileList
do
  if [ -h $dir/$elem ]
  then
    echo "$cont $elem link"
  elif [ -d $dir/$elem ]
  then
    echo "$cont $elem dir"
  elif [ -f $dir/$elem ]
  then
    echo "$cont $elem regular"
  else
    echo "$cont $elem altres"
  fi 
  ((cont++))
done
exit 0



