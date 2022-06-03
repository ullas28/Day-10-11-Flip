#!/bin/bash

echo -e "Welcome to Flip Coin Simulation\nThis problem displays winning percentage of Head or Tail\nCombination in a Singlet, Doublet and Triplet"
declare -A Dict
read -p "Enter the number to flip a coin : " num

function Case()
{
	case $1 in
		1) echo "H" ;;
        	0) echo "T" ;;
        	11) echo "HH" ;;
        	10) echo "HT" ;;
        	01) echo "TH" ;;
        	00) echo "TT" ;;
        	111) echo "HHH" ;;
        	110) echo "HHT" ;;
        	101) echo "HTH" ;;
        	100) echo "HTT" ;;
        	011) echo "THH" ;;
        	010) echo "THT" ;;
        	001) echo "TTH" ;;
	        000) echo "TTT" ;;

	esac
}
for (( i=1; i<=$num; i++ ))
do
	Random=$((RANDOM%3+1))
	if [ $Random -eq 1 ]
	then
		ran1=$((RANDOM%2))
                ((++Dict[`Case $ran1`]))
        elif [ $Random -eq 2 ]
        then
                ran2=$((RANDOM%2))$((RANDOM%2))
                ((++Dict[`Case $ran2`]))
        else
                ran3=$((RANDOM%2))$((RANDOM%2))$((RANDOM%2))
                ((++Dict[`Case $ran3`]))
        fi
done
i=0
for key in ${!Dict[@]}
do
        val=$(awk "BEGIN{print (${Dict[$key]}/$num * 100)}")
        echo "Percentage of Winning $key is $val"
        array[i++]=$(awk "BEGIN{print (${Dict[$key]}/$num * 100)}")
done
i=0
echo ${array[@]}
for ((i=0; i<num; i++))
do
  for ((j=0; j<i; j++))
  do
    if [[ ${array[$i]} -gt ${array[$j]} ]]
    then
        temp=${array[$j]}
        array[$j]=${array[$i]}
        array[$i]=$temp
    fi
  done
done
echo -e "Ascending order of combinations\n${array[@]}"
echo ${array[0]} is the highest value
