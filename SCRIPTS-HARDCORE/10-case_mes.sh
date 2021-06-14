#Calculadora de dias
STATUS=0
ERROR_NARGS=1
ERROR_NUMERO=2
#Confirmar el numero de argumentos

if [ $# -ne 1 ]
then
	echo "Error, numero de argumentos erròneo."
	exit $ERROR_NARGS
fi

mes=$1

# Meses en valores de [ 1-12 ]

if ! [ $mes -ge 1 -a $mes -le 12 ]
then
	echo "Error, $1 no es un mes."
	echo "Usage: $0 [1-12]"
	exit $ERROR_NUMERO
fi

case "$mes" in 
	"2")
		echo "$mes Tiene 28 dias.";;
	"4"|"6"|"9"|"11")
		echo "$mes Tiene 30 dias.";;
	*)
		echo " $mes Tiene 31 dias";;
esac

exit $STATUS
