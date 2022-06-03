#!/bin/bash
echo "Welcome to Flip Coin Simulation"

HEAD=0
TAIL=0

while [[ $HEAD -lt 21 && $TAIL -lt 21 ]]
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
echo "HEAD comes $HEAD times"
echo "TAIL comes $TAIL times"
if [ $HEAD -gt $(($TAIL+2)) ]
then
	diff=$(($HEAD-$TAIL))
	echo "HEAD won by $diff times more than TAIL"
elif [ $TAIL -gt $(($HEAD+2)) ]
then
	diff=$(($TAIL-$HEAD))
	echo "TAIL won by $diff times more than HEAD"
else
	echo "IT'S TIE since their DIFFERENCE IS LESS-THAN-EQUAL-TO 2"
	echo "By again flipping to make difference >2"
        while [ 1 ]
        do
                RandomTwo=$((RANDOM%2))
                if [ $RandomTwo -eq 1 ]
                then
                        ((++HEAD))
                else
                        ((++TAIL))
                fi
                dif1=$(($HEAD-$TAIL))
                dif2=$(($TAIL-$HEAD))
                if [[ $dif1 -gt 2 || $dif2 -gt 2 ]]
                then
                        break;
                fi
        done
        echo "HEAD comes $HEAD times"
        echo "TAIL comes $TAIL times"
        if [ $HEAD -gt $(($TAIL)) ]
        then
        dif=$(($HEAD-$TAIL))
        echo "HEAD won by $dif times more than TAIL"
        else
        dif=$(($TAIL-$HEAD))
        echo "TAIL won by $dif times more than HEAD"
        fi
fi
