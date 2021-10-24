# This will install rstudio on ubuntu.
sudo apt-get install r-base
wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-2021.09.0-351-amd64.deb
sudo apt-get install lib32gcc-s1 lib32stdc++6 libc6-i386 libclang-10-dev libclang-common-10-dev libclang-dev libobjc-9-dev libobjc4
sudo dpkg -i  rstudio-server-2021.09.0-351-amd64.deb
# In the local browser you need to go to 
# http://<clientip>:8787

# I do not like to have the server running all the time on my laptop so I disable the service. 
sudo rstudio-server stop
sudo systemctl disable rstudio-server

# When you want to use the server just start the service again.
sudo rstudio-server start
sudo rstudio-server status

