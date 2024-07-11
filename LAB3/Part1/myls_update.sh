# Initialize options and directory variables
OPTIONS=""
DIRECTORY=""

if [ "${#1}" -eq 0 ]; then
    ls
else
    for ARG in "$@"; do
        case "$ARG" in
            -*)
                OPTIONS+="$ARG "
                ;;
            *)
                DIRECTORY="$ARG"
                ;;
        esac
    done
    ls $OPTIONS $DIRECTORY
fi

