# Send files over ssh. 
tar zcvf - /dirtosend | ssh user@192.168.1.100 "cat > /remotefile/file.tar.gz"