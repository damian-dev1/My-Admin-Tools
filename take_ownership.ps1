param(
    [string]$FolderPath
)

if (-not (Test-Path $FolderPath)) {
    Write-Host "Folder does not exist: $FolderPath"
    exit 1
}

try {
    Write-Host "Taking $FolderPath ..."
    takeown /f "$FolderPath" /r /d y | Out-Null
    icacls "$FolderPath" /grant "$($env:USERNAME):(F)" /t | Out-Null
    Write-Host "Success to $env:USERNAME"
} catch {
    Write-Host "Failed: $_"
}
