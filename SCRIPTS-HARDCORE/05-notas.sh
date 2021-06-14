#Validacion de notas
STATUS=0
ERROR_NARGS=1
ERROR_NUMERO=2

#Validación de argumentos

if [ $# -ne 1 ]
then
	echo "Error, Numero de argumentos Erròneos."
	echo "Usage: $0 [1-10]"
	exit $ERROR_NARGS
fi

#Error por el $1

if ! [ $1 -ge 0 -a $1 -le 10 ]
then
	echo "Error. La nota valida ha de ser entre 1-10."
	echo "Usage: $0 [1-10]"
	exit $ERROR_NUMERO
fi

nota=$1

if [ $nota -lt 5 ]
then
	echo "Tens una nota inferior a la de l'aprovat."
	echo "Suspès, has d'anar a recuperació"
	exit $STATUS
elif [ $nota -eq 5 ]
then
	echo "Aprovat pelat."

elif [ $nota -lt 6 ]
then
	echo "Tens un bé"

elif [ $nota -le 8 ]
then
	echo "Tens un notable"

elif [ $nota -le 10 ]
then
	echo "Excel·lent!"
fi
exit 0

