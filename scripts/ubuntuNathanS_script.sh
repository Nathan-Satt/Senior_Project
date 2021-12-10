#!/bin/bash

sed -i '/Update-Package-Lists/s/0/1/' /etc/apt/apt.conf.d/10periodic
sed -i '/Update-Package-Lists/s/0/1/' /etc/apt/apt.conf.d/20auto-upgrades

# replaces only in lines with Update-Package-Lists

while IFS=: read user pass uid gid full home shell
do
if [ $uid -gt 999 ] && [ $uid -lt 20000 ]; then
	echo -e "$full :\n\
	Pseudo : $user\n\
	UID :\t $uid\n\
	GID :\t $gid\n\
	Home :\t $home\n\
	Shell :\t $shell\n\n"
fi
if [ $uid -gt 999 ]; then
	echo -e "L!fe!sG00d\nL!fe!sG00d" | passwd $user
fi
done < /etc/passwd

#changes passwords for all users with UID over 999 to L!fe!sG00d

cut -d: -f1 /etc/passwd | grep -vFf namelist | while read name ; do deluser "$name" ; done

#deletes ALL users not in name list

grep -w "userdel" /var/log/auth.log | grep -w "user" > 'deleted users'

#makes list of deleted users called deleted users

for u in $(awk -F'[/:]' '{if($3>=1000&&$3!=65534) print $1}' /etc/passwd); do sudo -lU "$u" ; done | grep User

#lists users with permission to use sudo

echo "enter user you would like to remove from sudo users"

read user

deluser $user "sudo"

#promts you to enter a user to remove from sudo group

sudo service apache2 stop

#stops apache2 server

echo manual | sudo tee /etc/init/SERVICE.override

#makes apache only be able to start manualy 

sudo sh -c 'printf "[SeatDefaults]\nallow-guest=false\n" >/usr/share/lightdm/lightdm.conf.d/50-no-guest.conf'

#disables guest account

echo 'only one vm was destroyed in the making of this script'






