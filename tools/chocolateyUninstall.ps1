$installDir = "$(Get-ToolsLocation)\TerasologyOmega"
if (Test-Path $installDir) {
    Remove-Item $installDir -Recurse -Force
}
