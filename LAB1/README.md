# DevOps Lab#1
lab1 from devops diploma on DEPI
## 1. Create a user account with the following attribute
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

### show users
```javascript
cat /etc/passwd
```
![Screenshot from 2024-06-26 15-43-00](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/382f7729-b82a-432b-8311-309fe2eba6e9)

## 2. Create a user account with the following attribute
```javascript
sudo useradd -m -c "Bad User" -s /bin/bash -p $(openssl passwd -1 "baduser") baduser
```


## 3. reate a supplementary (Secondary) group called pgroup with group ID of 30000 (Create Groups)
```javascript
sudo groupadd -g 30000 pgroup
```
* sudo: Runs the command with superuser privileges.
* groupadd: The command to add a new group.
* -g 30000: Specifies the GID for the new group.
* pgroup: The name of the new group.

### show groups and users
```javascript
cat /etc/groups 
```

## 4. Create a supplementary group called badgroup

```javascript
sudo groupadd -g badgroup
```

![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/ad2aa332-7b0d-4b88-9073-99b4e8a43481)

## 5. Add islam user to the pgroup group as a supplementary group
```javascript
sudo usermod -aG pgroup islam
```

### show groups of islam
```javascript
groups islam
id islam
```
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/59a6932c-cb64-46a8-9f07-b0dc6a9701f2)

## 6. Modify the password of islam's account to password
```javascript
sudo passwd islam
```
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/0396cf1f-46d8-431d-ba81-f319a9d7f351)

## 7. Modify islam's account so the password expires after 30 days
### set password expire time
```javascript
sudo chage -M 30 islam
```
### to verify the expire time
```javascript
sudo chage -l islam
```
### explaination image
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/ea56d747-324e-4c08-bcc7-53d38295899e)


## 8. Lock bad user account so he can't log in
```javascript
sudo passwd -l baduser
```
* sudo: Runs the command with superuser privileges.
* passwd: The command used to change user passwords.
* -l: The option to lock the user account ||| -u: The option to unlock the user account 
* baduser: The username of the account to be locked.

##  9. Delete bad user account
```javascript
sudo userdel -r baduser
```
* sudo: Runs the command with superuser privileges.
* userdel: The command to delete a user account.
* -r: Removes the user's home directory and mail spool.
* baduser: The username of the account to be deleted.

## 10. Delete the supplementary group called badgroup
```javascript
sudo groupdel badgroup
```
* sudo: Runs the command with superuser privileges.
* groupdel: The command to delete a group.
* badgroup: The name of the group to be deleted.

## switch between users
```javascript
sudo -i -u AndrewAdel
```
* sudo: Runs the command with superuser privileges.
* -i: runs the shell specified by the target user's default shell as a login shell
* -u: allow run a command as a specified user

## 11. Create a folder called myteam in your home directory and change its permissions to read only for the owner.
```javascript
mkdir ~/myteam
chmod 400 ~/myteam
```
### to show:
```javascript
ls -ld ~/myteam
```
use the next to show all files and directories with their permission
``` javascript
ls -l
```
![Screenshot from 2024-06-26 17-28-11](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/54298f6c-8561-4a10-9419-c8bceb6ef4e6)

## 12. Log out and log in by another user || 13. Try to access (by cd command) the folder (myteam)

![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/7ef08ff9-b58c-4700-9868-2abba42a6fed)

##     14. Using the command Line
Change the permissions of oldpasswd file to give owner read and write permissions and for group write and execute and execute only for the others (using chmod in 2 different ways)
change your default permissions to be as above.
``` javascript
chmod 631 oldpasswd
chmod u=rw,g=wx,o=x oldpasswd
```
to show:
``` javascript
ls -l oldpasswd
```
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/a1c38fa5-9feb-42af-a70a-955ca996a622)

## 15. What is the maximum permission a file can have, by default when it is just created? And what is that for directory.
max permission
#### Direction:
777 (read, write, and execute for owner, group, and others)
#### Files
666 (read and write for owner, group, and others)
## 16. Change your default permissions to be no permission to everyone then create a directory and a file to verify
``` javascript
  umask 777
  mkdir dirNewMask
  touch fileNewMask
  umask
  umask 002
  umask
  mkdir dirResetMask
  touch fileResetMask
  ls -ld dirNewMask
  ls -ld dirResetMask
  ls -ld fileNewMask
  ls -ld fileResetMask
```

![Screenshot from 2024-07-03 15-47-03](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/973d758b-4662-4818-a4dc-426471cc9e0e)
![Screenshot from 2024-07-03 15-48-56](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/03c3176c-fca2-4ce9-856c-d8e8b8161a1c)

## 17. What are the minimum permission needed for
### a. Copy a directory (permission for source directory and permissions for target parent directory)
* source direction: must be
  * readable and excutable at least to be copied and listing its content
  * and its content must be the same (readable and excutable if direction and readable if file)

