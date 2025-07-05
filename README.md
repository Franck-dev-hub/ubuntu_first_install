# Ubuntu First Install 🐧

## 📌 Description
Automatic installation script to configure a complete development environment on Ubuntu. This script installs and configures all essential tools for modern development, including programming languages, code editors, mobile development tools, and custom configurations.

## ✨ Features

### 🛠️ System Tools
- **Automatic system update**
- **Basic tools**: curl, wget, git, build-essential, etc.
- **Ollama** for local AI
- **Zsh + Oh My Zsh** as default shell

### 📝 Editors & Terminals
- **Neovim + LazyVim** - Modern code editor
- **Ghostty** - Modern terminal (if Zig ≥ 0.14.0 available)
- **Neovim configuration** optimized with LazyVim

### 🐍 Python
- Python 3 with pip and venv
- Development tools: pycodestyle, uvicorn
- Virtual environments

### 🦀 Rust
- Installation via rustup
- Additional tools: cargo-watch, trunk

### 📦 JavaScript/Node.js
- Node.js 20.x
- Package managers: yarn, pnpm
- Development tools: eslint, typescript, vite

### ⚙️ C/C++
- Compilers: gcc, g++
- Build tools: make, cmake

### 📱 Mobile Development
- **Android Studio** (via Snap)
- **React Native CLI**
- **Expo CLI**

### 🔗 Useful Aliases
- Git shortcuts: `gt`, `ga`, `gc`, `gp`
- Neovim shortcuts: `n`, `vi`, `vim`

## 🚀 Installation

### ✅ Prerequisites
- **Ubuntu** (tested on Ubuntu 22.04+)
- **Sudo privileges** on your account
- **Zig 0.14.0+** (optional, for Ghostty)

### 📥 Quick Installation

# 1. Clone the repository
```bash
git clone https://github.com/Franck-dev-hub/ubuntu_first_install.git
cd ubuntu_first_install
```

# 2. Run the installation
```bash
./script.sh
```

## 🎯 Usage

### After installation

1. **Restart your terminal** or run:
   ```bash
   source ~/.zshrc
   ```

2. **Verify the installation**:
   ```bash
   # Check Neovim
   nvim --version
   
   # Check Rust
   rustc --version
   
   # Check Node.js
   node --version
   ```

3. **Use the aliases**:
   ```bash
   gt    # git status
   ga .  # git add .
   n     # nvim
   ```

### Neovim Configuration

The script automatically configures Neovim with LazyVim. On first launch:
- Plugins will download automatically
- Interface will be ready to use
- Shortcuts are optimized for development

## 🛠️ Installed Technologies

[![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)](#)
[![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](#)
[![Rust](https://img.shields.io/badge/Rust-000000?style=for-the-badge&logo=rust&logoColor=white)](#)
[![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)](#)
[![Neovim](https://img.shields.io/badge/Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white)](#)
[![Zsh](https://img.shields.io/badge/Zsh-000000?style=for-the-badge&logo=zsh&logoColor=white)](#)
[![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)](#)

## 📁 Project Structure

```
ubuntu_first_install/
├── README.md          # This file
├── script.sh          # Main installation script
└── LICENSE            # Project license
```

### Support

If you encounter issues:
1. Verify you have the prerequisites
2. Check error logs
3. Open an issue on GitHub with details

## 👥 Authors

- **[Franck-dev-hub](https://github.com/Franck-dev-hub)** – Franck S.

## 📝 Version History

- **v1.0** - Initial version
  Complete automatic installation of :
  - Sytem update
  - Basic tools + ollama
  - Oh My zsh as default
  - Lazyvim as default + config
  - Ghostty (if compatible)
  - C/C++ & tools
  - Python & tools
  - JS & tools
  - Rust & tools
  - Mobile tools
  - nvim aliases
  - github aliases

## 📜 License

This project is licensed under **GNU GPL v3.0** - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Oh My Zsh](https://ohmyz.sh/) for the excellent shell
- [LazyVim](https://www.lazyvim.org/) for the Neovim configuration
- [Ghostty](https://github.com/ghostty-org/ghostty) for the modern terminal
- The open source community for all these amazing tools

---

⭐ **Don't forget to star the project if you like it!**
