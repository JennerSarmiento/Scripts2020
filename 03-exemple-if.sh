#! /bin/bash
# @JennerSarmiento ASIX M01-ISO
# Febrer 2021
# Exemple if: indica si es major d'edat
#	$ prog edat
#------------------------------------------
if [ $# -ne 1 ]
then
  echo "Error: nº arguments incorrectes"
  echo "Usage: $0 edat"
  exit 1
fi
# Xixa
echo $1
exit 0
