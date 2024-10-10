# WezTerm configuration

[WezTerm](https://wezfurlong.org/wezterm) is a terminal emulator with very impressive capabilities and virtually endless customization.

To create the symlink, execute the following commands:
```powershell
Rename-Item $home\.config\wezterm wezterm.bak
sudo cmd /c mklink /d $home\.config\wezterm (Resolve-Path .\).Path
```
