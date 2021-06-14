#! /bin/bash
# @JennerSarmiento
#
# Descripcion:Rep com a argument un nom de fitxer que conté un lògin per línia. 
# Mostrar l'ocupació de disc de cada usuari usant fsize. 
# Verificar que es rep un argument i que és un regular file.
#
# Sinopsis: loginfile file.txt
#---------------------------------------
function loginfile(){
  ERROR_NARGS=1
  ERROR_NO_FILE=2
  STATUS=0
  if [ $# -ne 1 ]
  then
    echo "Error: Número de argumentos no recibidos."
    echo "Usage: $0 file.txt"
    return $ERROR_NARGS
  fi
  file=$1
  if [ ! -f "$file" ]
  then
    echo "Error: No es un file"
    echo "Usage: $0 file.txt"
    return $ERROR_NO_FILE
  else 
    while read -r login
    do
      echo "$login:"
      fsize $login
    done < $file
  fi
}

function fsize(){
  ERROR_LOGIN=1
  STATUS=0
  login=$1
  home=""
  home=$(egrep "^$login:" /etc/passwd | cut -d: -f6)
  if [ -z $home ]
  then
    echo "Error: $1 no es un login"
    echo "Usage: $0 login"
    return $ERROR_LOGIN
  fi
  du -hs $home
  return $STATUS

}
