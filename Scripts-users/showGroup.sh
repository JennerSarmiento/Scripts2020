#! /bin/bash
# @JennerSarmientoMendoza
# Data: 24 de Març de 2021
# Descripció: Rebut un login per argument mostrar camp a
#camp les dades del GECOS de l’usuari (etiqueta i valor del camp).
#Validar que es rep almenys un argument.
#Validar que és un login vàlid.
#--------------------------------------------------------------------
function showGroup(){
OK=0
ERROR_NARGS=1
ERROR_GNAME=2

if [ $# -ne 1 ]
then
  echo "ERROR:Numero de argumentos no validos"
  echo "Usage: program.sh login"
  return $ERROR_NARGS
fi
gname=$1
linea=$(grep "^$gname:" /etc/group 2> /dev/null)
if [ -z $linea ]
then
  echo "ERROR: GNAME inexistent"
  echo "USAGE: program.sh gname"
  return $ERROR_GNAME
fi
password=$(echo $linea | cut -d: -f2)
gid=$(echo $linea | cut -d: -f3)


echo "GNAME ---> $gname"
echo "Password--> $password"
echo "GID ---> $gid "
return $OK
}
