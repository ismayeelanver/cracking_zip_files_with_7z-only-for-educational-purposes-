#!/bin/bash

if ! [ -f /bin/7z ]; then
	echo "7zip not found!"
fi

read -p "Archive name: " archive

read -p "Password list: " list

for i in $(cat $list); do
	7z x -p$i $archive -o./cracked -y
	if [[ $? == 0 ]]; then
		echo "done"
		echo pass: $i
		rm -rf ./cracked
		break
	fi
done
