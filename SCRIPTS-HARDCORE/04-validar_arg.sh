#Si el numero de argumentos es inferior a 2, terminar el bash
STATUS=0
ERROR_NARGS=1
if [ $# -ne 2 ]
then
	echo "Error. Número de argumentos erròneos"
	echo "Tienen que ser 2 argumentos"
	exit $ERROR_NARGS
fi
echo "Los 2 argumentos son : $1 , $2"
exit $STATUS
