#otro while ole
CONTADOR=0
while read -r linea
do
	CONTADOR=$(($CONTADOR+1))
	echo "$CONTADOR: $linea"
done
exit 0
