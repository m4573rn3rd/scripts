# WinSCP can be configured in combination with the Windows Task Scheduler to perform this periodic download. 
try { 
Load WinSCP .NET assembly Add-Type -Path "C:\Program Files (x86)\WinSCP\WinSCPnet.dll" 
$ppFilename="c:\usr\etc\encrypted_passphrase.txt" 
if (!([System.IO.File]::Exists($ppFilename))) 
{ Read-Host "Enter your passphrase" -AsSecureString | ConvertFrom-SecureString | 
set-content
$ppFilename 
} 
$pp=Get-Content $ppFilename | ConvertTo-SecureString 
# Setup session options 
$sessionOptions = New-Object WinSCP.SessionOptions -Property @{ 
Protocol = [WinSCP.Protocol]::Sftp 
HostName = "desserver.com" 
UserName = "testuser" 
SshHostKeyFingerprint = "ssh-rsa 2048 key" 
SshPrivateKeyPath="c:\usr\etc\sftp_key.ppk" 
PrivateKeyPassphrase=[Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($pp))
} 

$session = New-Object WinSCP.Session 

try { 
# Try Connecting.

$session.Open($sessionOptions) 
 Download files 
 $transferOptions = New-Object WinSCP.TransferOptions 
 $transferOptions.TransferMode = [WinSCP.TransferMode]::Binary 
 $transferResult = 
 $session.GetFiles("*.*", "c:\tmp\downloadedFiles", $False, $transferOptions) 
 # Throw on any error 
 $transferResult.Check() 
 # Print results 
 foreach ($transfer in $transferResult.Transfers) 
 { 
 Write-Host "Download of $($transfer.FileName) succeeded" 
 } 
 } finally 
 { # Disconnect, clean up 
 $session.Dispose()
 } exit 0
 } catch
 { 
 Write-Host "Error: $($_.Exception.Message)" 
 exit 1 
 }