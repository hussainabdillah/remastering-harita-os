# HaritaOS Repository Setup Script for Windows
# Run this in PowerShell as Administrator

param(
    [string]$RepoPath = "HaritaOS"
)

Write-Host "Setting up HaritaOS repository structure..." -ForegroundColor Green

# Create main directory structure
$directories = @(
    "config\branding\plymouth\harita-theme",
    "config\branding\grub\theme\icons",
    "config\branding\wallpapers",
    "config\branding\logos",
    "config\themes\gtk-themes\HaritaGreen\gtk-2.0",
    "config\themes\gtk-themes\HaritaGreen\gtk-3.0",
    "config\themes\gtk-themes\HaritaGreen\metacity-1",
    "config\themes\icon-themes\HaritaIcons\scalable\apps",
    "config\themes\icon-themes\HaritaIcons\scalable\categories",
    "config\themes\icon-themes\HaritaIcons\scalable\devices",
    "config\themes\icon-themes\HaritaIcons\scalable\emblems",
    "config\themes\icon-themes\HaritaIcons\scalable\mimetypes",
    "config\themes\icon-themes\HaritaIcons\scalable\places",
    "config\themes\icon-themes\HaritaIcons\scalable\status",
    "config\themes\icon-themes\HaritaIconsDark\scalable",
    "config\themes\cursors\HaritaCursor",
    "config\applications",
    "config\packages\custom-packages",
    "config\system\systemd",
    "config\system\polkit",
    "config\system\sudoers.d",
    "config\system\default-settings\gsettings",
    "config\system\default-settings\dconf",
    "config\system\default-settings\firefox",
    "config\installer\isolinux",
    "config\installer\casper",
    "scripts\build",
    "scripts\chroot",
    "scripts\post-install",
    "src\harita-welcome\ui\resources",
    "src\harita-settings\ui\resources",
    "src\plymouth-theme\assets",
    "assets\design",
    "assets\screenshots",
    "assets\documentation",
    "tools\iso-builder",
    "tools\package-builder",
    "tools\theme-validator",
    "tests\build-tests",
    "tests\theme-tests",
    "tests\integration-tests",
    "docs\api"
)

# Create directories
foreach ($dir in $directories) {
    $fullPath = Join-Path $RepoPath $dir
    if (!(Test-Path $fullPath)) {
        New-Item -ItemType Directory -Path $fullPath -Force | Out-Null
        Write-Host "Created: $dir" -ForegroundColor Yellow
    }
}

# Create main README.md
$readmeContent = @"
# HaritaOS

🌿 **Ubuntu 20.04 remaster dengan tema hijau yang terinspirasi alam Indonesia**

![HaritaOS Logo](assets/screenshots/desktop.png)

## Overview

HaritaOS adalah distribusi Linux berbasis Ubuntu 20.04 LTS yang dirancang khusus dengan tema hijau yang terinspirasi dari keindahan alam Indonesia. Dilengkapi dengan icon pack kustom, tema yang elegan, dan aplikasi bawaan yang berguna.

## Features

- 🎨 **Tema Hijau Kustomisasi** - Desain yang terinspirasi alam Indonesia
- 🖼️ **Icon Pack Beragam** - Multiple icon themes termasuk HaritaIcons
- 🚀 **Boot Splash Kustom** - Plymouth theme dengan branding HaritaOS
- 🏠 **Welcome App** - Aplikasi selamat datang untuk first-run experience
- ⚙️ **Settings Tool** - Tool konfigurasi sistem yang mudah digunakan
- 🌏 **Lokalisasi Indonesia** - Dukungan Bahasa Indonesia

## Quick Start

```bash
# Clone repository
git clone https://github.com/yourusername/HaritaOS.git
cd HaritaOS

# Download Ubuntu 20.04 ISO
wget http://releases.ubuntu.com/20.04/ubuntu-20.04.6-desktop-amd64.iso

# Build HaritaOS (Linux required)
chmod +x build.sh
sudo ./build.sh
```

## Requirements for Building

**Note: Building HaritaOS requires a Linux environment (Ubuntu/Debian recommended)**

For Windows users:
- Use WSL2 (Windows Subsystem for Linux)
- Use VirtualBox/VMware with Ubuntu
- Use Docker with Ubuntu container

### System Requirements
- Ubuntu/Debian-based system
- Minimum 4GB RAM
- 20GB free disk space
- Internet connection

### Dependencies
```bash
sudo apt install squashfs-tools genisoimage syslinux-utils
```

## Development on Windows

### Option 1: WSL2 (Recommended)
```powershell
# Install WSL2
wsl --install -d Ubuntu-20.04

# Open WSL and follow Linux build instructions
wsl
```

### Option 2: Docker
```powershell
# Pull Ubuntu container
docker pull ubuntu:20.04

# Run container with repository mounted
docker run -it -v ${PWD}:/workspace ubuntu:20.04 bash
```

## Documentation

- [Build Guide](docs/BUILDING.md)
- [Windows Development Setup](docs/WINDOWS-SETUP.md)
- [Customization Guide](docs/CUSTOMIZATION.md)
- [Contributing](docs/CONTRIBUTING.md)

