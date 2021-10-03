#### Variables #### 
 
    $objShell = New-Object -ComObject Shell.Application 
    $objFolder = $objShell.Namespace(0xA) 
    $Lenovo = "C:\Program Files\Lenovo\System Update\session\*" 
    $temp = get-ChildItem "env:\TEMP" 
    $temp2 = $temp.Value 
    $swtools = "c:\SWTOOLS\*" 
    $WinTemp = "c:\Windows\Temp\*" 
     
 
 
#2# Remove temp files located in "C:\Users\USERNAME\AppData\Local\Temp" 
    write-Host "Removing Junk files in $temp2." -ForegroundColor Magenta  
    Remove-Item -Recurse  "$temp2\*" -Force -Verbose 
 

     
#4#    Empty Recycle Bin # 
    write-Host "Emptying Recycle Bin." -ForegroundColor Cyan  
    $objFolder.items() | %{ remove-item $_.path -Recurse -Confirm:$false} 
     
#5# Remove Windows Temp Directory  
    write-Host "Removing Junk files in $WinTemp." -ForegroundColor Green 
    Remove-Item -Recurse $WinTemp -Force  
     
#6# Running Disk Clean up Tool  
    write-Host "Finally now , Running Windows disk Clean up Tool" -ForegroundColor Cyan 
    cleanmgr /sagerun:1 | out-Null  
     
    $([char]7) 
    Sleep 1  
    $([char]7) 
    Sleep 1      
     
    write-Host "I finished the cleanup task,Bye Bye " -ForegroundColor Yellow
    cls
    write-Host "Running Security Scan" -ForegroundColor Yellow
    RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8

    del /F /Q %APPDATA%\Microsoft\Windows\Recent\*

    del /F /Q %APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*

    del /F /Q %APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*

    REG Delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /VA /F

    REG Delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths /VA /F 

taskkill /f /im explorer.exe

start explorer.exe
    Get-MpComputerStatus 
    Start-MpScan -ScanType CustomScan -ScanPath ”C:\Program Files” 