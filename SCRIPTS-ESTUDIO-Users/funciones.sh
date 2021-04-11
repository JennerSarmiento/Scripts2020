#! /bin/bash
# @JennerSarmiento
# 11/05/2021

# 6) showUserIn < fileIn
function showUserIn(){
STATUS=0
  
  while read -r login
  do
    usuario=$(grep "^$login:" /etc/passwd 2> /dev/null)
    if [ $? -ne 0 ]
    then
      echo "Error: Usuario no existente." >> /dev/stderr
      STATUS=$((STATUS+1))
    else
     user=$(echo $usuario | cut -d: -f1)
     passwd=$(echo $usuario | cut -d: -f2)
     uid=$(echo $usuario | cut -d: -f3)
     gid=$(echo $usuario | cut -d: -f4)
     gname=$(grep "^[^:]*:[^:]*:$gid:" /etc/group | cut -d: -f1)
     gecos=$(echo $usuario | cut -d: -f5)
     homedir=$(echo $usuario | cut -d: -f6)
     shell=$(echo $usuario | cut -d: -f7)
     echo "User: $user"
     echo "Passwd: $passwd"
     echo "Uid: $uid"
     echo "Gid: $gid"
     echo "Gname: $gname"
     echo "Gecos: $gecos"
     echo "Homedir: $homedir"
     echo "Shell: $shell"
     echo ""
   fi
  done
  return $STATUS
}
# 5) showUserList login [...]
function showUserList(){
  ERROR_NARGS=1
  ERROR_LOGIN=2
  if [ $# -eq 0 ]
  then
    echo "Error: No has colocado ningún login"
    echo "Usage: showUserList login[...]"
    return $ERROR_NARGS 
  fi

  for user in $*
  do
    usuario=""  
    usuario=$(grep "^$user:" /etc/passwd 2> /dev/null)
 
   if [ -z "$usuario" ]
   then
     echo "Error: $usuario no existente" >> /dev/stderr
  
   else
     user=$(echo $usuario | cut -d: -f1)
     passwd=$(echo $usuario | cut -d: -f2)
     uid=$(echo $usuario | cut -d: -f3)
     gid=$(echo $usuario | cut -d: -f4)
     gname=$(grep "^[^:]*:[^:]*:$gid:" /etc/group | cut -d: -f1)
     gecos=$(echo $usuario | cut -d: -f5)
     homedir=$(echo $usuario | cut -d: -f6)
     shell=$(echo $usuario | cut -d: -f7)
     echo "User: $user"
     echo "Passwd: $passwd"
     echo "Uid: $uid"
     echo "Gid: $gid"
     echo "Gname: $gname"
     echo "Gecos: $gecos"
     echo "Homedir: $homedir"
     echo "Shell: $shell"
  	 echo ""
   fi
  done
  return 0
}

# 4) showUserGname login

function showUserGname(){
  login=$1
  ERROR_NARGS=1
  ERROR_LOGIN=2

#Comprobacion de argumentos 
  if [ $# -ne 1 ]
  then
    echo "Error: No has colocado ningun argumento."
    echo "Usage: showUserGname login"
    return $ERROR_NARGS	
  fi
  
#Filtro del usuario
  usuario=""
  usuario=$(grep "^$login:" /etc/passwd 2> /dev/null)
  if [ -z "$usuario" ]
  then
    echo "Error: $login no existente."
    echo "Usage: showUserGname login"
    return $ERROR_LOGIN
  fi

#Mostrar los contenidos
  user=$(echo $usuario | cut -d: -f1)
  passwd=$(echo $usuario | cut -d: -f2)
  uid=$(echo $usuario | cut -d: -f3)
  gid=$(echo $usuario | cut -d: -f4)
  gname=$(grep "^[^:]*:[^:]*:$gid:" /etc/group | cut -d: -f1)
  gecos=$(echo $usuario | cut -d: -f5)
  homedir=$(echo $usuario | cut -d: -f6)
  shell=$(echo $usuario | cut -d: -f7)
  echo "User: $user"
  echo "Passwd: $passwd"
  echo "Uid: $uid"
  echo "Gid: $gid"
  echo "Gname: $gname"
  echo "Gecos: $gecos"
  echo "Homedir: $homedir"
  echo "Shell: $shell"
  return 0
}

# 3) showGroup gname

function showGroup(){
  gname=$1
  ERROR_NARGS=1
  ERROR_GNAME=2

#confirmacion del numero de argumentos
  if [$# -ne 1 ]
  then
    echo "Error: No has puesto ningún gname."
    echo "Usage: showGroup gname"
    return $ERROR_NARGS
  fi
#filtro del gname
  groupname=""
  groupname=$(grep "^$gname:" /etc/group 2> /devnull)
  if [ -z "$groupname" ]
  then
     echo "Error: $gname no es un GroupName"
     echo "Usage: showGroup gname"
    return $ERROR_GNAME
  fi
  
#Mostrar los resultado:
  gruponame=$(echo $groupname | cut -d: -f1)
  passwd=$(echo $groupname | cut -d: -f2)
  gid=$(echo $groupname | cut -d: -f3)
  users=$(echo $groupname | cut -d: -f4)
  echo "Gname: $gruponame"
  echo "Passwd: $passwd"
  echo "GID: $gid"
  echo "Users: $users"
  return 0
} 




# 2)showUserGecos login
function showUserGecos(){
  login=$1
  ERROR_NARGS=1
  ERROR_LOGIN=2

#confirmacion de los argumentos
  if [ $# -ne 1 ]
  then
    echo "Error: No has puesto ningun usuario."
    echo "Usage: showUser login"
    return $ERROR_NARGS
  fi
#filtro de login
  usuario=""
  usuario=$(grep "^$login:" /etc/passwd 2> /dev/null)
  if [ -z "$usuario" ]
  then
    echo "Error: $login no existe."
    echo "Usage: showUser login"
    return $ERROR_LOGIN
  fi
  gecos=$(echo $usuario | cut -d: -f5)
  name=$(echo $gecos | cut -d, -f1)
  office=$(echo $gecos | cut -d, -f2)
  phoneoffice=$(echo $gecos | cut -d, -f3)
  phonehome=$(echo $gecos | cut -d, -f4)
  
  echo "Usuario: $usuario"
  echo "GECOS:"
  echo "Name: $name"
  echo "Office: $office"
  echo "PhoneOffice: $phoneoffice"
  echo "PhoneHome: $phonehome"
  return 0
}

# 1)showUser login
function showUser(){
  login=$1
  ERROR_NARGS=1
  ERROR_LOGIN=2

#confirmacion de los argumentos
  if [ $# -ne 1 ]
  then
    echo "Error: No has puesto ningun usuario."
    echo "Usage: showUser login"
    return $ERROR_NARGS
  fi
#filtro de login
  usuario=""
  usuario=$(grep "^$login:" /etc/passwd 2> /dev/null)
  if [ -z "$usuario" ]
  then
    echo "Error: $login no existe."
    echo "Usage: showUser login"
    return $ERROR_LOGIN
  fi
#se muestre las caract del login
  uid=$(echo $usuario | cut -d: -f3)
  gid=$(echo $usuario | cut -d: -f4)
  gecos=$(echo $usuario | cut -d: -f5)
  homedir=$(echo $usuario | cut -d: -f6)
  shell=$(echo $usuario | cut -d: -f7)
  echo "Login: $login"
  echo "Password: x"
  echo "UID: $uid"
  echo "GID: $gid"
  echo "Gecos: $gecos"
  echo "Homer_dir: $homedir"
  echo "Shell: $shell"
  return 0
}

