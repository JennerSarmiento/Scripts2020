#! /bin/bash
# Exemples de funcions

suma (){
  echo "La suma es: $(($1+$2))"
  return 0
}
tiempo (){
 date
 return 0
}
