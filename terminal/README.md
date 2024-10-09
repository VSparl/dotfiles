# Windows Terminal configuration

The entire Windows Terminal configuration fits into the `settings.json` file, so you can make a symlink to keep it up to date.

If you've installed Windows Terminal from the Microsoft Store or it was preinstalled on your OS:
```powershell
rm $env:localappdata\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
sudo cmd /c mklink $env:localappdata\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json (Resolve-Path .\settings.json).Path
```

If you've installed Windows Terminal yourself through the .zip folder or scoop download:
```powershell
rm '$env:localappdata\Microsoft\Windows Terminal\settings.json'
sudo cmd /c mklink '$env:localappdata\Microsoft\Windows Terminal\settings.json' (Resolve-Path .\settings.json).Path
```

# PowerShell profile configuration

This configuration applies to PowerShell Core (not Windows PowerShell), which can be downloaded via:
```powershell
winget install --id Microsoft.PowerShell --source winget
```

To make a symlink of your profile so the settings, aliases, colors etc. are consistent accross systems, execute the following command:
```powershell
sudo cmd /c mklink $home\Documents\PowerShell\Microsoft.Powershell_profile.ps1 .\profile.ps1
```

# Scoop package manager

[Scoop](scoop.sh) is a package manager similar to winget, but it keeps all executables in one place for easier finding and to keep the PATH variable from getting cluttered.
Install scoop with:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

# Oh-My-Posh

[Oh-My-Posh](ohmyposh.dev) is a program that makes the shell prettier and allows for themes at the prompt.
Install it via scoop with:
```powershell
scoop install oh-my-posh
```

Oh-My-Posh is also used in the profile.ps1 file, so not installing would yield an error message on each shell start. To avoid this, you can just remove the first lines responsible for configuring Oh-My-Posh.

