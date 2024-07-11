# Lab3 DevOps Linux
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

