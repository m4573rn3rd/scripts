# Remove mariadb if installed
sudo yum remove mariadb-server -y

# Download MySQL 5.7 repo
wget https://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm

# Install repo
sudo rpm -ivh mysql57-community-release-el7-8.noarch.rpm

# Update yum
sudo yum update

# Install server
sudo yum install mysql-server -y

# Start the services 
sudo systemctl start mysqld

# Check Status
sudo systemctl status mysqld

# Enable on startup
sudo systemctl enable mysqld

# Get current database password
sudo grep 'temporary password' /var/log/mysqld.log

%g=sdPrtg2w4

# sudo mysql_secure_installation

vi /etc/my.cnf

# add 
bind-address=0.0.0.0

# Log into database server and add ip.
mysql -u root -p mysql
GRANT ALL ON *.* TO root@'%' IDENTIFIED BY 'PASSWORD';

# Open Firewall Ports
sudo firewall-cmd --zone=public --add-port=3306/tcp --permanent 
sudo firewall-cmd --zone=public --add-port=3306/udp --permanent 
sudo firewall-cmd --reload
