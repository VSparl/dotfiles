# Helix

[Helix](https://helix-editor.com/) is an editor similar to [Neovim](../nvim/README.md), but written in Rust and with less required setup in mind.

## Setup

For the setup that _is_ required, a [`config.toml`](./config.toml) file is created in `%AppData%\helix\`.
Furthermore, [`languages.toml`](./languages.toml) also lives in that directory. This file contains language-specific configs and overrides `config.toml` when settings conflict.

Create a symlink to the required directory using the following command, **ran from the directory that contains this file** (you may need to use an **elevated** powershell session for it to work)

```powershell
cmd /c mklink /d $env:appdata\helix (Resolve-Path .\).Path
```

This will point helix directly to your configuration folder, so all your configs are in one place.
