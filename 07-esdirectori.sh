# !/bin/bash
# @edt ASIX M01-ISO
# Febrer 2021
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
