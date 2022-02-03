#Connect-VIServer -Server 192.168.1.100 -User bmcclain@vsphere.local -Password 
#Connect-ViServer -Server "192.168.1.100"
#Get-VM
#(Get-VM).Guest.IPAddress
Get-VMHostNetworkAdapter | select VMhost, Name, IP, SubnetMask, Mac, PortGroupName, vMotionEnabled, mtu, FullDuplex, BitRatePerSec | Export-Csv C:\Users\blm04\git\scripts\windowsVMHostNetworkDetails.csv 