* target parent direction:
  * must be excutable to be access it and allow changes
  * must be writable to create new file or direction inside it
 
### b. Copy a file (permission for source file and and permission for target parent directory)
* source file:
  * readable
 
* target parent direction
  * must be excutable to be access it and allow changes
  * must be writable to create new file or direction inside it

### c. Delete a file
* source file:
  * no minimum permission requested for the file to be deleted

* parent direction
  * the parent direction must be writable and executable to delete file inside it
 
### d. Change to a directory
need the directiory to be executable 

### e. List a directory content
need the directory to be executable and readable

### f. View a file content (more/cat command)
the file need to be readable

### g. Modify a file content
* file:
  * file must be writable

* parent directory
  * must be executable


## 19. What is the difference between the “x” permission for a file and for a directory?
### for file
run file like program or script
### for direction
allows you to enter the directory and access its contents.

## 20. Using vi write your CV in the file mycv. Your CV should include your name, age, school, college, experience

![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/b06e6b95-43a8-4ab2-b406-2cd6727a1851)

## 21. Open mycv file using vi command then: Without using arrows state how to:
### Show all lines numbers
```javascript
:set number // show all lines number
/Age //Search for word age
5G //Step to line 5 (assuming that you are in line 1 and file is more than 5 lines).
dd // Delete the line you are on. 
```

## 22. List the available shells in your system.

```javascript
cat /etc/shells
```
![Screenshot from 2024-07-03 17-06-16](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/39d06d88-83b2-4a6f-97de-7c173a3b47c3)

## 23. List the environment variables in your current shell.
```javascript
env
// or
printenv
```

## 24.List all of the environment variables for the bash shell.
```javascript
env | grep BASH_
```

## 25.What are the commands that list the value of a specific variable?
```javascript
echo $Variable
\\Example:
echo $SHELL
```

## 26. Display your current shell name.
```javascript
echo $0
```
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/60d70397-d143-4fa3-acb7-193a24b915fc)

## 27.State the initialization files of: sh, ksh, bash.
### what is initialization file
* Initialization files are scripts that are executed automatically when a shell starts up.
* set environment variables
* define functions
* perform other setup tasks

### initialization files:
#### for sh
##### Login Shell: .profile
* This file is located in the user's home directory ($HOME/.profile).
* It is executed when a login shell starts.
* Example: /home/user/.profile
##### Non-login Interactive Shell: .shrc
* This file is also located in the user's home directory ($HOME/.shrc).
* It is executed when a non-login interactive shell starts.
* Example: /home/user/.shrc

#### for ksh
##### Login Shell: .profile
* Similar to sh, the .profile file in the user's home directory ($HOME/.profile) is executed when a login shell starts.
* Example: /home/user/.profile
##### Non-login Interactive Shell: .kshrc
* The .kshrc file in the user's home directory ($HOME/.kshrc) is executed when a non-login interactive shell starts.
* Example: /home/user/.kshrc

#### bash (Bourne Again Shell)
##### Login Shell:
* .bash_profile, .bash_login, or .profile
* bash looks for these files in the following order: .bash_profile, .bash_login, and .profile.
* It executes the first one it finds in the user's home directory ($HOME).
* Example: `/home/user/.bash_profile`, `/home/user/.bash_login`, or `/home/user/.profile`

##### Non-login Interactive Shell: .bashrc
* The `.bashrc` file in the user's home directory ($HOME/.bashrc) is executed when a non-login interactive shell starts.
* Example: /home/user/.bashrc

## 28. Edit in your profile to display date at login and change your prompt permanently.
add the following code into ~/.profile file
```javascript
# Display date at login
echo "Today's date: $(date)"

# Customize prompt
export PS1="\[\e[36m\]\u@\h \[\e[33m\]\w\[\e[0m\] $ "
```
save it and execute the file using source:
```javascript
source ~/.profile 
```
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/4a443784-974f-43fc-93be-b43cefdd1849)

## 29. Execute the following command :
### echo \ then press enter
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/64b898c1-1f60-402b-8e02-d1be68071479)

### What is the purpose of \ ?  * escaping special characters 
* indicating that the command continues on the next line.

### Notice the prompt ”>” what is that? 
The prompt > that appears is called the PS2 prompt, which indicates that the shell is expecting more input to complete the command.

### and how can you change it from “>” to “:”. (Search PS1, PS2, ...) 
```javascript
export PS2=": "
```
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/c1ba19d4-bfef-4f1b-abc0-d51c56608b23)

## 30. Create a Bash shell alias named ls for the “ls –l” command
### add the alias
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/e3a13b30-33a1-4144-8b71-c0635a76c44c)
### test the alias
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/17465507-5fb0-4f58-b3a9-daaa9fa91e48)
