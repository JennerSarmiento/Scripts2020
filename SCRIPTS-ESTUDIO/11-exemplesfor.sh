#! /bin/bash
# @JennerSarmiento
# ejemplos de for

#1a) llistar per noms
for noms in "marcos" "anna" "maria" "laura"
do
  echo $noms 
done

#1b) llistar per noms
for noms in "marcos anna maria laura"
do
  echo $noms
done

#2a) iterar per cada argument rebut
for element in $*
do
 echo $element
done

#2b) iterar per cada argument rebut
for elem in $@
do
  echo $elem
done

# 3) iterar per la llista de noms de fitxers que genera ls
myls=$(ls)
for elem in $myls
do
  echo $elem
done

# 4) Llistar els arguments numerats
num=1
for arg in $*
do
  echo "$num : $arg"
  num=$((num+1))
done

# 5) llistat de noms del directori actiu numerat linia a linia
numero=1
lista_ls=$(ls)
for elemento in $lista_ls
do
  echo "$numero : $elemento "
  numero=$((numero+1))
done

# 6) llistar numerats tots els logins
numerado=1
listalogins=$( cut -d: -f1 /etc/passwd | uniq)
for elementor in $listalogins
do
  echo "$numerado : $elementor" 
  numerado=$((numerado+1))
done
