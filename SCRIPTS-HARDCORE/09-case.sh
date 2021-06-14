#Ejemplos de case
case $1 in
	"uno"|"tres"|"cinco"|"siete")
		echo "$1 es un numero primo";;
	"dos"|"cuatro"|"seis"|"ocho"|"nueve")
		echo "$1 es un numero no primo";;
esac
exit 0
