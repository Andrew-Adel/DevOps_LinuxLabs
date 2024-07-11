if [ "${#1}" -eq 0 ]; then
    ls
else
    ls "$1"
fi

