# Build Guide for HaritaOS

This guide will help you build HaritaOS from source.

## Prerequisites
- Ubuntu/Debian-based Linux system
- Minimum 4GB RAM
- 20GB free disk space
- Internet connection

## Install Dependencies
```bash
sudo apt update
sudo apt install squashfs-tools genisoimage syslinux-utils
```

## Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/hussainabdillah/remastering-harita-os.git
   cd HaritaOS
   ```
2. Download Ubuntu 20.04 ISO:
   ```bash
   wget http://releases.ubuntu.com/20.04/ubuntu-20.04.6-desktop-amd64.iso
   ```
3. Build HaritaOS:
   ```bash
   chmod +x build.sh
   sudo ./build.sh
   ```

## Troubleshooting
- Make sure you have enough disk space and memory.
- Run all commands as root or with sudo if needed.

---
For more help, see the documentation or open an issue on GitHub.
