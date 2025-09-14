# Neovim cofig folder

[Neovim](https://neovim.io/) is a text editor based on vim which offers very extensive APIs and a lot of customization options.

For initialization on Windows, run the following command from  **powershell with admin privileges** while inside the same directory as this readme:

```pwsh
cmd /c mklink /d $env:localappdata\nvim (Resolve-Path .\).Path
```

This will create a Symlink inside the AppData directory pointing to the GitHub files. You may need to delete the symlink made by the old nvim files if you're migrating to this version.
