# Theme initialization
oh-my-posh init pwsh --config "$home\programming\dotfiles\terminal\vsparl.omp.json" | Invoke-Expression

# Get nice icons of files when using ls
Import-Module Terminal-Icons

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
Set-Alias cat bat

# Function to remove items recursively and forced, similar to Unix's "rm -rf" command
function rmf([string]$item)
{
	Remove-Item -Recurse -Force "$item"
}

# Function to list all files/folders in a directory, even if they are hidden or system files
function la()
{
	Get-ChildItem -Force
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

# Function to list folder contents and sort them by date
function lst{
	param (
		[string]$Folder = "."
	)
	Get-ChildItem -Path $Folder | Sort-Object -Property CreationTime -Descending
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
