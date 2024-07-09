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
