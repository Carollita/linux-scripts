#!/bin/bash
echo "Creating directories"
mkdir /public
mkdir /adm
mkdir /sales
mkdir /office

echo "Creating groups"
groupadd GRP_ADM
groupadd GRP_SALES
groupadd GRP_OFFICE

echo "Creating users"
useradd jim -c "User guest" -s /bin/bash -m -p $(openssl passwd -5 passwd123) -G GRP_ADM
useradd hisa -c "User guest" -s /bin/bash -m -p $(openssl passwd -5 passwd123) -G GRP_ADM

useradd etsu -c "User guest" -s /bin/bash -m -p $(openssl passwd -5 passwd123) -G GRP_SALES
useradd fuyu -c "User guest" -s /bin/bash -m -p $(openssl passwd -5 passwd123) -G GRP_SALES

useradd kaori -c "User guest" -s /bin/bash -m -p $(openssl passwd -5 passwd123) -G GRP_OFFICE
useradd chiyo -c "User guest" -s /bin/bash -m -p $(openssl passwd -5 passwd123) -G GRP_OFFICE

echo "Configuration owner and directories permissions"
chown root /public
chown root:GRP_ADM /adm
chown root:GRP_SALES /sales
chown root:GRP_OFFICE /office

chmod 777 /public/
chmod 770 /adm/
chmod 770 /sales/
chmod 770 /office/

echo "Done!"