# Get Keys from esxi host 
$hosts = @( 
"192.168.0.100"
"192.168.0.101"
);
$user = "root" 
$password = ""
Connect-VIServer -Server $hosts -User $user -Password $password
Get-VMHost | Select-Object -Property Name,LicenseKey | Export-Csv -path “C:\key_data.csv” -NoTypeInformation