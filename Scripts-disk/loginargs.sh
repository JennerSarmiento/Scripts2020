#!/usr/bin
# @JennerSarmiento
# Sinopsis: loginargs login[...]
# Descripció:   Aquesta funció rep logins i per a cada login es mostra
#		l'ocupació de disc del home de l'usuari usant fsize.
#		Verificar que es rep almenys un argument.
#		Per a cada argument verificar si és un login vàlid, 
#		si no generra una traça d'error.
######################################################################
function loginargs(){
ERROR_NARGS=0
  if [ $# -eq 0 ]
  then
    echo "Error. No has puesto ningún argumento"
    return $ERROR_NARGS
  fi
  for login in $*
  do
    home=$(grep "^$login:" /etc/passwd | cut -d: -f6)
    du -hs $home
  done
}
