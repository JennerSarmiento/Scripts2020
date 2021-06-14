#Procesar por argumento las notas y poner lo que saldrá en el boletín
STATUS=0
ERROR_NARGS=1
#Confirmar el numero de argumentos
if [ $# -eq 0 ]
then
	echo "Error, número de argumentos no existe"
	echo "Usage: $0 ..."
	exit $ERROR_NARGS
fi

#Bucle del for
for nota in $*
do
	if ! [ $nota -ge 0 -a $nota -le 10 ]
	then
		echo "Error, $nota no es una nota valida" >> /dev/stderr
		echo "Usage: $0 [0-12] [0-12] [0-12]..." >> /dev/stderr
	elif [ $nota -lt 5 ]
	then
		echo "$nota es Suspendido, toca recuperar"
	elif [ $nota -eq 5 ]
	then
		echo "$nota es Aprobado"
	elif [ $nota -eq 6 ]
	then
		echo "$nota es Bien"
	elif [ $nota -le 8 ]
	then
		echo "$nota es Notable"
	elif [ $nota -le 10 ]
	then
		echo "$nota es Excelente."
	fi
done
exit $STATUS
