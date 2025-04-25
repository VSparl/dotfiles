# Nilesoft Shell configuration

Nilesoft shell is a program that lets you change the way the Windows Explorer right-click menu behaves and looks like.

## Installation

Shell can be installed with scoop using:
```powershell
scoop bucket add extras
scoop install extras/nilesoft-shell
```

## Setup files

The config files have to be in the same directory as the shell.exe executable, but aren't in their own folder. This means that the setup requires multiple symlinks to work properly.

### shell.nss

The main file is called [`shell.nss`](./shell.nss). From here, the rest of the scripts and `.nss` files are called. This file has to be in the same directory as the executable, so it requires its own symlink
Create the symlink using:
```powershell
sudo cmd /c mklink $home\scoop\apps\nilesoft-shell\current\shell.nss (Resolve-Path .\shell.nss).Path
```

The other files that need to be accessed are in the `extras` folder, which recieves its symlink using:
```powershell
sudo cmd /c mklink /d $home\scoop\apps\nilesoft-shell\current\extras\ (Resolve-Path .\exras).Path
```
