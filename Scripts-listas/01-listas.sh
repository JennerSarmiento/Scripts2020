#! /bin/bash
# @JennerSarmiento Scripts2020
# Descripcion:1) Processar els arguments i mostrar per stdout només els 
#de 4 o més caràcters.
#-----------------------------------------------------------------------
ERROR_NARG=1
#1) Confirmar que los arg sean superiores a 0
if [ $# -eq 0 ]
then
	echo "ERROR:numero d'arguments inexistents."
	echo "USAGE: $0 [...]"
	exit $ERROR_NARG
fi
	
# 2) Programa
for arg in $*
do
  echo $arg | egrep '.{4,}'
done
exit 0
