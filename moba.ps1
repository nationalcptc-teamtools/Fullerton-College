# Define the URL for MobaXterm download
$mobaxtermUrl = "https://download.mobatek.net/2072022011030948/MobaXterm_Portable_v21.3.zip"

# Define the destination folder for download and installation
$destinationFolder = "C:\MobaXterm"

# Create the destination folder if it doesn't exist
if (-not (Test-Path -Path $destinationFolder -PathType Container)) {
    New-Item -ItemType Directory -Path $destinationFolder -Force
}

# Define the path for the downloaded ZIP file
$zipFilePath = Join-Path $destinationFolder "MobaXterm.zip"

# Download MobaXterm ZIP file
Invoke-WebRequest -Uri $mobaxtermUrl -OutFile $zipFilePath

# Unzip the contents to the destination folder
Expand-Archive -Path $zipFilePath -DestinationPath $destinationFolder -Force

# Remove the downloaded ZIP file
Remove-Item -Path $zipFilePath -Force

# Run the MobaXterm executable
Start-Process -FilePath (Join-Path $destinationFolder "MobaXterm_Portable.exe")

Write-Host "MobaXterm installation complete."
