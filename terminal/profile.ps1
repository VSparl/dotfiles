# Theme initialization
oh-my-posh init pwsh --config "$home\programming\dotfiles\terminal\vsparl.omp.json" | Invoke-Expression

# Set fzf as command history search handler
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+p' -PSReadlineChordReverseHistory 'Ctrl+r'
# Make the fzf command more friendly
Set-Alias fzf Invoke-Fzf

# Override the default colors to match nord theme
Set-PSReadLineOption -Colors @{
	InlinePrediction = '#b48ead'
	Parameter = '#8fbcbb'
	String = '#a3be8c'
	Command = '#88c0d0'
}

# Aliases
Set-Alias celar clear
Set-Alias claer clear
Set-Alias clera clear
Set-Alias cler clear
Set-Alias lcear clear
Set-Alias cat bat
Set-Alias paste Get-Clipboard
Set-Alias l Get-ChildItem
Set-Alias lvim 'C:\Users\sparl\.local\bin\lvim.ps1'
Set-Alias ls lsd
Set-Alias lg lazygit

Remove-Alias copy -Force -ErrorAction SilentlyContinue
Set-Alias copy Set-Clipboard

Remove-Alias sl -Force -ErrorAction SilentlyContinue
Set-Alias sl ls

# Function to remove items recursively and forced, similar to Unix's "rm -rf" command
function rmf([string]$item)
{
	Remove-Item -Recurse -Force "$item"
}

# Function to list all files/folders in a directory, even if they are hidden or system files
function la()
{
	lsd -A
}

# Function to create a new directory and directly switch to it
function cnd([string]$name)
{
	mkdir $name
	Set-Location $name
}

# Function to change directly to the school directory
function cds()
{
	Set-Location "C:\Users\sparl\OneDrive - EDU ZG\Schuljahr 2024-2025"
}

# Function to create a symlink to a certain directory
function symlink {
	param (
		[Parameter(Mandatory=$true)]
		[string]$source,
		[Parameter(Mandatory=$true)]
		[string]$destination
	)
	sudo cmd /c mklink /d "$source" "$destination"
}

# Function to fuzzily find files and preview them with live coloring through bat
function fzf {
	fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"
}

# Function to activate a venv more comfortably
function activate {
    $activatePath = ".\.venv\Scripts\activate"
    
    if (Test-Path $activatePath) {
        . $activatePath
    } else {
        Write-Error "No virtual environment found at .\.venv\Scripts\activate"
    }
}

# Function to display an image in WezTerm
function icat([string]$img){wezterm imgcat $img}

# Function to go back the specified number of directory levels
function b {
    param (
        [int]$levels = 1
    )

    # Start from the current directory
    $path = Get-Location

    # Iterate to go up 'levels' number of directories
    for ($i = 0; $i -lt $levels; $i++) {
        $path = Split-Path -Path $path -Parent
    }

    # Set the new location
    Set-Location -Path $path
}

# Remap cls to clear && ls
Remove-Alias cls -Force -ErrorAction SilentlyContinue
function cls {
    param (
        $location = "."
    )

    cd $location
    clear
    ls
}

# Quickly make a backup of a file
function backup {
    param (
        $target
    )

    cp "$target" "$target.bak"
}
