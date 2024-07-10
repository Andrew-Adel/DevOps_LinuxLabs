![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/cc31d6b1-459e-43e2-b935-4b4a01a80ab8)# 1. List the user commands and redirect the output to /tmp/commands.list
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

# 9. What happens if you execute:
## `cat filename1 | cat filename2`
it will get the contant of filename1 and give it to pipeline, the pipeline won't use the previous output, instead, it will get the content of filename2 and print it
### image
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/b12cf331-8bf1-4b73-908d-c35de170c39a)

## `ls | rm`
produce an error message because `rm` is not designed to accept its arguments via a pipe
### image
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/3248aa76-84b2-44cf-8a15-b5cbeab33a0c)

## `ls /etc/passwd | wc -l`
`ls /etc/passwd` will show the permision and some data about this file
using `ls /etc/passwd | wc -l`, `wc -l` will count the lines of the output of `ls /etc/passwd`, which is 1 line
### image
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/ac6ec90e-9d6d-4354-92ea-61057d16634e)


# 10. Issue the command sleep 100.
`sleep 100`
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/711a3c1c-0c74-4e9d-b67d-61762709eca3)

# 11. Stop the last command.
```javascript
ps -u $(whoami) | grep sleep
kill -TSTP 7949
```
`ps -u $(whoami) | grep sleep` to get all active process that is sleep
`kill -TSTP 7949` to stop a process we give the `kill` command the option `-TSTP` and give process id as argument
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/8feab373-fbb3-46f3-aaec-bb940bef67c7)


# 12. Resume the last command in the background
```javascript
kill -CONT 8263
```
option `CONT` to resume the process after stop it
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/cd9b8e4d-7950-4e35-bf8c-90cefdf7197c)


# 13. Issue the jobs command and see its output.
![Screenshot from 2024-07-10 13-48-34](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/b5722d83-f25d-47cf-8187-dcf2c692796a)


# 14. Send the sleep command to the foreground and send it again to the background.
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/bc76ce8c-e5ef-41dd-ab83-d61a19a4af52)
![Screenshot from 2024-07-10 13-48-34](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/320ce3ca-c91f-42fd-9a3b-31984164a380)


# 15. Kill the sleep command.
```javascript
kill -9 9308
```
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/539c5e80-c880-4404-a45d-f81e622aa3bd)


# 16. Display your processes only
```javascript
ps aux | grep "^andrew"
```
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/6749ba08-19b3-4c1c-bd1f-04325db8335f)

or
```javascript
ps -u andrew
```
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/cbb46581-ee3d-472b-bd84-14a1974f2d3f)


# 17. Display all processes except yours
```javascript
ps aux | grep -v "^andrew"
```
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/72239eff-7ebf-43bb-a86b-074075cc0c26)

# 18. Use the pgrep command to list your processes only 
## show processes ID
```javascript
pgrep -u $(whoami)
```
![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/46f7fb89-9926-485c-928b-13174e8e2d25)
## show processes data 
```
ps -fp $(pgrep -u $(whoami))
```
* `pgrep -u $(whoami)`: Returns a list of PIDs of processes owned by the current user.
* `$(...)`: Substitutes the output of the command inside the parentheses into the ps command.
* `ps -fp <list_of_pids>`: Displays detailed information about the specified PIDs.
# ![image](https://github.com/Andrew-Adel/DevOps_Lab1/assets/60392594/ace00ba8-d2a5-458c-b544-67dae2611131)


# 19. Kill your processes only.

```
kill -9 $(pgrep -u $(whoami))
```
