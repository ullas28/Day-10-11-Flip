echo "Welcome to Flip Coin Simulation"

HEAD=0
TAIL=0


read -p "Enter the value of flip coins: " num
for (( i=1; i<=$num; i++ ))
do
	Random=$((RANDOM%2))
	if [ $Random -eq 1 ]
	then
#		echo "HEAD is Winner"
		((HEAD++))
	else
#		echo "TAIL is winner"
		((TAIL++))
	fi
done
echo "HEAD won $HEAD times"
echo "TAIL won $TAIL times"
