# This will list all info about the network interface.
sudo /opt/nessus/sbin/nessuscli fix --list-interfaces
# This will allow you to edit the network interface.
nmtui-edit
# This will let you bounce the network interface.
nmcli connection down "Wired connection 1" && nmcli connection up "Wired connection 1"



