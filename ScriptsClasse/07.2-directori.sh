#! /bin/bash
# @edt ASIX M01-ISO
# Febrer 2021
# llistar el directori si existeix
#   $ prog dir
#   $ prog -h
# -----------------------
ERR_NARGS=1
ERR_VALOR=2

# 1) Validem arguments
if [ $# -ne 1 ]
then
  echo "Error: numero arguments incorrecte"
  echo "Usage: $0 dir"
  exit $ERR_NARGS
fi

#  validar i help
if [ $1 = "-h" ]
then
   echo "Help de la ordre 07-dirrectori"
   echo "@ edt asix m01 curs 2021"
   exit 0
fi

# Validar existeix el directori
mydir=$1
if  [ ! -d $mydir ]
then
  echo "Error: $mydir no es un directori"
  echo "Usage: $0 dir"
  exit $ERR_NODIR
fi

# xixa
ls $mydir
exit 0




