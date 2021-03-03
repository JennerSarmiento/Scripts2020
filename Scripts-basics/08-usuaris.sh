#! /bin/bash
# @JennerSarmiento Scripts2020
# Usuaris en /etc/passwd
# Si es error enviar per stderr
#--------------------------------
ERROR_NARGS=0
#1) Confirmar arguments
if [ $# -lt 1 ]
then
  echo "ERROR:Valor d'arguments erroni"
  echo "Usage: program.sh [...]"
  exit $ERROR_NARGS
fi
#2) Iterar per els usuaris
for user in $*
do
#3) Utilitzem el grep per veure els $user
#Si dona error enviar per /dev/null
grep "^$user:" /etc/passwd &> /dev/null
if [ $? -eq 0 ]
then
  echo $user
else
  echo $user >> /dev/stderr
fi
done
