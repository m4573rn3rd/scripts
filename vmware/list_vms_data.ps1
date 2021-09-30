# This will get a list of all of the vms in the cluster.
Get-VM
# This will list info about current vm in the cluster. 
Get-VM | Select-Object -Property Name,Notes,VMHost,Guest
# This will list all the hostnames and ips of the vms.
Get-VM | Select Name, @{N="IP Address";E={@($_.guest.IPAddress[0])}}
