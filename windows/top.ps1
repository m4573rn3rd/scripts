# Top like command for windows.
While(1) {ps | sort -des cpu | select -f 15 | ft -a; sleep 10; cls}
