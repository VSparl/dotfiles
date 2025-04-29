# Xournal++ config folder

[Xournal++](https://xournalpp.github.io/) (/ˌzɚnl̟ˌplʌsˈplʌs/) is the application I use for notetaking and school stuff.

Make the symlink using:
```powershell
sudo cmd /c mklink /d $env:localappdata\xournalpp (Resolve-Path .\).Path
```
