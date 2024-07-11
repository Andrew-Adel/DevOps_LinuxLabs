dir="$HOME"
for item in "$dir"/*; do
	if [ -f "$item" ] || [ -d "$item" ]; then
		chmod +x "$item"
		echo "add execute permission for item: $item"
	fi
done
echo "All files and directories in $dir have been given execute permissions."


