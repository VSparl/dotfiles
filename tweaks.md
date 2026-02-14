# Tweaks

Here are smaller adjustments to the OS in general such as registry edits or helpful scripts. These don't necessarily need their own directory, but are good to have nevertheless.

## ChrisTitusTech's WinUtil

[WinUtil](https://github.com/ChrisTitusTech/winutil) is a useful utility that can make all kinds of tweaks to a Windows system in order to make it more efficient, streamlined or user-friendly.
To access the script, run the following command from an **elevated** PowerShell window:
```powershell
irm "https://christitus.com/win" | iex
```

## Python venv taking control of the terminal prompt

Because the Activate.ps1 script of the Python `venv` module takes control of the terminal prompt, it puts the name of the venv in brackets at the beginning of the prompt. This is unneccesary and aestheatically unpleasing due to the fact that it disrupts the design of the oh-my-posh prompt.
To combat this, you can set `$env:VIRTUAL_ENV_DISABLE_PROMPT = 1` in the global `Activate.ps1` file so it persists for all new venvs created. This should be done on the line after `$env:VIRTUAL_ENV = $VenvDir`, which should be around line 221.
If you installed Python with scoop, you can find the `Activate.ps1` file under `$home\scoop\apps\python\current\Lib\venv\scripts\common\Activate.ps1`
> Note: This workaround will not apply to venvs that have already been created. Here, you need to perform the same steps, but in the directory of the venv itself rather than the global one for all venvs.

## Switch Escape and CapsLk on Windows

Nifty registry edit: Make a file with a `.reg` extension containing the following:

```
REGEDIT4
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]
"Scancode Map"=hex:00,00,00,00,00,00,00,00,02,00,00,00,01,00,3a,00,00,00,00,00   
```

Double-click the file to apply the registry edit and reboot to be sure. Your CapsLk and Esc keys are now swapped for the entire operating system.
