param(
    [string]$DriveLetter
)

function Unlock-Drive {
    param($DriveRoot)

    if (-not (Test-Path $DriveRoot)) {
        Write-Host "❌ Drive does not exist: $DriveRoot"
        exit 1
    }

    Write-Host "WARNING: You are about to take ownership and unlock ALL files and folders on $DriveRoot."
    Write-Host "This can impact system stability if used on OS drives like C:."
    Write-Host "Proceed carefully."
    $confirm = Read-Host "Type YES to continue"
    if ($confirm -ne "YES") {
        Write-Host "Operation cancelled."
        exit 0
    }

    try {
        Write-Host "`n🛠 Taking ownership of drive $DriveRoot ..."
        takeown /f "$DriveRoot" /r /d y | Out-Null

        Write-Host "🛠 Granting full permissions to user $env:USERNAME ..."
        icacls "$DriveRoot" /grant "$($env:USERNAME):(F)" /t /c | Out-Null

        Write-Host "Successfully unlocked drive $DriveRoot for user $env:USERNAME"
    } catch {
        Write-Host "Failed to unlock drive: $_"
    }
}

# Ensure DriveLetter ends with "\"
if (-not $DriveLetter.EndsWith("\")) {
    $DriveLetter = "$DriveLetter\"
}

Unlock-Drive -DriveRoot $DriveLetter
