#Create a Local Yum Repository for Oracle Linux 

# Install the following packages, which include the utilities necessary to set up the repository.
yum install -y yum-utils createrepo
yum install -y httpd

# Create the following directories to hold the main OS and UEK respoitories.
mkdir -p /opt/repo/OracleLinux
mkdir -p /opt/repo/logs
mkdir -p /opt/repo/scripts
#The reposync command is used to synchronize a remote yum repository to a local directory, using yum to retrieve the packages.
/usr/bin/reposync --newest-only --repoid=ol7_latest -p /opt/repo/OracleLinux
/usr/bin/reposync --newest-only --repoid=ol7_UEKR4 -p /opt/repo/OracleLinux
/usr/bin/reposync --newest-only --repoid=ol7_UEKR5 -p /opt/repo/OracleLinux

# Creat script in /opt/repo/scripts/repo_sync.sh

{
#!/bin/bash

LOG_FILE=/opt/repo/logs/repo_sync_$(date +%Y.%m.%d).log

# Remove old logs
find /opt/repo/logs/repo_sync* -mtime +5 -delete; >> $LOG_FILE 2>&1

# Sync repositories
/usr/bin/reposync --newest-only --repoid=ol7_latest -p /opt/repo/OracleLinux >> $LOG_FILE 2>&1
/usr/bin/reposync --newest-only --repoid=ol7_UEKR4 -p /opt/repo/OracleLinux >> $LOG_FILE 2>&1
/usr/bin/reposync --newest-only --repoid=ol7_UEKR5 -p /opt/repo/OracleLinux >> $LOG_FILE 2>&1

/usr/bin/createrepo /opt/repo/OracleLinux/ol7_latest/getPackage/ >> $LOG_FILE 2>&1
/usr/bin/createrepo /opt/repo/OracleLinux/ol7_UEKR4/getPackage/ >> $LOG_FILE 2>&1
/usr/bin/createrepo /opt/repo/OracleLinux/ol7_UEKR5/getPackage/ >> $LOG_FILE 2>&1
}

#Make the file executable.
chmod u+x /opt/repo/scripts/repo_sync.sh

#Set up a CRON job to run the script on a daily basis. The following entry runs the script each day at 01:00.

0 1 * * * /opt/repo/scripts/repo_sync.sh > /dev/null 2>&1

# Apache HTTP servers, start it and make sure it restarts automatically on reboot.

# Starts the service 
systemctl start httpd
#Enable on reboot
systemctl enable httpd


# Allow 80 through local firewall 
firewall-cmd --permanent --zone=public --add-port=80/tcp

# Present the repositories using the HTTP server creat links
mkdir -p /var/www/html/repo/OracleLinux/ol7_latest
mkdir -p /var/www/html/repo/OracleLinux/ol7_UEKR4
mkdir -p /var/www/html/repo/OracleLinux/ol7_UEKR5
ln -s /opt/repo/OracleLinux/ol7_latest/getPackage/ /var/www/html/repo/OracleLinux/ol7_latest/x86_64
ln -s /opt/repo/OracleLinux/ol7_UEKR4/getPackage/ /var/www/html/repo/OracleLinux/ol7_UEKR4/x86_64
ln -s /opt/repo/OracleLinux/ol7_UEKR5/getPackage/ /var/www/html/repo/OracleLinux/ol7_UEKR5/x86_64

#Copy the GPG key to the HTTP server.
cp /etc/pki/rpm-gpg/RPM-GPG-KEY-oracle /var/www/html/RPM-GPG-KEY-oracle-ol7

# On the remote servers point to the local repo
vi /etc/yum.repos.d/local-ol7.repo
{
[local_ol7_latest]
name=Oracle Linux $releasever Latest ($basearch)
baseurl=http://ol7-yum.localdomain/repo/OracleLinux/ol7_latest/$basearch/
gpgkey=http://ol7-yum.localdomain/RPM-GPG-KEY-oracle-ol7
gpgcheck=1
enabled=1

[local_ol7_UEKR4]
name=Latest Unbreakable Enterprise Kernel for Oracle Linux $releasever ($basearch)
baseurl=http://ol7-yum.localdomain/repo/OracleLinux/ol7_UEKR4/$basearch/
gpgkey=http://ol7-yum.localdomain/RPM-GPG-KEY-oracle-ol7
gpgcheck=1
enabled=1

[local_ol7_UEKR5]
name=Latest Unbreakable Enterprise Kernel for Oracle Linux $releasever ($basearch)
baseurl=http://ol7-yum.localdomain/repo/OracleLinux/ol7_UEKR5/$basearch/
gpgkey=http://ol7-yum.localdomain/RPM-GPG-KEY-oracle-ol7
gpgcheck=1
enabled=1
}
