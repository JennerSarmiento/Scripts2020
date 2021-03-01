#! /bin/bash
# @albert Pujadas ASIX-M01 Curs 2020-2021
#
# indicar si és o no un directori fitxer o link
# -------------------------------
# si num args no es correcte plegar
ERR_NARGS=1
ERR_NOEXIST=2
if [ $# -ne 1 ]
then
  echo "ERROR: num args incorrecte"
  echo "usage: $0 fit"
  exit $ERR_NARGS
fi
# Xixa
fit=$1
if [ ! -e $fit ]; then
  echo "Error: $fit no existeix"
  exit $ERR_NOEXIST
elif [ -h $fit ]; then 
  echo "$fit symbolic link"
elif [ -f $fit ]; then
  echo "$fit regular file "
elif [ -d $fit ]; then
  echo "$fit directori"
else
  echo "$fit es una altre cosa"
fi
exit 0

