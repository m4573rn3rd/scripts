# These commands can be run on the Nessus scanner command line, to reset and link Nessus to Tenable.io
service nessusd stop
cd /opt/nessus/sbin
./nessuscli fix --reset-all
./nessuscli adduser
./nessuscli managed link --key=<LINKING KEY> --cloud
service nessusd start
