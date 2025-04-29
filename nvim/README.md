# Neovim cofig folder

[Neovim](https://neovim.io/) is a text editor based on vim which offers very extensive APIs and a lot of customization options.
This is a minimal config designed to behave more like a "notepad on steroids" and not an IDE.

For initialization on Windows, run the following command:

```pwsh
sudo cmd /c mklink /d $env:localappdata\nvim (Resolve-Path .\).Path
```

This will create a Symlink inside the AppData directory pointing to the GitHub files. You may need to delete the symlink made by the old nvim files if you're migrating to this version.
