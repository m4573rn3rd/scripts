# You might need to run "Get-ExecutionPolicy" and make sure you are set to unrestricted.
# To set the policy run "Set-ExecutionPolicy Unrestricted" as administrator.
Import-Module VMware.VimAutomation.Core
Set-PowerCLIConfiguration -ProxyPolicy NoProxy
# I turn off certs in the lab.
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Get-PowerCLIConfiguration
Set-PowerCLIConfiguration -Scope User -InvalidCertificateAction warn
Connect-VIServer -Server yourserver -Protocol http -User 'youusername' -Password 'yourpassword'
# Or you could run the below command.
connect-viserver "example ip"

