#! /bin/bash
#  @Jenner Sarmiento
#  Sinopsis:loginboth "file.txt or nothing"
#  Descripcion:		Rep com a argument un file o res 
#			(en aquest cas es processa stdin). El fitxer
#			o stdin contenen un lògin per línia.
#			Mostrar l'ocupació de disc del home de l'usuari.
#			Verificar els arguments rebuts.
#			verificar per cada login rebut que és vàlid.
#####################################################################
function loginboth(){
ERROR_NARGS=1
file=/dev/stdin
  if [ $# -eq 1 ]
  then
    file=$1
  fi
  while read -r line
  do
    login=""
    login=$(grep "^$line:" /etc/passwd | cut -d: -f1)
    if [ -z $login ]
    then
	    echo "Error; $login no trobat" > /dev/stderr
    fi
    home=$(grep "^$line:" /etc/passwd | cut -d: -f6)
    echo $login| tr '[:lower:]' '[:upper:]'
    du -hs $home
  done < $file
}
