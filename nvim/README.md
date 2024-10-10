# Neovim cofig folder

[Neovim](https://neovim.io/) is a text editor based on vim which offers very extensive APIs and a lot of customization options.
The config that is currently used here is [AstroNvim](https://astronvim.com/) with a few configuration changes.

For initialization on Windows, run the following command:

```pwsh
sudo cmd /c mklink /d $env:localappdata\nvim (Resolve-Path .\).Path
```

This will create a Symlink inside the AppData directory pointing to the GitHub files.
The device will create an additional folder called `nvim-data` which stores things like caches and lazily loaded extension files. This folder is not synced to GitHub because it is individual to each device. Therefore, it exists in `AppData\nvim` without a symlink.
