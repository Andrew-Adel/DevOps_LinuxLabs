echo "Enter a Character to be checked"
read char

case $char in
	[A-Z])
		echo "'$char' is a Upper Case Character"
		;;
	[a-z])
		echo "'$char' is a Lower Case Character"
                ;;
        [0-9])
                echo "'$char' is a Number"
                ;;
	*)
                echo "'$char' is not Upper Case Character, Lower Case Character, nor number"
                ;;
esac

