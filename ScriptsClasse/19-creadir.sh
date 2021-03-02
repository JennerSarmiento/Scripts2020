#! /bin/bash
# @JennerSarmiento Scripts2020
# noudir[...]
# Volem crear-lo -->(si)stdout
#		 -->(no)stderr
# Ordre mkdir no genera cap sortida
#numero de arg 1, tot bé 0, alguns donen error 2:
#--------------------------------------------------
ERROR_NARGS=1
STATUS=0
#1 Validar el numero d'arguments:
if [ $# -lt 1 ]
then
  echo "Error: Numero d'arguments no valids"
  echo "Usage: program.sh noudir[...]"
  exit $ERROR_NARGS
fi


#2) fer ús d'un for per iterar per cada argument i que no mostri per stdout
for argument in $*
do
  mkdir -p $argument &> /dev/null  

  
  if [ $? -eq 0 ]
  then
    echo "El directori $argument s'ha creat."
  else
    echo "El directori $argument no s'ha creat" >> /dev/stderr
    STATUS=2
  fi
done
exit $STATUS

