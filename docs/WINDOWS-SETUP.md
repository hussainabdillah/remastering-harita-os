# Windows Development Setup

Panduan ini membantu Anda menyiapkan lingkungan pengembangan HaritaOS di Windows.

## Opsi 1: WSL2 (Direkomendasikan)
1. Install WSL2 dan Ubuntu 20.04:
   ```powershell
   wsl --install -d Ubuntu-20.04
   ```
2. Buka Ubuntu melalui WSL dan ikuti instruksi build Linux di [Build Guide](BUILDING.md).

## Opsi 2: Docker
1. Install Docker Desktop untuk Windows.
2. Pull image Ubuntu:
   ```powershell
   docker pull ubuntu:20.04
   ```
3. Jalankan container dengan repository ter-mount:
   ```powershell
   docker run -it -v C:\Users\Admin\Documents\Project\Remastering\HaritaOS:/workspace ubuntu:20.04 bash
   ```

## Opsi 3: Virtual Machine
1. Install VirtualBox/VMware.
2. Install Ubuntu 20.04 di VM.
3. Ikuti instruksi build Linux di [Build Guide](BUILDING.md).

---
Jika mengalami kendala, silakan buka issue di GitHub.
