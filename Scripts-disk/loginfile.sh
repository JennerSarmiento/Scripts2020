#! /usr/bin
# @Jenner Sarmiento
# Sinopsis: loginfile < file.txt
# Descripció:	Rep com a argument un nom de fitxer que conté un lògin
#		per línia. Mostrar l'ocupació de disc de cada usuari
#		usant fsize. Verificar que es rep un argument i 
#		que és un regular file.
function loginfile(){
  ERROR_NARGS=1
  file=$1
  if [ $# -ne 1 ]
  then
    echo "Error; no hay argumentos."
    return $ERROR_NARGS
  fi
  while read -r line
  do
    fsize $line
  done < $file
}
