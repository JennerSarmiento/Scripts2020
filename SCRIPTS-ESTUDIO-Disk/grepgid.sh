#! /bin/bash
# @JennerSarmiento
# Descripción:Donat un GID com a argument, llistar els logins dels usuaris
# que petanyen a aquest grup com a grup principal. 
# Verificar que es rep un argument i que és un GID vàlid.
# Sinopsis: grepgid gid
#---------------

function grepgid(){
  ERROR_NARGS=1
  ERROR_GID=2
  STATUS=0
  if [ $# -ne 1 ]
  then
    echo "Error:Numero de argumentos no validos"
    echo "Usage: $0 gid"
    return $ERROR_NARGS
  fi
  gid=$1
  egrep "^[^:]*:[^:]*:$gid:" /etc/group
  if [ $? -ne 0 ]
  then
    echo "Error: $1 no existe"
    echo "Usage: $0 gid"
    return $ERROR_GID
  fi
  egrep "^[^:]*:[^:]*:[^:]*:$gid:" /etc/passwd | cut -d: -f1
  return $STATUS
}
