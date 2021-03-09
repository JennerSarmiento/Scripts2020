#! /bin/bash
# @JennerSarmiento
# Descripcion:9. Fer un programa que rep per stdin noms d’usuari 
#(un per línia), si existeixen en el sistema (en el fitxer /etc/passwd)
#mostra el nom per stdout. Si no existeix el mostra per stderr.
#----------------------------------------------------------------------
contador=0
# 1) Confirmar que siguin usuaris
while read -r user
do
  egrep "^$user:" /etc/passwd 
  if [ $? -ne 0 ]
  then
    echo $user >> /dev/stderr
    ((contador++))
  fi
done
echo "Usuaris que no es troben al sistema -->$contador"
exit 0
