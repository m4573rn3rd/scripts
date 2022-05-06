clear
{
    if mountpoint -q /mnt/external; then
        echo "/mnt/external is already mounted"
    else
        echo "Trying to mount volume /mnt/external"
        mount /dev/sdc1 /mnt/external
        ls /mnt/external
    fi
}
echo "backing up the server"
#sudo rsync -a --info=progress2 --exclude="lost+found" --exclude=".cache" /home/bmcclain /mnt/external/backups
#clear
echo "all done"