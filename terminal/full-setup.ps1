function Install-Scoop {
	# install scoop package manager
	$profileinstaller = Start-Process -FilePath "powershell.exe" -ArgumentList ".\get-scoop.ps1" -Wait -PassThru
	# check for exit code
	if ($scoopInstaller.ExitCode -eq 0) {
		Write-Output "Successfully installed the scoop package manager."
		# Reload environment variables to make scoop accessible
		& $PROFILE
	} else {
		Write-Output "Failed to install scoop. Exit code: $($scoopInstaller.ExitCode)"
		Write-Output "Scoop is needed to proceed with script. Please install manually, then rerun script."
		exit 1
	}
}

function Install-Ohmyposh{
	# Install oh-my-posh
	$profileinstaller = Start-Process -FilePath "powershell.exe" -ArgumentList ".\get-oh-my-posh.ps1" -Wait -PassThru
	# check exit code
	if ($ohmyposhinstaller.ExitCode -eq 0) {
		Write-Output "Successfully installed oh-my-posh."
	} else {
		Write-Output "Failed to install oh-my-posh. Exit code: $($ohmyposhinstaller.ExitCode)"
		scoop uninstall oh-my-posh
		Write-Output "oh-my-posh installation removed from scoop. Please install manually."
	}
}


function Install-Profile {
	# Replace old profile with new profile
	$profileinstaller = Start-Process -FilePath "powershell.exe" -ArgumentList ".\install-profile.ps1" -Wait -PassThru
	# check exit code
	if ($profileinstaller.ExitCode -eq 0) {
		Write-Output "Successfully applied profile."
	} else {
		Write-Output "Something went wrong while installing the profile, please copy it manually."
	}
}

function Show-Fonts {
	# Go to fonts download page
	Start-Process -Filepath https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
}


# Set the working directory to the directory where the script is located
Set-Location -Path $PSScriptRoot

# Create user startup profile
New-Item -Type File -Force $PROFILE

# Perform check and install scoop
if (Get-Command scoop -ErrorAction SilentlyContinue) {
    Write-Output "scoop is already installed."
} else {
	Install-Scoop
}

# Perform check and install Oh-my-posh
if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
	Write-Output "oh-my-posh is already installed."
} else {
	Install-Ohmyposh
}

# Reload environment variables
& $PROFILE
# Install the profile
Install-Profile
Write-Output "If the changes didn't apply, manually run the .\install-profile.ps1 script and restart your terminal."

# Prompt user to install fonts
Write-Output "You will now be redirected to a browser window to download the JetBrains Mono Nerd font."
Write-Output "Please extract and install all the fonts inside the .zip folder."
Start-Sleep -s 2
Show-Fonts
