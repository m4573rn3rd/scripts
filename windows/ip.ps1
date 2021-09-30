# Get list from file, initialize empty array

$ListOfIPs=Get-content ".\host.txt"
$ResultList = @()

# roll through the list, resolving as we
# go with the .Net DNS resolver

foreach ($IP in $ListOfIPs)
{
# We don't want to see any errors as we go, right?

$ErrorActionPreference = "silentlycontinue"
$Result = $null

# status to user, just so they know that something
# is still happening, then pass the current IP
# to .Net for name resolution.

write-host "resolving $IP"
$result = [System.Net.Dns]::gethostentry($IP)


# Enter into the array, with the returned results.

If ($Result)
{
$ResultList += "$IP   #  " + [string]$Result.HostName
}
Else
{
$ResultList += "$IP   #  unresolved"
}
}

# send it out to a file, and inform the user we are done

$ResultList | Out-File .\resolved.txt
write-host "name resolution complete"