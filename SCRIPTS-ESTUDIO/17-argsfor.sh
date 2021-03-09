#! /bin/bash
# @JennerSarmiento
# prog [-a -b -c -d -e -f] arg[...]
#-----------
# 1) Comprobar el numero de argumentos
ERROR_NARG=1
if [ $# -eq 0 ]
then
  echo "ERROR:no hay ningun argumento"
  echo "$0 ..."
  exit $ERROR_NARG
fi

# 2)Creamos las 2 listas 
opciones=""
argumentos=""

for arg in $*
do
  case $arg in
  "-a"|"-b"|"-c"|"-d"|"-e"|"-f")
      opcions="$opcions $arg";;
  *)
      arguments="$arguments $arg";;
  esac
done
echo "Opcions: $opcions"
echo "Arguments: $arguments"

