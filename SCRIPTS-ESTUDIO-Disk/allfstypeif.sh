#! /bin/bash
# @JennerSarmiento
# Descripcion:LLista per a cada fstype que existeix al fstab (per ordre lexicogràfic) les entrades d'aquest tipus.
# Llistar tabuladament el device i el mountpoint. 
# Es rep un valor numèric d'argument que indica el numéro
# mínim d'entrades d'aquest fstype que hi ha d'haver per sortir al llistat.
# Sinopsis: alltypeif num
#-------------------------
function allfstypeif(){
  OK=0
  ERR_NARGS=1
    if [ $# -ne 1  ]; then
    echo "Error: num args incorrecte"
    echo "Usage: nom_function fstype"
    return $ERR_NARGS
  fi
  min=$1
  fstypeList=$(grep -v "^#" /etc/fstab | tr -s '[:blank:]' ' ' | cut -d' ' -f3 | sort -u)
  for fstype in $fstypeList
  do
    numEntrades=$(grep -v "^#" /etc/fstab | tr -s '[:blank:]' ' ' | grep "^[^ ]* [^ ]* $fstype" | wc -l)
    if [ $numEntrades -ge $min ]; then	    
      echo $fstype
      fstype $fstype
    fi  
  done
  return $OK
}


function fstype(){
  ERROR_NARGS=1
  STATUS=0
  if [ $# -ne 1 ]
  then
    echo "Error: Numero de argumentos no existente."
    echo "Usage: fstype fstype"
    return $ERROR_NARGS
  fi
  fstype=$1
  egrep -v "^#" /etc/fstab | tr -s '[:blank:]' ':' | egrep "^[^:]*:[^:]*:$fstype" | cut -d: -f1,2 | sed -r 's/^(.*)$/\t\1/g'
  return $STATUS
}

