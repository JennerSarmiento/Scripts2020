#FUNCIONES
function showAllShells(){
	STATUS=0

	lista_shells=$(cut -d: -f7 /etc/passwd | sort -n | uniq)
	for shell in $lista_shells
	do
		numero=$(grep ":$shell$" /etc/passwd | wc -l)
		if [ $numero -ge 2 ]
		then
			echo "SHELL:$shell	(Numero de veces: $numero)"
			echo ""
			grep ":$shell$" /etc/passwd | cut -d: -f1,3,5,6 | sed 's/:/ /g' | tr '[:lower:]' '[:upper:]' | sort | sed -r 's/^(.*)$/\t\1/'
			echo ""
		fi
	done
	return $STATUS
}

function showAllGroups(){
	STATUS=0
	
	lista_gids=$(cut -d: -f4 /etc/passwd | sort -n | uniq)
	
	for gid in $lista_gids
	do
		numero=$(grep "^[^:]*:[^:]*:[^:]*:$gid" /etc/passwd | wc -l)
		if [ $numero -ge 2 ]
		then
			gname=$(grep "^[^:]*:[^:]*:$gid" /etc/group | cut -d: -f1)
			echo "GID:$gid ($gname)"
			grep "^[^:]*:[^:]*:[^:]*:$gid" /etc/passwd  | cut -d: -f1,3,7 | sed 's/:/ /g' | tr '[:lower:]' '[:upper:]' | sort | sed -r 's/^(.*)$/\t\1/g'
		fi
	done
}

