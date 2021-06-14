#Validar directorio
STATUS=0
ERROR_NARGS=1
ERROR_DIR=2
#Validación de argumentos
if [ $# -ne 1 ]
then
	echo "Error, Numero de argumentos erròneos"
	echo "Usage: $0 dir"
	exit $ERROR_NARGS
fi
directorio=$1
if ! [ -d $1 ]
then
	echo "Error: $1 no es un directorio"
	echo "Usage: $0 dir"
	exit $ERROR_DIR
fi
echo ""
echo "$directorio es un directorio"
echo ""
ls -l $directorio
exit $STATUS
