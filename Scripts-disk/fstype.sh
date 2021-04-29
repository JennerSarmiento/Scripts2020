#! /bin/bash
# @JennerSarmiento at "Scripts2020"
#Sinopsis:fstype fstype[...]
#Descripció: 	Donat un fstype llista el device i el mountpoint 
#		(per odre de device) de les entrades de fstab d'quest fstype.
#######
function fstype(){
  ERROR_NARGS=1
  if [ $# -eq 0 ];
  then
    echo "Error, no has posat ningún argument."
    return $ERROR_NARGS
  fi
  for fstype in $*
  do
    grep "^$fstype /etc/fstab"
    if [ $? -eq 0 ]
    then
       egrep -v "^#|^$" /etc/fstab| tr -s '[:blank:]' '\t'| cut -d$'\t' -f1,2 
    fi
  done
}
