#! /bin/bash
# copy.sh file[...] dir-destí
# validar args, dir-destí
# validar file regular file
# ----------------------------
ERR_NARGS=1
ERR_NODIR=2
ERR_NOREGULARFILE=3
OK=0
#1) Validar nargs
if [ $# -lt 2 ]; then
  echo "Error: num args incorrecte"
  echo "usage $0 file[...] dir-destí"
  exit $ERR_NARGS
fi
desti=$(echo $* | sed 's/^.* //' )
llistaFile=$(echo $* | sed 's/ [^ ]*$//')
# 2) dir-desti existeix
if [ ! -d $desti ]; then
  echo "Error: $desti no és un directori"
  echo "usage $0 file dir-destí"
  exit $ERR_NODIR
fi
# XIXA
for file in $llistaFile
do
  if [ ! -f $file ]; then
    echo "Error: $file no és un regular file" >> /dev/stderr
    echo "usage $0 file[...] dir-destí" >> /dev/stderr
  fi
  cp $file $desti
done
