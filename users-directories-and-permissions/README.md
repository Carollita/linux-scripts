## Infrastructure as code: Script for creating the structure of users, directories and permissions
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![Shell Script](https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white)

### Directories
```
public
adm
sales
office
```

### Groups and users
```
GRP_ADM (jim, hisa)
GRP_SALES (etsu, fuyu)
GRP_OFFICE (kaori, chiyo)
```

### To Creating and acessing file
**Create or open file:**
```
nano config.sh
```

**Add permission to execute:**
```
chmod +x config.sh
```

**To run:**
```
./config.sh
```