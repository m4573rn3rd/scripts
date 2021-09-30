#To generate RSA keys, on the command line, enter
ssh-keygen -t rsa
# Make .ssh dir
mkdir -p ~/.ssh
touch ~/.ssh/authorized_keys
#On the remote system, add the contents of your public key file 
cat ~/id_rsa.pub >> ~/.ssh/authorized_keys
