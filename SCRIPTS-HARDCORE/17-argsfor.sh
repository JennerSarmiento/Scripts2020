#Args for; separa en 2 llistes:
#args
#opcions

STATUS=0
ERROR_NARGS=1

#Confirmar que haya almenos un argumento:
if [ $# -eq 0 ]
then
	echo "Error, numeros de argumentos no erroneos."
	echo "Usage: [-a -b -c -d -e -f] arg[...]"
	exit $ERROR_NARGS
fi

#Creacion de las listas vacias
opciones=""
argumentos=""

#Xixa
for arg in $*
do
	case $arg in
		"-a"|"-b"|"-c"|"-d"|"-e"|"-f")
			opciones="$opciones $arg";;
		*)
		argumentos="$argumentos $arg";;
	esac
done
echo "Opciones finales : $opciones ."
echo "Argumentos finales: $argumentos ."
exit $STATUS
