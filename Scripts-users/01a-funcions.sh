#! /bin/bash
# @JennerSarmiento ISX 46994723
# Ejemplos de funciones
#-----------------------------------------------

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
    echo "LOGIN--> $login"
    uid=$(echo $linea | cut -d: -f3)
    echo "UID--> $uid"
    gid=$(echo $linea | cut -d: -f4)
    echo "GID--> $gid"
    gecos=$(echo $linea |cut -d: -f5)
    echo "GECOS--> $gecos"
    homedir=$(echo $linea | cut -d: -f6)
    echo "HOME_DIR--> $homedir"
    bash=$(echo $linea | cut -d: -f7)
    echo "BASH--> $bash"
else
       echo "ERROR el usuario $1 no existe"
       return 0       
fi
return 0
}