function showGroupMainMembers(){
	STATUS=0
	ERROR_NARG=1
	ERROR_GNAME=2

	#Confirmar el numero de argumentos
	if [ $# -ne 1 ]
	then
		echo "Error: Numero de argumentos erroneos."
		echo "Usage: showGroupMainMembers GNAME"
		return $ERROR_NARG
	fi
	gname=$1
	gid=""
	gid=$(grep "^$gname:" /etc/group | cut -d: -f3)
	if [ -z "$gid" ]
	then
		echo "Error, el GNAME no existe."
		echo "Usage: showGroupMainMembers GNAME"
		return $ERROR_GNAME
	fi
	echo "Lista del grupo $gname($gid)"
	info=$(grep "^[^:]*:[^:]*:[^:]*:$gid:" /etc/passwd | cut -d: -f1,3,5,6,7 | sort -k2g,2 | sed 's/:/ /g' | tr '[:lower:]' '[:upper:]' | sed -r 's/^(.*)$/\t\1/')
	echo $info
	return $STATUS
}

function showUserIn(){
	STATUS=0
  	while read -r login
  	do
    		line=$(grep "^$login:" /etc/passwd 2> /dev/null)
    		if [ $? -ne 0 ] 
		then
      			echo "Error. $login no existe." >> /dev/stderr
      			STATUS=$(($STATUS+1))
    		else
      			uid=$(echo $line | cut -d: -f3)
      			gid=$(echo $line | cut -d: -f4)
      			gname=$(grep "^[^:]*:[^:]*:$gid:" /etc/group | cut -d: -f1)
      			gecos=$(echo $line | cut -d: -f5)
      			home=$(echo $line | cut -d: -f6)
      			shell=$(echo $line | cut -d: -f7)
      			echo "$login $uid $gname($gid) $home $shell"
    		fi
  	done
  	return $STATUS
}

function showUserList(){
	STATUS=0
	ERROR_NARG=1

	#Confirmación del numero de argumentos
	if [ $# -eq 0 ]
	then
		echo "Error, numero de argumentos es 0"
		echo "Usage: showUserList login[...]"
		return $ERROR_NARG
	fi

	#Hacer un bucle de fors por cada usuario puesto
	for user in $*
	do
		user_list=""
		user_list=$(grep "^$user:" /etc/passwd 2> /dev/null)
		if [ -z "$user_list" ]
		then
			echo "$user no existe" >> /dev/stderr
			echo ""
		else
			uid=$(echo $user_list | cut -d: -f3)
			gid=$(echo $user_list | cut -d: -f4)
		        gname=$(grep "^[^:]*:[^:]*:$gid:" /etc/group | cut -d: -f1)
			gecos=$(echo $user_list | cut -d: -f5)
			home=$(echo $user_list | cut -d: -f6)
			shell=$(echo $user_list | cut -d: -f7)
			echo "LOGIN: $user"
			echo "UID: $uid"
			echo "GNAME (GID): $gname($gid)"
			echo "GECOS: $gecos"
			echo "HOME: $home"
			echo "SHELL: $home"
			echo ""
		fi
	done
	return $STATUS
}

function showUserGname(){
	STATUS=0
	ERROR_NARG=1
	ERROR_LOGIN=2
	
	#Comprobación de los argumentos
	if [ $# -ne 1 ]
	then
		echo "Error, falta de argumentos"
		echo "Usage: $0 User"
		return $ERROR_NARG
	fi
	
	#Comprobación del usuario
	user=$1
	user_list=$(grep "^$user:" /etc/passwd )
	if [ -z "$user_list" ]
	then
		echo "Error, $user no existe"
		echo "Usage: showUserGname user"
		return $ERROR_LOGIN
	fi

	#Xixa
	uid=$(echo $user_list | cut -d: -f3)
	gid=$(echo $user_list | cut -d: -f4)
	gname=$(grep "^[^:]*:[^:]*:$gid:" /etc/group | cut -d: -f1)
	gecos=$(echo $user_list | cut -d: -f5)
	home=$(echo $user_list | cut -d: -f6)
	shell=$(echo $user_list | cut -d: -f7)
	echo "USER: $user"
	echo "UID: $uid"
	echo "GID: $gid"
	echo "GNAME: $gname"
	echo "GECOS: $gecos"
	echo "HOME: $home"
	echo "SHELL: $shell"
	return $STATUS
}

function showGroup(){
	STATUS=0
	ERROR_NARG=1
	ERROR_GNAME=2
	#Comprobación de los argumentos
	if [ $# -ne 1 ]
	then
		echo "Error, no hay argumentos"
		echo "Usage: showGroup GNAME"
		return $ERROR_NARG
	fi

 	#validar existeix
 	gname=$1
 	line=""
 	line=$(grep "^$gname:" /etc/group 2> /dev/null)
 	if [ -z "$line" ]; then
 	  echo "Error: gname $gname no existe"
 	  echo "usage: $0 gname"
 	  return $ERR_NOGNAME
 	fi

 	# mostrar
 	gid=$(echo $line | cut -d: -f3)
	userList=$(echo $line | cut -d: -f4)
 	echo "gname: $gname"
 	echo "gid: $gid"
 	echo "userList: $userList"
 	return 0
}

function showUserGecos(){
        STATUS=0
        ERROR_NARG=1
        ERROR_USER=2

        #Comprobación del número de argumentos
        if [ $# -ne 1 ]
        then
                echo "Error, numero de argumentos no existente."
                echo "Usage: showUser User"
                return $ERROR_NARG
                fi

        #Comprobación de la existencia del usuario
        User=$1
        Users=$(grep "^$User:" /etc/passwd 2> /dev/null )
        if [ -z "$Users" ]
        then
        echo "Usage: showUser User"
                return $ERROR_USER
                fi

        #Comprobación de la existencia del usuario
        User=$1
        Users=$(grep "^$User:" /etc/passwd 2> /dev/null )
        if [ -z "$Users" ]
        then
                echo "Error, $User no es un usuario existente"
                echo "Usage: showUser User"
                return $ERROR_USER
        fi
	
	#XIXA
	gecos=$(echo $Users | cut -d: -f5)
	Nombre=$(echo $gecos | cut -d, -f1)
	Oficina=$(echo $gecos | cut -d, -f2)
	Numero_Oficina=$(echo $gecos | cut -d, -f2)
	Numero_Personal=$(echo $gecos | cut -d, -f2)
	
	echo "Login: $User"
	echo "Nombre: $Nombre"
	echo "Oficina: $Oficina"
	echo "Numero_Ofi: $Numero_Oficina"
	echo "Numero_Personal: $Numero_Personal"
	return $STATUS
}

function showUser(){
	STATUS=0
	ERROR_NARG=1
	ERROR_USER=2

        #Comprobación del número de argumentos
        if [ $# -ne 1 ]
        then
                echo "Error, numero de argumentos no existente."
                echo "Usage: showUser User"
                return $ERROR_NARG
                fi

        #Comprobación de la existencia del usuario
        User=$1
        Users=$(grep "^$User:" /etc/passwd 2> /dev/null )
        if [ -z "$Users" ]
        then
	echo "Usage: showUser User"
		return $ERROR_USER
		fi
	
	#Funcion
	uid=$(echo $Users | cut -d: -f3)
	gid=$(echo $Users | cut -d: -f4)
	gecos=$(echo $Users | cut -d: -f5)
	home=$(echo $Users | cut -d: -f6)
	shell=$(echo $Users | cut -d: -f7)
	
	echo "USER: $User"
	echo "UID: $uid"
	echo "GID: $gid"
	echo "GECOS: $gecos"
	echo "HOME: $home"
	echo "SHELL: $shell"
	return $STATUS
}

function hola(){
	echo "Hello World"
	return 0 
}

function dia(){
	date
	cal
	return 0
}

function suma(){
	suma=$(($1+$2))
	echo "$1 + $2 da $suma"
	return 0 
}
