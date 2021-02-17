# !/bin/bash
# @edt ASIX M01-ISO
# Febrer 2021
<<<<<<< HEAD
# llistar directori si existeix
#---------------------------------------
ERR_NARGS=1
ERR_VALOR=2

# 1) Validem arguments
if [ $# -ne 1 ]
then
  echo "Error: numero arguments incorrecte"
  echo "Usage: $0 dir"
  exit $ERR_NARGS
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

=======
#  $ bash 07-esdirecotri.sh directori
# -------------------------------------
ERR_NARGS=1
ERR_DIREX=2

# Validar que hi ha un argument
if [ $# -ne 1 ]
then
  echo "Error: nºarguments incorrecte"
  echo "Usage: $0 directori"
  exit $ERR_NARGS
fi
directori=$1

if ! [ -d $directori ]
then
  echo "Error: El argument introduit no es un directori existent"
  echo "Usage: $0 directori"
  exit $ERR_DIREX
fi

echo $directori
exit 0
>>>>>>> b63006b6476bc3181fe61e8b035144ac98fc17d9
