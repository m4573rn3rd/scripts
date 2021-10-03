#!/bin/bash
####################################
#
#  Backup Script
#
####################################
echo "Hello Human Lets Back Your Stuff Up"
# What to backup. 
backup_files="/home/rabbit /opt"
# Who to email 
mailto="root@localhost"
# Where to backup to.
dest="/media/rabbit/FLOPPYDISK"
logfile="$dest/"backup_log_"$(date +'%Y_%m')".txt
# Create archive filename.
day=$(date +%d-%m-%y)
hostname=$(hostname -s)
archive_file="$hostname-$day.tgz"
# Print start status message.
echo "Backing up $backup_files to $dest/$archive_file"
date
echo
# Backup the files using tar.
echo "Syncing Important Files"
rsync -r /var/www/html /home/rabbit/Websites
sudo rsync -avzh  /fastrabbit/boinc /opt
echo "Starting Backup"
tar czf $dest/$archive_file $backup_files
# Print end status message.
echo
echo "Backup finished"
date
# Long listing of files in $dest to check file sizes.
ls -alh $dest
# Added for mysql
#mysqldump -uusername -ppassword -h111.111.111.111 ddbname > $v_path/$v_file_name`date +%Y-%m-%d`.sql 
#if [ "$?" -eq 0 ]
#  then
#   v_cnt=`expr $v_cnt + 1`
#  mail -s "DB Backup has been done successfully" $MAILTO < $logfile_path/db_log.log
# else
#   mail -s "Alert : kaka DB Backup has been failed" $MAILTO < $logfile_path/db_log.log
#   exit
#fi
###### Notes ######
#echo "operation finished at $(date +'%d-%m-%Y %H:%M:%S')" >> "$logfile"
#echo "*****************" >> "$logfile"
#exit 0
