#ls del directorio recibido
STATUS=0
ERROR_NARGS=1
ERROR_DIR=2
numero=1
#Confirmar el numero de argumentos
if ! [ $# -eq 1 ]
then
	echo "Error, numero de argumentos erroneos."
	echo "Usage: $0 dir"
	exit $ERROR_NARGS
fi

#Confirmar que sea un directorio
directorio=$1
if ! [ -d $directorio ]
then
	echo "Error, $directorio no es un directorio"
	echo "Usage: $0 dir"
	exit $ERROR_DIR
fi

lista=$(ls $directorio)
for linea in $lista
do
	echo "$numero: $linea"
	numero=$(($numero+1))
done
exit $STATUS

