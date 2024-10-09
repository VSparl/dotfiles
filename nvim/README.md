# Neovim cofig folder

For initialization on Windows, run the following command:

```pwsh
sudo cmd /c mklink /d $env:localappdata\nvim (Resolve-Path .\).Path
```

This will create a Symlink inside the AppData directory pointing to the GitHub files.
