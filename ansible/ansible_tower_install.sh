sudo yum -y update
sudo yum -y install epel-release
sudo yum -y install ansible vim curl
mkdir /tmp/tower && cd  /tmp/tower
curl -k -O https://releases.ansible.com/ansible-tower/setup/ansible-tower-setup-latest.tar.gz
tar xvf ansible-tower-setup-latest.tar.gz
cd ansible-tower-setup*/
vim inventory
sudo ./setup.sh

We will use the Web UI since this is the most preferred method by most new Ansible Tower users. 
Open your favorite browser point to your Ansible Tower server IP or hostname via https protocol.

