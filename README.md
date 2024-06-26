lab1 from devops diploma on DEPI
## create user
```javascript
sudo useradd -m -c "my name is Andrew Adel" -s /bin/bash -p $(openssl passwd -1 "Andrew") AndrewAdel
```
sudo: Runs the command with superuser privileges.
useradd: The command to add a new user.
* -m: Creates a home directory for the new user.
* -c "Fullname/comment": Adds a comment (often used to store the full name of the user).
* -s /bin/bash: Specifies the user's login shell.
* -p $(openssl passwd -1 "password"): Sets the user's password. The openssl passwd -1 command hashes the password.
* username: The username for the new account.
* AndrewAdel: user name

![Screenshot from 2024-06-26 15-43-00](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/00d1c7d2-4ae8-4dd7-9a07-2378501a82e8)

