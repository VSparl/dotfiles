Copy-Item .\victor.ahk "~\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\victor.ahk" -Force
Start-Process "C:\Users\sparl\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\victor.ahk"
Write-Output "The Autohotkey script has been activated and will start on startup."
Write-Output "To change this behaviour, disable it in the task manager."
