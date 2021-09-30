# This will list vms and what datastore they have attached. 

param (
    [string]$server = "your_server_ip",
    [string]$protocol = "https"
    #[string]$user = "root",
    #[string]$password = $( Read-Host "Input password" -AsSecureString )
    )

Connect-VIServer -Server $server -Protocol $protocol
Get-VM |
Select Name,
@{N="Datastore";E={[string]::Join(',',(Get-Datastore -Id $_.DatastoreIdList | Select -ExpandProperty Name))}},
@{N="UsedSpaceGB";E={[math]::Round($_.UsedSpaceGB,1)}},
@{N="ProvisionedSpaceGB";E={[math]::Round($_.ProvisionedSpaceGB,1)}},
@{N="Folder";E={$_.Folder.Name}} 