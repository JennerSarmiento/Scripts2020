#! /bin/bash
# Exemples de funcions

#Validar si rep un argument
#Validar existeix user
#mostrar camp per camp

ERROR_NARGS=1
ERROR_USER=2
#1 Validar argumentos

if [ $# -ne 1 ]
then
  echo "Error:Numero de arguments erroni"
  echo "USAGE:program.sh arg1"
  exit $ERROR_NARGS
fi

#2 Validar l'existencia de user
user=$1

grep "^$user:" /etc/passwd &> /dev/null
if [ $? -eq 0 ]
then
  echo $user
else
  echo "ERROR: El usuario $user no existeix al sistema"
  exit $ERROR_USER
fi
exit 0
#3 Mostrar camp per camp

function_user(){
 
} 
