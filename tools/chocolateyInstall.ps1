$packageName = 'terasology'
$zipUrl      = 'https://github.com/MovingBlocks/Terasology/releases/download/v5.4.0-rc.1/TerasologyOmega.zip'
$zipFileName = 'TerasologyOmega.zip'
$cacheDir    = Join-Path $env:ChocolateyInstall 'cache'
$cachedFile  = Join-Path $cacheDir $zipFileName
$installDir  = Join-Path $env:ProgramFiles "$packageName"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Ensure the cache directory exists
if (!(Test-Path $cacheDir)) {
    New-Item -ItemType Directory -Path $cacheDir | Out-Null
}

# Ensure the installation directory exists
if (!(Test-Path $installDir)) {
    New-Item -ItemType Directory -Path $installDir | Out-Null
}

# Check if the zip file is already cached
if (!(Test-Path $cachedFile)) {
    Write-Host "Downloading $packageName to cache..."
    Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $cachedFile -Url $zipUrl
} else {
    Write-Host "Using cached zip file for $packageName..."
}

# Extract the zip file to the installation directory
Get-ChocolateyUnzip -FileFullPath $cachedFile -Destination $installDir

# Remove unnecessary macOS and Linux folders
$macosDir = Join-Path $installDir 'natives/macosx'
$linuxDir = Join-Path $installDir 'natives/linux'

if (Test-Path $macosDir) {
    Write-Host "Removing macOS folder..."
    Remove-Item $macosDir -Recurse -Force
}

if (Test-Path $linuxDir) {
    Write-Host "Removing Linux folder..."
    Remove-Item $linuxDir -Recurse -Force
}

# patch files, here, bat file does not know its location in original

$sourceFile = Join-Path $toolsDir 'terasology.bat' 
$destinationFile = Join-Path $installDir 'Terasology.bat' 

# Check if the destination file exists and overwrite it
Write-Host "Overwriting file in $destinationFile"
Copy-Item -Path $sourceFile -Destination $destinationFile -Force
