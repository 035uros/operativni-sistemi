#!/usr/bin/env bash

clear
declare -i numFiles
numFiles=$(find . -maxdepth 1 -not -type d | wc --lines)

function makeValidGuess {
	until read -p "Enter your guess:  " guess;
	[[ "$guess" =~ ^[0-9]+$ ]]; do
		echo -e "\nEnter unnegative number!\n"
	done
}

while makeValidGuess; do
	if (( guess < numFiles )); then
		echo -e "\nYour guess is way to low."
	elif (( guess > numFiles )); then
		echo -e "\nYour guess is way too high."
	else
		echo -e "\nBravo! Answer $numFiles is correct!"
		exit
	fi
done

