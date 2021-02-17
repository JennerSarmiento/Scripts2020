#! /bin/bash
# @JennerSarmiento ASIX M01 Script2020
# febrer 2020
#Descripció:
#for var in llista-de-valors
#do
#	accions
# done

# 6) llistar numerats tots els logins
llista_noms=$(cut -d: -f1 /etc/passwd)
num=1
for elem in $llista_noms
do
  echo "$num: $elem"
  ((num++))
done
exit 0

# 5) llistat de noms del directori actiu numerat línia per línia
llista_noms=$(ls)
num=1
for elem in $llista_noms
do
  echo "$num: $elem"
  ((num++))
done
exit 0

# 4) llistar els arguments numerats
num=1
for arg in $*
do
  echo "$num: $arg"
  num=$((num+1))
done
exit 0

# 3) iterar per la llista de noms de fitxers que genera ls
llista_noms=$(ls)
for elem in $llista_noms
do
  echo $elem 
done
exit 0
# 2) iterar per cada argument rebut
for arg in $@
do
  echo $arg
done
exit 0

# 1b) Iterar una llista de noms
for nom in "pere marta anna ramón"
do
  echo $nom
done
exit 0

# 1) Iterar una llista de noms
for nom in "pere" "marta" "anna" "ramón"
do
  echo $nom
done
exit 0
