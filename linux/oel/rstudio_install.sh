# Rstudio install on oel 7.9

#Enable epel repo
vi /etc/yum.repos.d/oracle-linux-ol7.repo
# Enable 

#[ol7_u9_base]
#name=Oracle Linux $releasever # EnableUpdate 9 installation media copy ($basearch)
#baseurl=https://yum$ociregion.$ocidomain/repo/OracleLinux/OL7/9/base/$basearch/
#gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-oracle
#gpgcheck=1
#enabled=1 # Change for 0 to 1 in confige to enable the repo.

#[ol7_optional_latest]
#name=Oracle Linux $releasever Optional Latest ($basearch)
#baseurl=https://yum$ociregion.$ocidomain/repo/OracleLinux/OL7/optional/latest/$basearch/
#gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-oracle
#gpgcheck=1
#enabled=1 # Change for 0 to 1 in confige to enable the repo.



# Open ports in firewall for the app
sudo firewall-cmd --zone=public --add-port=8787/tcp --permanent 
sudo firewall-cmd --zone=public --add-port=8787/udp --permanent 
sudo firewall-cmd --reload


yum update -y ; yum upgrade -y
yum install wget unixODBC unixODBC-devel texlive libcurl-devel openssl-devel libxml2-devel texinfo 
sudo yum install readline-devel xz xz-devel pcre pcre-devel libcurl-devel java-1.8.0-openjdk *gfortran* zlib* bzip2-*

# Blank server enable sshd service.
service sshd start
systemclt enable sshd


cd /home/root
wget https://download2.rstudio.org/server/centos7/x86_64/rstudio-server-rhel-2021.09.0-351-x86_64.rpm
sudo yum install rstudio-server-rhel-2021.09.0-351-x86_64.rpm
sudo yum install -y R

# To stop the services run 
sudo service  rstudio-server stop
# You may need to run 
#sudo yum install -y R --skip-broken
