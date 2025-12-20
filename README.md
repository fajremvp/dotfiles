# Dotfiles

My personal dotfiles, managed via **[chezmoi](https://github.com/twpayne/chezmoi)**, organized for fast setup and easy portability.

![System](https://img.shields.io/badge/Arch%20Linux-Hyprland-1793d1?style=flat&logo=archlinux&logoColor=white)
![Manager](https://img.shields.io/badge/Managed%20by-chezmoi-0055d4?style=flat)

---

## 🚀 Fast Setup

To apply these configurations (pull everything from scratch) on a new installation, ensure you have `git` and `chezmoi` installed:

```bash
sudo pacman -S git chezmoi
````

### Installation (One-Liner)

```bash
chezmoi init --apply git@github.com:fajremvp/dotfiles.git
```

- This will initialize chezmoi, download this repository, and automatically apply the configurations to your home directory.

-----

## 📂 Custom Scripts & Configs

Scripts developed and maintained to optimize workflow and avoid bloatware:

| File | Description |
| :--- | :--- |
| **`hyprrun.sh`** | **[HyprRun](https://github.com/fajremvp/HyprRun)** is a minimalist application launcher that runs inside the terminal (fzf-based). Lightweight replacement for Rofi/Wofi. |
| **`hyprlock.conf`** | Minimalist, secure, and visually clean screen lock configuration (with blur and fast input support). |
| **`luz_noturna.sh`** | Manual screen color temperature control (blue light filter) without relying on location/time. |
| **`bateria.sh`** | On-demand battery monitor displaying status via stylized popup (figlet + lolcat). |
| **`uptime.sh`** | Displays system uptime in a quick popup (figlet + lolcat). |
| **`clock_date.sh`** | Displays detailed date and time in a stylized floating popup (figlet + lolcat). |
| **`desligar_confirm.sh`** | Shutdown confirmation menu to prevent accidents (figlet + lolcat). |
| **`randomize.sh`** | (**[Minegrub](https://github.com/Lxtharia/minegrub-theme)**) Randomizes the GRUB background and phrases on every boot. |

-----

## 📦 Chezmoi Management

Reference guide for dotfiles maintenance and versioning:

### Essential Commands

```bash
# Initializes dotfiles management from scratch on your machine
chezmoi init

# Initializes dotfiles management from a remote repository
chezmoi init <repo-url>

# Applies files already present locally
chezmoi apply
```

### File Management

```bash
# Adds files/directories to chezmoi to be tracked
chezmoi add <file/directory>

# Removes files/directories from chezmoi (does not delete from disk)
chezmoi forget <file/directory>

# Updates already managed files/directories (syncs local changes to chezmoi)
chezmoi re-add
```

### Diagnostics and Visualization

```bash
# Shows current status, comparing what is in chezmoi with what is on the system
chezmoi status

# Lists all files managed by chezmoi
chezmoi list

# Shows differences between files managed in chezmoi and those on the system
chezmoi diff
```

### Git Workflow (Versioning)

To push your changes to GitHub or other remote repositories.

```bash
# Enters the chezmoi repository directory (~/.local/share/chezmoi)
chezmoi cd

# Ensures local changes have been registered
chezmoi re-add

# Adds files for commit in the repository
chezmoi git add .

# Commits the changes
git commit -m "message"

# Pushes changes to the remote repository
chezmoi git push

# Pulls updates from the remote repository (if changed on another machine)
chezmoi git pull
```
