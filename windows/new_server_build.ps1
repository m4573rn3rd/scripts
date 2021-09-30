# This will join a windows host to the domain.
add-computer –domainname "YourDomainName"  -restart

# Add systems from a file. 
$computers = Get-Content -Path c:\it\computers.txt
Add-Computer -ComputerName $computers -Domain "YourDomainName" -Restart

# Allow Ping On New windows server. 
netsh advfirewall firewall add rule name="ICMP Allow incoming V4 echo request" protocol="icmpv4:8,any" dir=in action=allow


