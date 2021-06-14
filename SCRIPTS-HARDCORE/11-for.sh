#ejemplos de for
#Validacion de argumentos almenos de uno

STATUS=0
ERROR_NARGS=1
CONTADOR=0
if [ $# -eq 0 ]
then
	echo "Error, no hay argumentos pendejo."
	exit $ERROR_NARGS
fi

for numero in $*
do
	echo $numero
	CONTADOR=$(($CONTADOR+1))
	echo $CONTADOR
done
exit $STATUS
