#!/bin/bashif [ "$1" == "" -o "$2" == "" ]; then	echo "Usage: ./$0 <Compacted File> <Wordlist>" 1>&2;	exit 1fiFILE=$1WORDLIST=$2if [ ! -e $FILE ]; then	echo "The parameter [$FILE] is not a file!" 1>&2;	exit 1fiif [ ! -e "$WORDLIST" ]; then	echo "The parameter [$WORDLIST] is not a file!" 1>&2;	exit 1fiCOUNTER=0for pass in $(cat $WORDLIST);do	CMD=$(7z t -p$pass $FILE 2>&1 | grep 'password')	if [ "$CMD" == "" ]; then		echo "Password found: $pass"		exit 0;	fi	if [ $(($COUNTER%5)) -eq 0 ];then		echo "Verifed Passwords: $COUNTER";	fi;	COUNTER=$(($COUNTER+1))doneecho "Not password found!"
