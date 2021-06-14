#Funciones examen
function procesaFitxer(){
	STATUS=0
	file=$1
	lista_servicio=$(tr -s '[:blank:]' '[:]' < $file| cut -d: -f2 | sort -t: -k2 | uniq)
	for service in $lista_servicio
	do
		contador=$(tr -s '[:blank:]' ':' < $file | egrep "^[^:]*:$service" | wc -l)
		echo "Service: $service ($contador)"
		tr -s  '[:blank:]' ' ' < $file | egrep "^[^ ]* $service" | cut -d' ' -f1,3,4,5| sed -r 's/^(.*)$/\t\1/g'
	done
	return $STATUS
}

STATUS=0
ERROR_NARG=1
EXIT=2
ERROR_FILE=3

#Confirmar argumentos
if [ $# -eq 0 ]
then
	echo "Error; Numero de argumentos incorrecto"
	echo "Usage: $0 -h |  $0 --help | $0 file"
	exit $ERROR_NARG
fi

#Si pide ayuda al programa
if [ $# -eq 1 -a $1 = '--help' -o $1 = '-h' ]
then
	echo "Has pedido ayuda al programa"
	echo "Usage: $0 -h | $0 --help | $0 file"
	exit $EXIT
fi

#Confirmar que sea un fichero
if [ -f $1 ]
then
	procesaFitxer $1
else
	echo "Error: Este file no existe"
    echo "Usage: $0 -h |  $0 --help | $0 file"
	exit $ERROR_FILE
fi
exit $STATUS
