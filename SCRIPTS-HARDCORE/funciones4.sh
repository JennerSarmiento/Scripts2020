#Ultima funcion del examen
STATUS=0
ERROR_FILE=1
file=/dev/stdin

if [ $# -eq 1 ]
then
	file=$1
fi

if ! [ -f "$file" ]
then
	echo "Error; No existe $file"
	echo "Usage: ssh user:host file[...]"
	exit $ERROR_FILE
fi

while read -r line
do
	user=$(echo $line | cut -d' ' -f2 | cut -d: -f1)
	host=$(echo $line | cut -d' ' -f2 | cut -d: -f2)
	files_list=$(echo $line | sed -r 's/^[^ ]* [^ ]* (.*)$/\t\1/')
	sshpass -p guest scp $file_list $user@$host:
done < $file

exit $STATUS
