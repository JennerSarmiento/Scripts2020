#! /bin/bash
# @edt ASIX M01-ISO
# Febrer 2021
# Exemple if: indica si és major d'edat
#   $ prog edat
# -----------------------
# 1) Validem arguments
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

