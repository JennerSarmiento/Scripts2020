#FUNCIONES MAS COMPLICADAS
function allfstypeif(){
	STATUS=0
	ERROR_NARG=1

	#Confirmar el numero de argumentos
	if [ $# -eq 0 ]
	then
		echo "Error: Numero de argumentos erroneos"
		echo "Usage: allfstypeif number"
		return $ERROR_NARG
	fi
	
	#Programa
	MINIMO=$1
    list_fstype=$(egrep -v "^#|^$" /etc/fstab | tr -s '[:blank:]' ':' | cut -d: -f3 | sort | uniq)
	for fstype in $list_fstype
	do
        contador=$(egrep -v "^#|^$" /etc/fstab | tr -s '[:blank:]' ':' | egrep "^[^:]*:[^:]*:$fstype:" | wc -l)
		if [ $contador -ge $MINIMO ]
		then
			echo "FSTYPE: $fstype($contador)"
			fstype $fstype
		fi
	done
	return $STATUS	
}

function allfstype(){
	STATUS=0
	list_fstype=$(egrep -v "^#|^$" /etc/fstab | tr -s '[:blank:]' ':' | cut -d: -f3 | sort | uniq)
	for fstype in $list_fstype
	do
		contador=$(egrep -v "^#|^$" /etc/fstab | tr -s '[:blank:]' ':' | egrep "^[^:]*:[^:]*:$fstype:" | wc -l)
		echo "Fstype: $fstype($contador)"
		fstype $fstype
	done
	return $STATUS
}

function fstype(){
	STATUS=0
	ERROR_NARG=1
	if [ $# -ne 1 ]
	then
		echo "Error: Numero de argumentos erroneos."
		echo "Usage: fstype fstype"
		return $ERROR_NARG
	fi
	fstype=$1
	egrep -v "^#|^$" /etc/fstab | tr -s '[:blank:]' ' ' | egrep "^[^ ]* [^ ]* $fstype" | cut -d' ' -f1,2 | tr '[:lower:]' '[:upper:]' | sed -r 's/^(.*)$/\t\1/g'
	return $STATUS
}

function allgroupsize(){
	while read -r line
	do
		gid=$(echo $line | cut -d: -f3)
		if [ $gid -ge 1000 -a $gid -le 1002 ]
		then
			gidsize $gid
		fi
	done < /etc/group
}

function allgidsize(){
	STATUS=0
	allgids=$(cut -d: -f4 /etc/passwd |sort -g | uniq)
	for gid in $allgids
	do
		gidsize $gid
	done
	return $STATUS
}

function gidsize(){
	STATUS=0
	ERROR_NARG=1
	ERROR_GID=2

	#Confirmar numero de argumentos
	if [ $# -ne 1 ]
	then
		echo "Error: Numero de argumentos erroneo."
		echo "Usage: gidsize gid"
		return $ERROR_NARG
	fi

	gid=$1	
	lista_login=$(egrep "^[^:]*:[^:]*:[^:]*:$gid:" /etc/passwd | cut -d: -f1 | sort)
	
	#Confirmamos que exista el gid
	if [ -z "$lista_login" ]
	then
		echo "Error, no existe este $gid"
		echo "Usage: gidsize gid"
		return $ERROR_GID
	fi
	
	#Bucle de cada login
	for login in $lista_login
	do
		fsize $login
	done
	return $STATUS
}

function grepgid(){
	STATUS=0
	ERROR_NARG=1
	ERROR_GID=2

	#Confirmar numero de argumentos
	if [ $# -ne 1 ]
	then
		echo "Error, numero de argumentos erroneo."
		echo "Usage: grepgid gid"
		return $ERROR_NARG
	fi

	gid=$1
	egrep "^[^:]*:[^:]*:$gid:" /etc/group &> /dev/null
	if [ $? -ne 0 ]
	then
		echo "Error: Este gid no existe."
		echo "Usage: grepgid gid"
		return $ERROR_GID
	fi
	egrep "^[^:]*:[^:]*:[^:]*:$gid" /etc/passwd | cut -d: -f1 | tr '[:lower:]' '[:upper:]'
	return $STATUS
}

function loginboth(){
	STATUS=0
	file=/dev/stdin
	#Si existe un fichero
	if [ $# -eq 1 ]
	then
		file=$1
	fi
	#Si no recibimos nada
	while read -r login
	do
		fsize $login
	done < $file
	return $STATUS
}

function loginfile(){
	STATUS=0
	ERROR_NARG=1
	ERROR_FILE=2
	if [ $# -ne 1 ]
	then
		echo "Error, numero de argumentos erroneo."
		echo "Usage: loginfile file"
		return $ERROR_NARG
	fi

	file=$1
	if ! [ -f "$file" ]
	then
		echo "Error, $file no es un fichero."
		echo "Usage: loginfile file"
		return $ERROR_FILE
	fi
	while read -r login
	do
		fsize $login
	done < $file
	return $STATUS
}

function loginargs(){
        STATUS=0
        ERROR_NARG=1
        ERROR_LOGIN=2
        if [ $# -eq 0 ]
        then
                echo "Error, numero de argumentos erroneo."
                echo "Usage: fsize login"
                return $ERROR_NARG
        fi
        for login in $*
	do
		fsize $login
	done
        return $STATUS
}

function fsize(){
	STATUS=0
	ERROR_NARG=1
	ERROR_LOGIN=2
	if [ $# -ne 1 ]
	then
		echo "Error, numero de argumentos erroneo."
		echo "Usage: fsize login"
		return $ERROR_NARG
	fi
	login=$1
	Dir=""
	Dir=$(egrep "^$login:" /etc/passwd | cut -d: -f6)
	if [ -z "$Dir" ]
	then
		echo "Error, $login no es un user existente."
                echo "Usage: fsize login."
		return $ERROR_LOGIN		
	fi
	du -hs $Dir
	return $STATUS
}
