
#! /bin/bash
# @JennerSarmiento
# Descripción:Donat un login calcular amb du l'ocupació del home de l'usuari.
# Cal obtenir el home del /etc/passwd.
#-------------------------------------
function fsize(){
  ERROR_NO_LOGIN=2
  STATUS=0
  
  login=$1
  homedir=""
  homedir=$(grep "^$login:" /etc/passwd | cut -d: -f6)
  if [ -z "$homedir" ]
  then
    echo "Error: $login no existe"
    return $ERROR_NO_LOGIN
  fi
  du -hs $homedir
  return $status
}
