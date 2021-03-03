#! /bin/bash
# @JennerSarmiento Scripts2020
#Processar línia a línia l’entrada estàndard, si 
#la línia té més de 60 caràcters la mostra, si no no.
#----------------------------------------------------
#Utilitzem el while read -r per llegir les línies que utilitzem
num=0
while read -r line
do	
  num=$(echo "$line" | wc -c)
#Posem la funció on la quantitat de caracters sigui superior a 60  
  if [ "$num" -gt 60 ]
  then
    echo $line
  fi	  
done
