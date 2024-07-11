# Set the path to the mail template file
mail_template="mtemplate"
personalized_template="/tmp/personalized_template"

# Check if the mail template file exists
if [ ! -f "$mail_template" ]; then
    echo "Mail template file not found: $mail_template"
    exit 1
fi

# Get the list of users
users=$(cut -d: -f1 /etc/passwd)

# Loop through all users and send the mail
for user in $users; do
    # Skip system users (optional)
    if id -u "$user" >/dev/null 2>&1 && [ "$(id -u "$user")" -ge 1000 ]; then
        echo "Sending mail to: $user"

        # Personalize the mail template
        sed "s/{{USERNAME}}/$user/g" "$mail_template" > "$personalized_template"

        # Send the mail
        mail -s "System Notification" "$user" < "$personalized_template"
    fi
done

# Remove the temporary personalized template file
rm "$personalized_template"

echo "Mail sent to all users."
