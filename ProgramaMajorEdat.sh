#! /bin/bash
# @JennerSarmiento M01-ISO
# Febrer2021
# Exemple: Saber si una persona es major d'edat o no.
# $ prog edat
#---------------------------------------
if [ $# -ne 1 ]
then
  echo "Error: #arguments incorrecte"
  echo "Usage: $0 edat"
  exit 1
fi

# xixa
edat=$1
if [ $edat -ge 18 ]
then
  echo "Edat $edat major d'edat"
fi
exit 0

