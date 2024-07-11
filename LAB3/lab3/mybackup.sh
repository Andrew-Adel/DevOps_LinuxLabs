dir="$HOME"
files=()
backup_file="$dir/backup_$(date +%Y%m%d).tar.gz"
for item in "$dir"/*; do
	if [ -f "$item" ]; then
		# Add the file path relative to the home directory
		files+=("${item##*/}")
	fi
done
if [ ${#files[@]} -eq 0 ]; then
    echo "No files to backup in $home_dir"
    exit 0
fi
tar -czvf "$backup_file" -C "$dir" "${files[@]}"
echo "Backup of all files in $home_dir completed successfully."
echo "Backup file created at: $backup_file"
