#!/bin/bash

# Initialize flags
has_upper=false
has_lower=false
has_number=false
has_special=false
# Prompt the user for input
echo "Enter a string: "
read input_string

# Loop through each character in the input string
for (( i=0; i<${#input_string}; i++ )); do
	char="${input_string:$i:1}"

	# Check if the character is uppercase
	if [[ "$char" =~ [A-Z] ]]; then
	has_upper=true
	# Check if the character is lowercase
	elif [[ "$char" =~ [a-z] ]]; then
	has_lower=true
	# Check if the character is a number
	elif [[ "$char" =~ [0-9] ]]; then
	has_number=true
	else
	has_special=true
	fi
done

# Determine the type of string based on flags
if $has_upper && ! $has_lower && ! $has_number && ! $has_special; then
    echo "Upper Case: $input_string"
elif ! $has_upper && $has_lower && ! $has_number && ! $has_special; then
    echo "Lower Case: $input_string"
elif ! $has_upper && ! $has_lower && $has_number && ! $has_special; then
    echo "Numbers: $input_string"
elif ($has_upper || $has_lower || $has_number) && ! ($has_special); then
    echo "Mix: $input_string"
else
    echo "Nothing: $input_string"
fi

