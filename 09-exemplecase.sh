#! /bin/bash
# @JennerSarmiento ASIX2020-2021 Scripts2020
# Exemples case
# -----------------------
# dl dt dc dj dv ds dm
case $1 in
  "dl"|"dt"|"dc"|"dj"|"dv")
    echo "és laborable";; 
  "ds"|"dm") 
    echo "és festiu";;
  *)
    echo "és una altra cosa";;
esac
exit 0

# 2) Dir si és vocal, consonant o una altra cosa
case $1 in
  [aeiou])
    echo "és una vocal";;
  [bcdfghjklmnpqrstvwxyz]) 
    echo "és una consonant";;      	  
  *)
    echo "és una altra cosa";;	  
esac	
exit 0

# 1) exemple noms
case $1 in 
  "pere"|"pau"|"joan")
      echo "és un nen";;
  "marta"|"anna"|"julia")
      echo "és una nena"
      ;;
  *)
      echo "indefinit";;
esac
exit 0

