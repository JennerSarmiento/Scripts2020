#Ejemplo de while
MAX=10
NUM=1
while [ $NUM -lt $MAX ]
do
	echo "$NUM es inferior a $MAX"
	NUM=$(($NUM+1))
done
if [ $NUM -eq $MAX ]
then
	echo "$NUM i $MAX son iguals"
fi
exit 0
