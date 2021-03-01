#! /bin/bash
# @JennerSarmiento Scripts2020
# Febrer 2021
# [-a -b -c -d -f -g] arg[...]
# [opcions]		[arguments]
#opcions:..........|prog:	 -b -c arg1 -d arg2 arg3
#arguments:........|opcions:	-b -c -d
#		   |args: arg1 arg2 arg3
#------------------------------------
#Acumuladors en bash
opcions=""
arguments=""
for arg in pere -a marta -b -c jordi julia
do
  case $arg in
  '-a'|'-b'|'-c')
	 opcions="$opcions $arg";;
  *)
	  arguments="$arguments $args";;
  esac
done
echo "Opcions: $opcions"
echo "Arguments: $arguments"
