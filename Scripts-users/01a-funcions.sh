#! /bin/bash
# Exemples de funcions

#Validar si rep un argument
#Validar existeix user
#mostrar camp per camp

function showuser(){
if [ $# -eq 0 ]
then
	echo "Numero de argumentos no valido"
	return 1
fi
user=$1
linea=$(echo $user| grep "^$user:" /etc/passwd)
if [ $? -eq 0 ]
then 
    login=$(echo $linea | cut -d: -f1)
    echo "login: $login"
    echo "password: x"
    uid=$(echo $linea | cut -d: -f3)
    echo "uid: $uid"
    gid=$(echo $linea | cut -d: -f4)
    echo "gid: $gid"
    gecos=$(echo $linea |cut -d: -f5)
    echo "gecos: $gecos"
    homedir=$(echo $linea | cut -d: -f6)
    echo "homedir: $homedir"
    bash=$(echo $linea | cut -d: -f7)
    echo "bash: $bash"
else
       echo "ERROR el usuario $1 no existe"
       return 0       
fi
return 0
}




function suma(){
	echo "La suma es:"$(($1+$2))
	return 0
}
function dia(){
	echo date
	return 0
}
