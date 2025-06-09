# File: monitor_outbound_connections.ps1
# Run this as Administrator

$logFile = "$env:USERPROFILE\outbound_connections_log.csv"
$knownConnections = @{}

# Create header if not exists
if (-not (Test-Path $logFile)) {
    "Timestamp,ProcessName,PID,LocalAddress,LocalPort,RemoteAddress,RemotePort,DomainHint" | Out-File -FilePath $logFile -Encoding utf8
}

Write-Host "Monitoring new outbound connections... Press Ctrl+C to stop.`n"

while ($true) {
    $conns = Get-NetTCPConnection -State Established -ErrorAction SilentlyContinue |
        Where-Object { $_.RemoteAddress -notmatch '^127\.|^::1' -and $_.State -eq 'Established' }

    foreach ($conn in $conns) {
        $pid = $conn.OwningProcess
        $key = "$($conn.LocalAddress):$($conn.LocalPort)-$($conn.RemoteAddress):$($conn.RemotePort)"

        if (-not $knownConnections.ContainsKey($key)) {
            try {
                $proc = Get-Process -Id $pid -ErrorAction Stop
                $procName = $proc.Name
            } catch {
                $procName = "Unknown"
            }

            $domainHint = ""
            if ($conn.RemoteAddress -like "*snowflake*" -or $procName -like "*snowflake*") {
                $domainHint = "SUSPICIOUS_SNOWFLAKE"
            }

            $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
            $line = "$timestamp,$procName,$pid,$($conn.LocalAddress),$($conn.LocalPort),$($conn.RemoteAddress),$($conn.RemotePort),$domainHint"
            Add-Content -Path $logFile -Value $line

            if ($domainHint) {
                Write-Host "$line" -ForegroundColor Red
            } else {
                Write-Host $line
            }

            $knownConnections[$key] = $true
        }
    }

    Start-Sleep -Seconds 3
}
