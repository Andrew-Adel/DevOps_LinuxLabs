# DevOps Lab#1
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

### show users
```javascript
cat /etc/passwd
```
![Screenshot from 2024-06-26 15-43-00](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/382f7729-b82a-432b-8311-309fe2eba6e9)


## Create Groups
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

![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/ad2aa332-7b0d-4b88-9073-99b4e8a43481)

## add user to group
```javascript
sudo usermod -aG pgroup islam
```

### show groups of islam
```javascript
groups islam
id islam
```
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/59a6932c-cb64-46a8-9f07-b0dc6a9701f2)

## change password of user
```javascript
sudo passwd islam
```
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/0396cf1f-46d8-431d-ba81-f319a9d7f351)

## lock user so cann't login
```javascript
sudo passwd -l baduser
```
* sudo: Runs the command with superuser privileges.
* passwd: The command used to change user passwords.
* -l: The option to lock the user account ||| -u: The option to unlock the user account 
* baduser: The username of the account to be locked.

##  delete user
```javascript
sudo userdel -r baduser
```
* sudo: Runs the command with superuser privileges.
* userdel: The command to delete a user account.
* -r: Removes the user's home directory and mail spool.
* baduser: The username of the account to be deleted.

## group delete
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
* * readable and excutable at least to be copied and listing its content
  * and its content must be the same (readable and excutable if direction and readable if file)

* target parent direction:
* * must be excutable to be access it and allow changes
  * must be writable to create new file or direction inside it
 
### b. Copy a file (permission for source file and and permission for target parent directory)
* source file:
* * readable
 
* target parent direction
* * must be excutable to be access it and allow changes
  * must be writable to create new file or direction inside it

### c. Delete a file
* source file:
* * no minimum permission requested for the file to be deleted

* parent direction
* * the parent direction must be writable and executable to delete file inside it 
