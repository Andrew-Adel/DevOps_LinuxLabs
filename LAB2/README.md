# 1. List the user commands and redirect the output to /tmp/commands.list
```javascript
compgen -c > /tmp/commands.list
```
## command parts
* `compgen -c`: Generates a list of all available commands.
* `>`: Redirects the output to a file.
* `/tmp/commands.list`: The file where the list of commands will be stored.
## image
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/034b0a2c-5d88-4d02-a5a4-aa02f283ba07)

# 2. Count the number of user commands
```javascript
compgen -c | wc -l
```
## wc (word cound) command:
* wc -l: Counts the number of lines.
* wc -w: Counts the number of words.
* wc -c: Counts the number of bytes.
* wc -m: Counts the number of characters.
## image
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/e3ea7843-5c95-4cbf-8aef-8eb8346184a4)

# 3. Get all the users names whose first character in their login is ‘g’.
## `who` command
Shows who is currently logged into the system.
```javascript
who | grep '^a'
```
## image
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/6a82f9de-ff6c-492f-8f33-578ea1ec1318)

# 4. get the logins name and full names (comment) of logins starts with “g”.
```javascript
getent passwd | grep '^g' | cut -d: -f1,5
```
* `getent passwd`: Retrieves the user account information from the system database.
* `grep '^g'`: Filters the output to include only lines where the username starts with "g".
* `cut -d: -f1,5`: Cuts each line using ":" as the delimiter and selects the first and fifth fields, which correspond to the username and the full name/comment, respectively.

## image
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/2cfed957-8d38-4a2b-b540-35b0d7c28b41)

# 5. Save the output of the last command sorted by their full names in a file.
```javascript
getent passwd | grep '^g' | cut -d: -f1,5 > GUsers.list
```
## code ScreenShot ![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/bb901b45-c590-4375-ad9f-4839246842af)
## output
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/d013b863-916d-4c28-ab02-d8bc327dd813)

# 6. Write two commands: first: to search for all files on the system that named `.bash_profile`. Second: sorts the output of ls command on `/` recursively, Saving their output and error in 2 different files and sending them to the background.
## search for all files on the system that named `.bash_profile`
```javascript
find . -name ".bash_profile" 2> /dev/null
```
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/618dbcab-e71b-4016-9a5c-1cfa18f11873)
## sorts the output of ls command on `/` recursively, Saving their output and error in 2 different files and sending them to the background.
```javascript
(ls -R / 1>sorted_ls_output.txt 2>sorted_ls_error.txt &)
```
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/699d4cae-72f9-4a03-96fa-866a079b8ce5)

# 7. Display the number of users who is logged now to the system.
```javascript
who | wc -l
```
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/3df41de0-1ed3-4a11-a904-ea5af2687798)

# 8. Display lines 7 to line 10 of /etc/passwd file
`sed -n '/[pattern]/p' [file]: Print only lines matching the pattern.`
```javascript
sed -n '7,10p' /etc/passwd
```
* `sed`: Stream editor for filtering and transforming text.
* `-n`: Suppresses automatic printing of pattern space.
* `7,10p`: Specifies the range of lines from 7 to 10 and prints them.
* `/etc/passwd`: The file to be processed.
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/650d7b51-7856-405b-862c-199d4f1cd89e)
