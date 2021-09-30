# This will create vms useing the vmware power cli.
Get-VM -Name Computer1 | Get-CDDrive| Set-CDDrive -Connected $true -IsoPath '[DataStoreName] SubfolderName\file.iso' -StartConnected $true


# Example Script
NewVMParams = @{
   'VMHost' = 'examplehostname' # Ip address of esxihost
   'Name' = 'exampleserver' # Name of new server 
   'Datastore' = 'ExampleDatastore1' # Were you are going to place the virtual harddisk.
   'DiskGB' = 32 # The Size of the virtual harddisk 
   'DiskStorageFormat' = 'Thin' # Thick or thin provisioning. 
   'MemoryGB' = 2 # This is the amount of memory you want.
   'GuestId' = 'windows8Server64Guest' #Type of guest os.
   'Version' = 'v10'
   'NumCpu' = 2 # Number of cpu's
   'Notes' = 'Auto Build'
    }
   $VM = New-VM @NewVMParams

   $NewCDDriveParams = @{
     'VM' = $VM
     'IsoPath' = '[YourDataStoreLUN01] ISO\TOODAMNBIG.iso'
     'StartConnected' = $true
     }
   New-CDDrive @NewCDDriveParams
    Sleep 10s
  Start-VM -VM $VM
   
  
  
  