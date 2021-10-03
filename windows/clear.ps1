RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8

del /F /Q %APPDATA%\Microsoft\Windows\Recent\*

del /F /Q %APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*

del /F /Q %APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*

REG Delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /VA /F

REG Delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths /VA /F 

taskkill /f /im explorer.exe

start explorer.exe