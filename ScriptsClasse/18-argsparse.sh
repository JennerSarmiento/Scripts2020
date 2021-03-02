#! /bint/bash
# @JennerSarmiento Scripts2020
# [-a file -b -c -bnum -e] arg[...]
#Programa que procesa opcions amb valor i arguments
#---------------------------------------------------

opcions=''
args=''
file=''
num=''
while [ -n "$1" ]
do 
  case $1 in 
    -[bce])
	     opcions="$opcions $1";;   
     -a)
	     file=$2
	     shift;;
     -d)
	     num=$2
	     shift;;
     *)
	     args="$args $1";;

  esac
  shift
done
echo "Opcions: $opcions"
echo "Arguments: $args"
echo "File: $file"
echo "Num: $num"
exit 0
