$installDir = Join-Path $env:ProgramFiles "terasology"
if (Test-Path $installDir) {
    Remove-Item $installDir -Recurse -Force
}
