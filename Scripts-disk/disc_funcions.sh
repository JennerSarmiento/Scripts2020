#! /bin/bash
# @JennerSarmiento
# Escola del Treball
#----------------------------------

function exemple_llistarv3(){
#numera les linies de stdin o un fitxer rebut com a arg
  file=/dev/stdin
  contador=0
  if [ -$# -eq 1 ]
  then
    file=$1
  fi
  while read -r login
  do
    echo "$contador: $login"
    ((contador++))
  done < $file
}



function exemple_llistarv2(){
   if [ $# -ne 1 ]
   then
     echo "ERROR..."
     return 1
   fi
   file=$1
   contador=0
   while read -r login
   do
     echo "$contador: $login"
     ((contador++))
   done < $file
}
   


function exemple_llistar_max(){
  
  MAX=500
  if [ $# -ne 1 ]
  then
    echo "ERROR..."
    return 1
  fi
  file=$1
  
  while read -r line
  do
    gid=$(echo $line | cut -d: -f4)
    if [ $gid -ge $MAX ]
    then
      echo "$line"
    fi	
  done < $file
}  



  function exemple_llistar(){
  file=$1
  while read -r login
  do
    echo $login
  done < $file
}
