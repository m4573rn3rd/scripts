
param (
    [string]$server = "youserverip",
    [string]$protocol = "https"
    #[string]$user = "root",
    #[string]$password = $( Read-Host "Input password" -AsSecureString )
    )

Connect-VIServer -Server $server -Protocol $protocol
##Get Date 
$timestamp=Get-Date 
 
#PowerCLI Version 
$powercliversion = Get-PowerCLIVersion | select -expand SnapinVersions  
 
########################################## 
#collecting VCenter Inventory informartion 
 
$HostsInfo = @() 
Get-VMHost | ForEach-Object { 
  $VMHost = $_ 
  $r = "" | Select-Object -Property VCenterServerName,VCenterVersion,HostName,IsStandAlone,Datacenter,Cluster,VMs,Vendor,Model, FullName,Version,CpuModel,CpuMhz, CPU, CpuCores,HyperThreading,CpuThreads,PowerState, ConnectionState, Datastores 
 
  $r.VCenterServerName = $VMHost.ExtensionData.Client.ServiceUrl.Split('/')[2].Split(':')[0]  
  $r.VCenterVersion=$DefaultVIServer.version   
  $r.HostName = $VMHost.ExtensionData.name 
  $r.IsStandAlone=($VMHost |Select IsStandalone).IsStandalone 
  $r.Cluster = (Get-Cluster -VMHost $VMHost).Name  
  $r.Datacenter= (Get-Datacenter -VMHost $VMHost).Name 
  $Datastores = "" 
  $VMHost | Get-Datastore | ForEach-Object {$Datastores += "$($_.Name);"} 
  $VMs = "" 
  $VMHost | Get-VM | ForEach-Object {$VMs += "$($_.Name);"} 
  $r.VMs = $VMs 
  $r.Vendor = $VMHost.ExtensionData.Summary.Hardware.vendor 
  $r.Model = $VMHost.ExtensionData.Summary.Hardware.model 
  $r.FullName = $VMHost.ExtensionData.Config.Product.Name 
  $r.Version = $VMHost.ExtensionData.Config.Product.version 
  $r.CpuModel = $VMHost.ExtensionData.Summary.Hardware.CpuModel 
  $r.CpuMhz = $VMHost.ExtensionData.Summary.Hardware.CPUMhz 
  $r.CPU = $VMHost.ExtensionData.Summary.Hardware.NumCpuPkgs 
  $r.CpuCores = $VMHost.ExtensionData.Summary.Hardware.NumCpuCores 
  $r.CpuThreads = $VMHost.ExtensionData.Summary.Hardware.NumCpuThreads 
  $r.HyperThreading=$VMHost.HyperThreadingActive 
  $r.PowerState = $VMHost.ExtensionData.Summary.runtime.powerstate 
  $r.ConnectionState = $VMHost.ExtensionData.Summary.runtime.connectionState 
 
   
  $HostsInfo += $r 
} 
 
#Exporting to csv file - VCenter Inventory information 
$expHWfilename = $r.VCenterServerName+"-HW-Inventory-Information.csv"  
$HostsInfo | Export-Csv -Path  $expHWfilename  -NoTypeInformation -UseCulture  
"===============" | Add-Content $expHWfilename 
"### TimeStamp: " + $timestamp | Add-Content $expHWfilename 
"===============" | Add-Content $expHWfilename 
"### "+ $powercliversion | Add-Content $expHWfilename 
 
######################################## 
#collecting Virtual Machines information 
 
$VMInfo = @() 
Get-VM | ForEach-Object { 
  $VM = $_ 
  $v = "" | Select-Object VMName, VMGuestHostName, VMGuestOS, VMIPAddress 
   
  $v.VMName = $VM.Name 
  $v.VMGuestHostName = $VM.ExtensionData.Guest.HostName 
  $v.VMIPAddress = $VM.ExtensionData.Guest.IpAddress 
    
  $VMInfo += $v 
} 
 
#Exporting to csv file - Virtual Machines informartion 
 
$expVMfilename = $r.VCenterServerName+"-VMs-Information.csv"  
$VMInfo |Export-Csv -Path $expVMfilename -NoTypeInformation -UseCulture 
"===============" | Add-Content $expVMfilename 
"### TimeStamp: " + $timestamp  | Add-Content $expVMfilename 
"===============" | Add-Content $expHWfilename 
"### " + $powercliversion | Add-Content $expVMfilename  
