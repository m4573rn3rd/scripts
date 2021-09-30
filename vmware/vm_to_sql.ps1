Connect-VIServer -Server vcenter.fqhn.whatever 
$VIServer = Get-VM | select Name,  PowerState, NumCpu, MemoryGB 


foreach($VIServer in $VIServer) 
{ 
$Name=$VIServer.Name 
$PowerState=$VIServer.PowerState 
$NumCpu=$VIServer.NumCpu 
$MemoryGB=$VIServer.MemoryGB 


$insertquery=" 
INSERT INTO [dbo].[VIServer] 
           ([Name] 
           ,[PowerState]
           ,[NumCpu] 
           ,[MemoryGB]) 
     VALUES 
           ('$Name' 
           ,'$PowerState'
           ,'$NumCpu' 
           ,'$MemoryGB') 
GO 
" 
 
Invoke-SQLcmd -ServerInstance '192.168.0.100,1433' -query $insertquery -U user -P Pa$$w0rd1 -Database nerdsrule
 
}