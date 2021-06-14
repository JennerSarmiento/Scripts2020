#! /bin/bash
# @JennerSarmiento
# Descripcion: Aquesta funció rep logins i per a cada login es mostra l'ocupació
#de disc del home de l'usuari usant fsize. Verificar que es rep almenys un argument.
#Per a cada argument verificar si és un login vàlid, si no generra una traça d'error.
# Sinopsis: loginargs login [...]
#----------------------------
function loginargs(){
  ERROR_NARGS=1
  STATUS=0
  if [ $# -eq 0 ]
  then
    echo "Error:Numero de argumentos no disponible"
    echo "Usage: loginargs"
    return $ERROR_NARGS
  fi
  for login in $*
  do	  
    fsize $login
  done
  return $STATUS
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
