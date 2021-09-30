# This sets the connection the the server
Connect-VIServer -Server "serverip"
# This creates a report of the vms  
Get-VM | select Name,  PowerState, NumCpu, MemoryGB  | Export-Csv -path “C:\vminventory.csv” -NoTypeInformation
# This makes a report of all of the datastores
Get-Datastore | Export-Csv -path “C:\disk2.csv” -NoTypeInformation
# This will make a report of all vms and ip address 
Get-View -ViewType VirtualMachine | Select Name,@{N='IP';E={[string]::Join(',',$_.Guest.IPAddress)}} | Export-Csv -path “C:\ip.csv” -NoTypeInformation
# This will get everying a user has done.
#Get-VIEvent -Username domain\username –Start 9/3/2019 –Finish 9/4/2019 | Export-Csv -path “C:audit_0001.csv” -NoTypeInformation
# vm host network
Get-VMHostNetworkAdapter | select VMhost, Name, IP, SubnetMask, Mac, PortGroupName, vMotionEnabled, mtu, FullDuplex, BitRatePerSec | Export-Csv -path “C:network.csv” -NoTypeInformation
# active directory report 
Get-ADComputer -Filter * -Properties CanonicalName, CN, userCertificate, Created, OU, DistinguishedName, LastLogonDate, Name, OperatingSystem, OperatingSystemServicePack, OperatingSystemVersion, passwordLastSet | Export-CSV C:\env.csv


###########################################################################################################
#                                                  Storage systems                                        #
###########################################################################################################
Connect-NcController 192.168.0.100 -Credential (Get-Credential)
# get all volumes more than 10gb in size
Get-NcVol -Query @{TotalSize="&gt;$(10GB)"}
# get volumes with root in the name
Get-NcVol -Query @{Name="*root*"}
# get volumes without root at the end of the name
Get-NcVol -Query @{Name="!*root"} 
# get disks which are not a part of an aggregate
Get-NcDisk -Query @{DiskRaidInfo=@{ContainerType="!aggregate"}} 
# non-root volumes which are between 10GB and 1TB in size
Get-NcVol -Query @{VolumeStateAttributes=@{IsNodeRoot=$false};TotalSize="$(10GB)..$(1TB)";}| Export-Csv -path “C:\storage_003.csv” -NoTypeInformation\
