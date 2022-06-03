#!/bin/bash
echo -e "Welcome to Flip Coin Simulation\nThis problem displays winning percentage of Head or Tail\nCombination in a Singlet, Doublet and Triplet"

declare -A Coin
read -p "Enter the number to flip a coin : " num

for (( i=1; i<=$num; i++ ))
do
	Random=$((RANDOM%2))
	if [ $Random -eq 1 ]
	then
		#echo "IT IS HEAD"
		((Coin[H]++))
	else
		#echo "IT IS TAIL"
		((Coin[T]++))
	fi
done

echo "HEAD COMES ${Coin[H]} times & TAIL comes ${Coin[T]} times"

PercntgHead=$(awk "BEGIN{print (${Coin[H]}/$num * 100)}")
PercntgTail=$(awk "BEGIN{print (${Coin[T]}/$num * 100)}")

echo "Percentage of Winning HEAD out of flipping $num times is $PercntgHead"
echo "Percentage of Winning TAIL out of flipping $num times is $PercntgTail"
