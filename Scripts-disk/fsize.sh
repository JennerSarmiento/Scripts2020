#!/usr/bin
# @Jenner Sarmiento
# Sinopsis: fsize login
# Descripcion: Donat un login calcula amb du l'ocupació del home de l'user.
# 	       Obtenir el home del /etc/passwd
############################################################################
function fsize(){
  login=$1
  home=$(grep "^$login:" /etc/passwd | cut -d: -f6)
  du -hs $home
}

