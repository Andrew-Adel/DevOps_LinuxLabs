![image](https://github.com/Andrew-Adel/DevOps_LinuxLabs/assets/60392594/1da1deba-66c3-4d1c-bb71-1b5c5c452e01)# Lab3 DevOps Linux
## Part 1
### 1. Create a script that asks for user name then send a greeting to him.
#### code
```javascript
vi Lab3_1.sh
// inside Lab3_1.sh
echo -n "Enter Your Name: "
read input
echo "Hello $input"
// make the file executable
chmod +x Lab3_1.sh
// execute the file
./Lab3_1.sh
```
#### execute
![image](https://github.com/Andrew-Adel/DevOps_LinuxLabs/assets/60392594/1a465f06-835e-4c50-a9ed-8c1e587d2949)

### 2. Create a script called s1 that calls another script s2 where:
#### a. In s1 there is a variable called x, it's value 5
```javascript
vi s1.sh
// inside s1.sh
x=5
source ./s2.sh
// make the file executable
chmod +x s1.sh
// execute the file
./s1.sh
```
#### b. Try to print the value of x in s2 by two different ways.
```javascript
vi s2.sh
// inside s2.sh
echo "X = $x"
// make the file executable
chmod +x s2.sh
```
#### test Image
![image](https://github.com/Andrew-Adel/DevOps_LinuxLabs/assets/60392594/a7935cee-0e3f-42d3-b001-fc982aef36cc)


### Create a script called mycp where:
#### a. It copies a file to another
```javascript
vi mycp.sh
// inside mycp.sh
echo "enter path for file to be copy:"
read sourceFile
echo "enter path for file to be past:"
read dstFile

cp $sourceFile $dstFile
// make the file executable
chmod +x mycp.sh
// execute the file
./mycp.sh
```
##### test
##### test
```javascript
andrew@andrew-HP-Laptop-15-da1xxx:~$ ./mycp.sh
enter path for file to be copy:
oldpasswd
enter path for file to be past:
mycpTest/newpasswd
```
![image](https://github.com/Andrew-Adel/DevOps_LinuxLabs/assets/60392594/ed9b0400-6363-45c7-bd7c-2312a3aa69f0)

#### It copies multiple files to a directory.
same code as before
##### test
```javascript
andrew@andrew-HP-Laptop-15-da1xxx:~$ ./mycp.sh
enter path for file to be copy:
oldpasswd testfile testfile3
enter path for file to be past:
mycpTest
```
![image](https://github.com/Andrew-Adel/DevOps_LinuxLabs/assets/60392594/ff1825af-0e6a-43db-9890-fdc6db598687)


### Create a script called mycd where:
a. It changed directory to the user home directory, if it is called without arguments.
b. Otherwise, it change directory to the given directory.
#### code
```javascript
vi mycd.sh
// inside mycd.sh
if [ "${#1}" -eq 0 ]; then
   cd ~/ 
else
   cd "$1" 
fi
// make the file executable
chmod +x mycd.sh
```
#### test
```javascript
// execute the file
~/mycd.sh
source ~/mycd.sh mycpTest/
source ~/mycd.sh
```
![image](https://github.com/Andrew-Adel/DevOps_LinuxLabs/assets/60392594/bd294739-a02f-4d64-b096-84a9e35e9a3e)


### Create a script called myls where:
a. It lists the current directory, if it is called without arguments.
b. Otherwise, it lists the given directory.
#### code
```javascript
vi myls.sh
// inside myls.sh
if [ "${#1}" -eq 0 ]; then
    ls
else
    ls "$1"
fi
// make the file executable
chmod +x myls.sh
```

#### test
```javascript
// execute the file
~/myls.sh 
~/myls.sh mycpTest/
```
![image](https://github.com/Andrew-Adel/DevOps_LinuxLabs/assets/60392594/5201dc8f-e689-4a2c-8acb-58149dc0e048)


### Enhance the above script to support the following options individually:
a. –l: list in long format
b. –a: list all entries including the hiding files.
c. –d: if an argument is a directory, list only its name
d. –i: print inode number
e. –R: recursively list subdirectories
#### code
```javascript
vi myls_update.sh
// inside myls_update.sh
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

// make the file executable
chmod +x myls_update.sh
```

#### test
```javascript
~/myls_update.sh -la -i
~/myls_update.sh -la mycpTest/ -i
```
![image](https://github.com/Andrew-Adel/DevOps_LinuxLabs/assets/60392594/11636ed1-9587-4037-ba78-9f4ddda863bf)
![image](https://github.com/Andrew-Adel/DevOps_LinuxLabs/assets/60392594/d6273f59-9216-4c92-ade2-af157cbc7deb)
![Screenshot from 2024-07-11 03-45-31](https://github.com/Andrew-Adel/DevOps_LinuxLabs/assets/60392594/4b8574a4-f6a2-469b-aa73-54ca90c13d31)




## Part 2
### 1. Write a script called mycase, using the case utility to checks the type of character entered by a user:
a. Upper Case.
b. Lower Case.
c. Number.
d. Nothing.
#### command and code
```javascript
nano mycase.sh
// inside mycase.sh
echo "Enter a Character to be checked"
read char

case $char in
	[A-Z])
		echo "'$char' is a Upper Case Character"
		;;
	[a-z])
		echo "'$char' is a Lower Case Character"
      ;;
   [0-9])
      echo "'$char' is a Number"
      ;;
	*)
      echo "'$char' is not Upper Case Character, Lower Case Character, nor number"
      ;;
esac


// make the file executable
chmod +x mycase.sh
```
#### test
```javascript
andrew@andrew-HP-Laptop-15-da1xxx:~$ ~/mycase.sh 
Enter a Character to be checked
a
'a' is a Lower Case Character
andrew@andrew-HP-Laptop-15-da1xxx:~$ ~/mycase.sh 
Enter a Character to be checked
A
'A' is a Upper Case Character
andrew@andrew-HP-Laptop-15-da1xxx:~$ ~/mycase.sh 
Enter a Character to be checked
1
'1' is a Number
andrew@andrew-HP-Laptop-15-da1xxx:~$ ~/mycase.sh 
Enter a Character to be checked
*
'*' is not Upper Case Character, Lower Case Character, nor number
```
![image](https://github.com/Andrew-Adel/DevOps_LinuxLabs/assets/60392594/62ccbd6f-932f-4dae-b74c-2035737b1026)

### 2. Enhanced the previous script, by checking the type of string entered by a user:
a. Upper Cases.
b. Lower Cases.
c. Numbers.
d. Mix.
e. Nothing.
```javascript
// create mycase_string.sh
nano mycase_string
// write the shell code
#!/bin/bash

# Initialize flags
has_upper=false
has_lower=false
has_number=false
has_special=false
# Prompt the user for input
echo "Enter a string: "
read input_string

# Loop through each character in the input string
for (( i=0; i<${#input_string}; i++ )); do
	char="${input_string:$i:1}"

	# Check if the character is uppercase
	if [[ "$char" =~ [A-Z] ]]; then
	has_upper=true
	# Check if the character is lowercase
	elif [[ "$char" =~ [a-z] ]]; then
	has_lower=true
	# Check if the character is a number
	elif [[ "$char" =~ [0-9] ]]; then
	has_number=true
	else
	has_special=true
	fi
done

# Determine the type of string based on flags
if $has_upper && ! $has_lower && ! $has_number && ! $has_special; then
    echo "Upper Case: $input_string"
elif ! $has_upper && $has_lower && ! $has_number && ! $has_special; then
    echo "Lower Case: $input_string"
elif ! $has_upper && ! $has_lower && $has_number && ! $has_special; then
    echo "Numbers: $input_string"
elif ($has_upper || $has_lower || $has_number) && ! ($has_special); then
    echo "Mix: $input_string"
else
    echo "Nothing: $input_string"
fi
```
#### test
```javascript
andrew@andrew-HP-Laptop-15-da1xxx:~$ ~/mycase_string.sh
Enter a string: 
ANDREW
Upper Case: ANDREW
andrew@andrew-HP-Laptop-15-da1xxx:~$ ~/mycase_string.sh
Enter a string: 
andrew
Lower Case: andrew
andrew@andrew-HP-Laptop-15-da1xxx:~$ ~/mycase_string.sh
Enter a string: 
Andrew
Mix: Andrew
andrew@andrew-HP-Laptop-15-da1xxx:~$ ~/mycase_string.sh
Enter a string: 
Andrew123
Mix: Andrew123
andrew@andrew-HP-Laptop-15-da1xxx:~$ ~/mycase_string.sh
Enter a string: 
Andrew**
Nothing: Andrew**
andrew@andrew-HP-Laptop-15-da1xxx:~$ ~/mycase_string.sh
Enter a string: 

Nothing: 
```
![image](https://github.com/Andrew-Adel/DevOps_LinuxLabs/assets/60392594/bacb2613-27be-4bb4-932f-9ef2a2d20a32)


### Write a script called mychmod using for utility to give execute permission to all files and directories in your home directory.
#### code
```javascript
// create mychmod.sh
nano mychmod
// write the shell code

dir="$HOME"
for item in "$dir"/*; do
	if [ -f "$item" ] || [ -d "$item" ]; then
		chmod +x "$item"
		echo "add execute permission for item: $item"
	fi
done
echo "All files and directories in $dir have been given execute permissions."

// add execute permission for mychmod.sh
chmod +x mychmod.sh
```
#### test
```javascript
~/mychmod.sh
```
![Screenshot from 2024-07-11 12-21-34](https://github.com/Andrew-Adel/DevOps_LinuxLabs/assets/60392594/4288e9f1-ddac-43c0-a349-aca5ec2796c4)
![Screenshot from 2024-07-11 12-21-34](https://github.com/Andrew-Adel/DevOps_LinuxLabs/assets/60392594/160d5e94-6cbb-476c-ad45-71f7c65ded1f)
![Screenshot from 2024-07-11 12-21-44](https://github.com/Andrew-Adel/DevOps_LinuxLabs/assets/60392594/35826355-17f7-40c8-81d6-0436918a6005)

### 4. Write a script called mybackup using for utility to create a backup of only files in your home directory.
#### code
```javascript
// create mybackup.sh
nano mybackup
// write the shell code

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

// add execute permission for mychmod.sh
chmod +x mychmod.sh
```

* use `##/*` to remove any directory path from file name
* `-C "$dir"` option changes to the home directory before adding the files `/home/andrew file1 mybackup.sh mycase.sh mycase_string.sh mychmod.sh`
* `files=()` create array of files' name

#### test
```javascript
andrew@andrew-HP-Laptop-15-da1xxx:~$ ~/mybackup.sh 
file1
mybackup.sh
mycase.sh
mycase_string.sh
mychmod.sh
Backup of all files in  completed successfully.
Backup file created at: /home/andrew/backup_20240711.tar.gz
andrew@andrew-HP-Laptop-15-da1xxx:~$ ls backup_20240711.tar.gz
backup_20240711.tar.gz
andrew@andrew-HP-Laptop-15-da1xxx:~$ ls backup_20240711/
file1  mybackup.sh  mycase.sh  mycase_string.sh  mychmod.sh
andrew@andrew-HP-Laptop-15-da1xxx:~$ 
```
![image](https://github.com/Andrew-Adel/DevOps_LinuxLabs/assets/60392594/3f12d258-bd95-4868-b67a-e2b38a7550df)

### 5. Write a script called mymail using for utility to send a mail to all users in the system.
Note: write the mail body in a file called mtemplate.
```
nano mymail.sh
// code inside mymail.sh
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
```

### 6. 


## Part 3
### 1. Display the lines that contain the word “lp” in /etc/passwd file.
```javascript
sed -n '/lp/p' /etc/passwd
```
#### test
```javascript
andrew@andrew-HP-Laptop-15-da1xxx:~$ sed -n '/lp/p' /etc/passwd
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
cups-pk-helper:x:112:114:user for cups-pk-helper service,,,:/nonexistent:/usr/sbin/nologin
```
![image](https://github.com/Andrew-Adel/DevOps_LinuxLabs/assets/60392594/0748dd43-6789-4c06-a4f2-1ffa1eea0f1c)


### 2. Display /etc/passwd file except the third line.
```javascript
sed '3d' /etc/passwd
```
#### test
```javascript
andrew@andrew-HP-Laptop-15-da1xxx:~$ sed '3d' /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
...
```
![image](https://github.com/Andrew-Adel/DevOps_LinuxLabs/assets/60392594/ea550f4b-49e6-4ea6-883d-7dce32005efa)

### 3. Display /etc/passwd file except the last line.
```javascript
sed '$d' /etc/passwd
```

### 4. Display /etc/passwd file except the lines that contain the word “lp”.
```javascript
sed '/lp/d' /etc/passwd
```

### 5. Substitute all the words that contain “lp” with “mylp” in /etc/passwd file.
```javascript
sed 's/\(.*\)lp\(.*\)/\1mylp\2/g' /etc/passwd
```
