$packageName = 'terasology'
$zipUrl      = 'https://github.com/MovingBlocks/Terasology/releases/download/v5.4.0-rc.1/TerasologyOmega.zip'
$zipFileName = 'TerasologyOmega.zip'
$cacheDir    = Join-Path $env:ChocolateyInstall 'cache'  # Custom cache location inside Chocolatey's installation folder
$cachedFile  = Join-Path $cacheDir $zipFileName
$installDir  = Join-Path $env:ProgramFiles "$packageName"

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
    # Download and cache the zip file if not present
    Write-Host "Downloading $packageName to cache..."
    Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $cachedFile -Url $zipUrl
} else {
    Write-Host "Using cached zip file for $packageName..."
}

# Extract the zip file to the installation directory
Write-Host "Extracting $cachedFile to $installDir..."
Get-ChocolateyUnzip -FileFullPath $cachedFile -Destination $installDir

