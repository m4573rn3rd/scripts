echo "Creating Ram Disk" && say "Creating Ram Disk"
diskutil erasevolume ExFAT 'ram_disk' `hdiutil attach -nomount ram://8388608`
echo "Ram Disk Created Syncing files" && say "Ram Disk Created Syncing Files"
rsync -avzh /ram_disk /Volumes/ram_disk
echo "Ram disk is ready for use" && say "Ram disk is ready for use"
cd /Volumes/ram_disk
echo "Here are your files" && say "Here are your files"
cd /Volumes/ram_disk
ls -lrh
