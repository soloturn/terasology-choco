$packageName = 'Terasology'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/MovingBlocks/Terasology/releases/download/v5.4.0-rc.1/TerasologyOmega.zip'
$destination = "$(Get-ToolsLocation)\TerasologyOmega"

# Download and install Terasology
Install-ChocolateyZipPackage -PackageName $packageName -Url $url -UnzipLocation $destination
