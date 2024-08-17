function Profile-Setup {
	# enter color scheme and font into profile
	Copy-Item .\profile.ps1 $PROFILE -Force
}


# Set the working directory to the directory where the script is located
Set-Location -Path $PSScriptRoot

Profile-Setup
Write-Output "Profile setup completed."

