# Terminal configurations

I use two terminal applications (Windows Terminal and WezTerm). In each I have the same PowerShell Core profile and use the scoop package manager for ecerything I can.
Due to the size of WezTerm's config files, they have gotten their own folder [here](../wezterm).

## Windows Terminal configuration

The entire Windows Terminal configuration fits into the `settings.json` file, so you can make a symlink to keep it up to date.

If you've installed Windows Terminal from the Microsoft Store or it was preinstalled on your OS:
```powershell
Rename-Item -Force $env:localappdata\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json settings.json.bak
sudo cmd /c mklink $env:localappdata\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json (Resolve-Path .\settings.json).Path
```

If you've installed Windows Terminal yourself through the .zip folder or scoop download:
```powershell
Rename-Item -Force '$env:localappdata\Microsoft\Windows Terminal\settings.json' settings.json.bak
sudo cmd /c mklink '$env:localappdata\Microsoft\Windows Terminal\settings.json' (Resolve-Path .\settings.json).Path
```

## PowerShell profile configuration

This configuration applies to PowerShell Core (not Windows PowerShell), which can be downloaded via:
```powershell
winget install --id Microsoft.PowerShell --source winget
```

To make a symlink of your profile so the settings, aliases, colors etc. are consistent accross systems, execute the following command:
```powershell
Rename-Item -Force $home\Documents\PowerShell\Microsoft.Powershell_profile.ps1 Microsoft.Powershell_profile.ps1.bak
sudo cmd /c mklink $home\Documents\PowerShell\Microsoft.Powershell_profile.ps1 (Resolve-Path .\profile.ps1).Path
```

## Scoop package manager

[Scoop](https://scoop.sh) is a package manager similar to winget, but it keeps all executables in one place for easier finding and to keep the PATH variable from getting cluttered.
Install scoop with:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

## Oh-My-Posh

[Oh-My-Posh](https://ohmyposh.dev) is a program that makes the shell prettier and allows for themes at the prompt.
Install it via scoop with:
```powershell
scoop install oh-my-posh
```

Oh-My-Posh is also used in the profile.ps1 file, so not installing would yield an error message on each shell start. To avoid this, you can just remove the first lines responsible for configuring Oh-My-Posh.
Oh-My-Posh uses the vsparl theme, which I have made based on the slimfat theme by [irdkwmnsb](https://github.com/irdkwmnsb).

## Terminal-Icons

[Terminal-Icons](https://github.com/devblackops/Terminal-Icons) provides some nice icons in the terminal when using things like `ls`, which enhences the way it looks.
It is already referenced in `profile.ps1`, so you only need to install it and it will work (provided you have a nerd font):
```powershell
scoop bucket add extras
scoop install extras/terminal-icons
```