## Screenshots

| Desktop | Applications | Settings |
|---------|-------------|----------|
| ![Desktop](assets/screenshots/desktop.png) | ![Apps](assets/screenshots/applications.png) | ![Settings](assets/screenshots/settings.png) |

## Support

- 🐛 [Report Issues](https://github.com/yourusername/HaritaOS/issues)
- 💬 [Discussions](https://github.com/yourusername/HaritaOS/discussions)
- 📧 Email: support@haritaos.org

## License

GPL-3.0 License - see [LICENSE](LICENSE) for details.

---
Made with ❤️ in Indonesia
"@

Set-Content -Path (Join-Path $RepoPath "README.md") -Value $readmeContent -Encoding UTF8

# Create Windows-specific setup guide
$windowsSetupContent = @"
# Windows Development Setup

Panduan untuk mengembangkan HaritaOS di Windows.

## Prasyarat

HaritaOS memerlukan environment Linux untuk build process. Berikut opsi untuk Windows users:

## Opsi 1: WSL2 (Recommended)

### Install WSL2
```powershell
# Run as Administrator
wsl --install -d Ubuntu-20.04
```

### Setup Development Environment
```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install build dependencies
sudo apt install -y \
    squashfs-tools \
    genisoimage \
    syslinux-utils \
    isolinux \
    xorriso \
    git \
    curl \
    wget

# Clone repository (jika belum)
git clone https://github.com/yourusername/HaritaOS.git
cd HaritaOS

# Download Ubuntu ISO
wget http://releases.ubuntu.com/20.04/ubuntu-20.04.6-desktop-amd64.iso

# Build
chmod +x build.sh
sudo ./build.sh
```

## Opsi 2: VirtualBox/VMware

### Setup Virtual Machine
1. Download Ubuntu 20.04 Desktop ISO
2. Create VM dengan specs:
   - RAM: 4GB minimum (8GB recommended)
   - Storage: 30GB minimum
   - Enable VT-x/AMD-V

### Development Workflow
```bash
# Di VM Ubuntu
git clone https://github.com/yourusername/HaritaOS.git
cd HaritaOS

# Install dependencies
sudo apt install -y squashfs-tools genisoimage syslinux-utils

# Build process
sudo ./build.sh
```

## Opsi 3: Docker

### Setup Docker Desktop
1. Install Docker Desktop for Windows
2. Enable WSL2 backend

### Build dengan Docker
```powershell
# Create Dockerfile
@"
FROM ubuntu:20.04
RUN apt update && apt install -y \
    squashfs-tools \
    genisoimage \
    syslinux-utils \
    git \
    wget \
    sudo
WORKDIR /workspace
"@ | Out-File Dockerfile

# Build container
docker build -t harita-builder .

# Run build
docker run -it -v ${PWD}:/workspace harita-builder bash
```

## Development Tools untuk Windows

### VS Code Extensions
# - Remote - WSL
# - Remote - Containers
# - GitLens
# - Bash IDE
# - YAML

### Konfigurasi Git
```bash
# Set Git untuk line endings
git config --global core.autocrlf input
git config --global core.eol lf
```

### File Transfer
```powershell
# Copy dari WSL ke Windows
cp /mnt/c/Users/YourName/Desktop/file.iso ./

# Copy dari Windows ke WSL
cp ./file.iso /mnt/c/Users/YourName/Desktop/
```

## Testing di Windows

### QEMU di WSL2
```bash
# Install QEMU
sudo apt install qemu-system-x86

# Test ISO
qemu-system-x86_64 -cdrom HaritaOS.iso -m 2048
```

### VirtualBox
```powershell
# Create test VM
VBoxManage createvm --name "HaritaOS-Test" --register
VBoxManage modifyvm "HaritaOS-Test" --memory 2048
VBoxManage storagectl "HaritaOS-Test" --name "IDE" --add ide
VBoxManage storageattach "HaritaOS-Test" --storagectl "IDE" --port 0 --device 0 --type dvddrive --medium "HaritaOS.iso"
VBoxManage startvm "HaritaOS-Test"
```

## Troubleshooting

### WSL Issues
```powershell
# Reset WSL jika bermasalah
wsl --shutdown
wsl --unregister Ubuntu-20.04
wsl --install -d Ubuntu-20.04
```

### File Permission Issues
```bash
# Fix permission di WSL
sudo chown -R ${USER}:${USER} /path/to/repo
chmod +x build.sh
```

### Path Issues
```bash
# Convert Windows path ke WSL path
wslpath "C:\Users\YourName\HaritaOS"
# Output: /mnt/c/Users/YourName/HaritaOS
```

## Performance Tips

# 1. **SSD Storage** - Gunakan SSD untuk WSL2 storage
# 2. **Memory Allocation** - Allocate cukup RAM untuk WSL2
# 3. **Exclude from Antivirus** - Exclude WSL directories dari antivirus scanning
# 4. **Use Native Git** - Install Git di WSL, bukan Windows Git

## Windows Build Script Alternative

Untuk testing tema dan development (tanpa full ISO build):

```powershell
# setup-dev.ps1
Write-Host "Setting up development environment..." -ForegroundColor Green

# Install Git (jika belum ada)
if (!(Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Please install Git for Windows first"
    Start-Process "https://git-scm.com/download/win"
    exit
}

# Clone repository
if (!(Test-Path "HaritaOS")) {
    git clone https://github.com/hussainabdillah/remastering-harita-os.git
}

cd HaritaOS

Write-Host "Development environment ready!" -ForegroundColor Green
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Install WSL2: wsl --install -d Ubuntu-20.04" -ForegroundColor White
Write-Host "2. Open WSL and navigate to repository" -ForegroundColor White
Write-Host "3. Run build.sh in Linux environment" -ForegroundColor White
```
"@

Set-Content -Path (Join-Path $RepoPath "docs\WINDOWS-SETUP.md") -Value $windowsSetupContent -Encoding UTF8

# Create package list
$packageListContent = @'
# HaritaOS Package List
# Base system packages to install

# Essential Desktop
ubuntu-desktop-minimal
firefox
thunderbird
libreoffice
nautilus
gedit
evince
eog

# Media & Graphics
vlc
gimp
audacity
rhythmbox

# Development Tools
git
vim
curl
wget
build-essential
nodejs
npm
python3
python3-pip

# System Tools
htop
neofetch
tree
zip
unzip
gparted

# HaritaOS Custom Packages
harita-themes
harita-welcome
harita-settings

# Additional Icon Themes
papirus-icon-theme
numix-icon-theme
elementary-icon-theme

# Fonts
fonts-noto
fonts-noto-color-emoji
fonts-liberation

'@

Set-Content -Path (Join-Path $RepoPath "config\packages\package-list.txt") -Value $packageListContent -Encoding UTF8

# Create .gitignore
$gitignoreContent = @'
# Build artifacts
/tmp/
*.iso
*.img
*.squashfs
*.log

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Windows
desktop.ini
*.lnk

# IDE files
.vscode/
.idea/
*.swp
*.swo
*~

# Python
__pycache__/
*.py[cod]
*$py.class

# Node.js
node_modules/
npm-debug.log*

# Build directories
build/
dist/

# Temporary files
*.tmp
*.temp
.cache/

# Large files
*.deb
*.tar.gz
*.zip
'@

Set-Content -Path (Join-Path $RepoPath ".gitignore") -Value $gitignoreContent -Encoding UTF8

# Create LICENSE
$licenseContent = @'
GNU GENERAL PUBLIC LICENSE
Version 3, 29 June 2007

Copyright (C) 2024 HaritaOS Team

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
"@

Set-Content -Path (Join-Path $RepoPath "LICENSE") -Value $licenseContent -Encoding UTF8

# Create setup script for Windows users
$setupScriptContent = @'
@echo off
echo Setting up HaritaOS development environment...
echo.

REM Check if Git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo Git is not installed. Please install Git for Windows first.
    echo Download from: https://git-scm.com/download/win
    pause
    exit /b 1
)

REM Check if repository exists
if not exist "HaritaOS" (
    echo Cloning HaritaOS repository...
    git clone https://github.com/hussainabdillah/remastering-harita-os.git
)

cd HaritaOS

echo.
echo ================================================================
echo HaritaOS Development Environment Setup Complete!
echo ================================================================
echo.
echo IMPORTANT: Building HaritaOS requires Linux environment.
echo.
echo Choose one of these options:
echo 1. WSL2 (Recommended)
echo    - Run: wsl --install -d Ubuntu-20.04
echo    - Then follow Linux build instructions
echo.
echo 2. VirtualBox/VMware
echo    - Install Ubuntu 20.04 in VM
echo    - Use shared folders for development
echo.
echo 3. Docker
echo    - Use Ubuntu container for building
echo    - Mount repository as volume
echo.
echo See docs\WINDOWS-SETUP.md for detailed instructions.
echo.
pause
'@

Set-Content -Path (Join-Path $RepoPath "setup-windows.bat") -Value $setupScriptContent -Encoding UTF8

Write-Host ""
Write-Host "✅ Repository structure created successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "📁 Created directories:" -ForegroundColor Yellow
$directories | Select-Object -First 10 | ForEach-Object { Write-Host "  $_" -ForegroundColor White }
Write-Host "  ... (and more)" -ForegroundColor White
Write-Host ""
Write-Host "📋 Next steps:" -ForegroundColor Yellow
Write-Host "1. cd $RepoPath" -ForegroundColor White
Write-Host "2. git init" -ForegroundColor White
Write-Host "3. git add ." -ForegroundColor White
Write-Host "4. git commit -m 'Initial HaritaOS repository setup'" -ForegroundColor White
Write-Host "5. git remote add origin https://github.com/hussainabdillah/remastering-harita-os.git" -ForegroundColor White
Write-Host "6. git push -u origin main" -ForegroundColor White
Write-Host ""
Write-Host "🐧 For building HaritaOS:" -ForegroundColor Yellow
Write-Host "Install WSL2: wsl --install -d Ubuntu-20.04" -ForegroundColor White
Write-Host ""
Write-Host "🚀 Happy coding!" -ForegroundColor Green