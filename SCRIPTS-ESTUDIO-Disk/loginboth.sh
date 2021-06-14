#! /bin/bash
# @JennerSarmiento
# Descripció: Rep com a argument un file o res (en aquest cas es processa stdin).
# El fitxer o stdin contenen un lògin per línia.
# Mostrar l'ocupació de disc del home de l'usuari. Verificar els arguments rebuts
# Verificar per cada login rebut que és vàlid.
#-----------------------------------------------
function loginboth(){
  file=/dev/stdin
  if [ $# -eq 1 ]
  then
    file=$1
  fi
  while read -r login
  do
    fsize $login
  done < $file
  return 0
}

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

