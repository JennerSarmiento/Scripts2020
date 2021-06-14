#while de otra formacion
MIN=0
num=$1
while [ $num -ge $MIN ]
do
	echo "$num"
	num=$(($num-1))
done
exit 0
