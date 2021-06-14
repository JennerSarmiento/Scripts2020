#Tipo de file
#Validación de argumentos
STATUS=0
ERROR_NARG=1
if [ $# -ne 1 ]
then
	echo "Error. Número de argumentos erróneo."
	echo "Usage: $0 something"
	exit $ERROR_NARG
fi

fichero=$1

if [ ! -e $fichero ]
then
	echo "$fichero no existe."
elif [ -h $fichero ]
then
	echo "$fichero es un symbolic link."
elif [ -f $fichero ]
then
	echo "$fichero es un regular file."
elif [ -d $fichero ]
then
	echo "$fichero es un directorio."
fi
exit $STATUS
