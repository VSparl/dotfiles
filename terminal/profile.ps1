# Theme initialization
$theme = 'slimfat'
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\$theme.omp.json" | Invoke-Expression

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
	cd $name
}
