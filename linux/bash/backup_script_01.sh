#!/bin/bash

#Variables


#Speach
echo "getting started"
say -v Sam -r 250 "The current local time is" `date +%l:%M" "%p`;afplay /System/Library/Sounds/Glass.aiff




say "Connecting to main server"

#ssh ai@yourdomain.com 'ls -l'


say "backing up your email"
echo "backing up you email"
sudo rsync -avHe ssh user@192.168.1.100:/home/user/Mail /cloud/yourdomain | say

say "backing up webserver logs"
echo "backing up webserver logs"




#!/usr/bin/expect
sudo rsync -avHe ssh root@192.168.1.100:/var/log /var/log/yourdomain/2017 
#rsync -avHe ssh user@192.168.1.100:/var/log /var/log/yourdomain/2017 | say
