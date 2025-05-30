# CLEAN-INSTALL-CHECKLIST

A professional step-by-step guide for performing a **clean Windows 10 Pro install**, restoring only essential tools, hardening privacy, and bootstrapping a secure development environment.

---

## Table of Contents

1. [Pre-Install Preparation](#pre-install-preparation)
2. [Bootable Media Creation](#bootable-media-creation)
3. [Clean Install Process](#clean-install-process)
4. [Post-Install First Boot Actions](#post-install-first-boot-actions)
5. [Debloat & Privacy Hardening](#debloat--privacy-hardening)
6. [Development Environment Setup](#development-environment-setup)
7. [Finalization & Backup](#finalization--backup)

---

## Pre-Install Preparation

### 1. Backup Required Files from `C:\`
- Documents
- Desktop files
- `.ssh/`, `.vscode/`, `.gitconfig`, custom scripts
- AppData: `Roaming\Code`, `Roaming\npm`, `Roaming\Python`, etc.
- Browser profiles or password manager exports

> Use `1_backup/backup_script.ps1` if you want to automate this step.

### 2. Confirm Encrypted Backup Drive (`D:`)
- Ensure **Samsung 970 EVO Plus 2TB** is unlocked/mounted
- Copy all critical content to `D:\Backup`

### 3. Prepare Drivers (Optional)
- Download your motherboard LAN/Chipset/Audio drivers from ASUS
- Save to `D:\Drivers`

---

## Bootable Media Creation

### 4. Download ISO from Microsoft
- [Windows 10 Pro ISO](https://www.microsoft.com/software-download/windows10)

### 5. Create Bootable USB
- Use [Rufus](https://rufus.ie) in **UEFI + GPT** mode
- File system: `NTFS`
- Partition scheme: `GPT`

---

## Clean Install Process

### 6. Boot into USB and Begin Setup
- Press `Del` or `F2` at startup to access BIOS
- Boot from USB drive (UEFI mode)

### 7. Choose “Custom: Install Windows only (advanced)”

### 8. Delete all partitions on `C:` (Samsung 990 PRO 1TB)
- Select `Unallocated space`
- Click **Next**

> ⚠ Do NOT format or touch `D:` — this contains your backups.

---

## Post-Install First Boot Actions

### 9. Connect to LAN or Wi-Fi temporarily (for activation and updates)

### 10. Choose “Offline Account” or “Domain Join Instead” (for local account)
- Use local admin account for full control
- Skip linking Microsoft account

### 11. Skip Cortana and all personalization prompts
- Do **not** enable location, ads, or diagnostics

---

## Debloat & Privacy Hardening

### 12. Run `setup_dev_env.bat` as Administrator
Located in: `3_setup_scripts/setup_dev_env.bat`

- Disables telemetry, tracking services
- Removes UWP bloat apps
- Installs core dev tools via Chocolatey

```powershell
cd D:\your-repo\3_setup_scripts
.\setup_dev_env.bat
```

### 13. Run Chris Titus Tech WinUtil

```powershell
irm "https://christitus.com/win" | iex
```

**Tweaks to apply:**

- Disable Telemetry
    
- Disable Cortana
    
- Remove OneDrive (if not using)
    
- Disable Suggested Apps / Ads
    
- Disable background apps
    
- Enable dark theme + performance tweaks
    

* * *

## Development Environment Setup

### 14. Restore your dotfiles and settings

- Git: `.gitconfig`
    
- VSCode: `settings.json`, extensions
    
- PowerShell: `Microsoft.PowerShell_profile.ps1`
    
- SSH keys: `.ssh/`
    

### 15. (Optional) Install Additional Dev Tools

```bash
choco install -y postman docker-desktop nodejs-lts nvm keepassxc jetbrains-toolbox powertoys
```

* * *

## Finalization & Backup

### 16. Create a Restore Point

- Start > Create Restore Point > Configure > Turn on Protection
    
- Click “Create” and name it “Post Clean Install”
    

### 17. Verify system state

- Check `SystemSettings.exe` launches
    
- Windows Update completes
    
- Chocolatey apps work via `choco list --local-only`
    

### 18. Sync repo updates

```bash
git init
git remote add origin https://github.com/YOURNAME/windows-setup-pro.git
git add .
git commit -m "initial post-install setup"
git push -u origin main
```

* * *

## You’re Done

You now have a fully hardened, zero-bloat, dev-ready Windows 10 Pro install. Repeatable. Documented. Yours.
