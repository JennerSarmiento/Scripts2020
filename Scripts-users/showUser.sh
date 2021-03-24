#! /bin/bash
# @JennerSarmiento ISX 46994723
# Ejemplos de funciones
#-----------------------------------------------
# showUser(login)
# mostrar un a un els camps amb label
# --------------------------------------
function showUser(){
 ERR_NARGS=1
 ERR_NOLOGIN=2
 OK=0
 #1) validar arg
 if [ $# -ne 1 ]; then
   echo "Error: num args incorrecte"
   echo "usage: $0 login"
   return $ERR_NARGS
 fi
 #2) validar existeix login
 login=$1
 line=""
 line=$(grep "^$login:" /etc/passwd 2> /dev/null)
 if [ -z "$line" ]; then
   echo "Error: login $login inexist"
   echo "usage: $0 login"
   return $ERR_NOLOGIN
 fi
 #3) mostrar
 uid=$(echo $line | cut -d: -f3)
 gid=$(echo $line | cut -d: -f4)
 gecos=$(echo $line | cut -d: -f5)
 home=$(echo $line | cut -d: -f6)
 shell=$(echo $line | cut -d: -f7)
 echo "login: $login"
 echo "uid: $uid"
 echo "gid: $gid"
 echo "home: $home"
 echo "shell: $shell"
 return 0
}
