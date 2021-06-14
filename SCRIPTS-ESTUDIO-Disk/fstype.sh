#! /bin/bash
# @JennerSarmiento
# Descripció:Donat un fstype llista el device
# i el mountpoint (per odre de device) de les 
# entrades de fstab d'quest fstype.
# Sinopsis: fstype $1
#---------------------------------------------
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
