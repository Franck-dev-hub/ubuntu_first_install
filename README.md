# Ubuntu First Install 🐧

## 📌 Description
Automatic installation script to configure a complete development environment on Ubuntu. This script installs and configures all essential tools for modern development, including programming languages, code editors, mobile development tools, and custom configurations.

## ✨ Features

# 🛠️ Outils et Environnements de Développement

---

<details>
<summary><strong>🛠️ System Tools</strong></summary>
   
![Update](https://img.shields.io/badge/update-automatic-brightgreen)
   
</details>

<details>
<summary><strong>🤖 AI</strong></summary>
   
![Ollama](https://img.shields.io/badge/Ollama-local%20AI-blue?logo=ollama&logoColor=white)
   
</details>

<details>
<summary><strong>📝 Editors & Terminals</strong></summary>

 ![zsh](https://img.shields.io/badge/Oh_My-zsh-purple?logo=zsh&logoColor=white) ![Neovim](https://img.shields.io/badge/Neovim-57A143?logo=neovim&logoColor=white) ![lazy](https://img.shields.io/badge/LazyVim-darkpurple?logo=neovim&logoColor=white) ![Ghostty](https://img.shields.io/badge/Ghostty-lightgrey?logo=ghostty&logoColor=white)

</details>

<details>
<summary><strong>🐍 Python</strong></summary>

[![Python](https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=white)](#) [![pip](https://img.shields.io/badge/pip-3776AB?logo=python&logoColor=white)](#) [![venv](https://img.shields.io/badge/venv-3776AB?logo=python&logoColor=white)](#) [![pycodestyle](https://img.shields.io/badge/pycodestyle-3776AB?logo=python&logoColor=white)](#) [![uvicorn](https://img.shields.io/badge/uvicorn-3776AB?logo=python&logoColor=white)](#)

</details>

<details>
<summary><strong>🦀 Rust</strong></summary>

[![Rust](https://img.shields.io/badge/Rust-000000?logo=rust&logoColor=white)](#) [![cargo](https://img.shields.io/badge/cargo-000000?logo=rust&logoColor=white)](#) [![cargo-watch](https://img.shields.io/badge/cargo--watch-000000?logo=rust&logoColor=white)](#) [![trunk](https://img.shields.io/badge/trunk-000000?logo=rust&logoColor=white)](#)

</details>

<details>
<summary><strong>📦 JavaScript / Node.js</strong></summary>

[![Node.js](https://img.shields.io/badge/Node.js-339933?logo=node.js&logoColor=white)](#) [![Yarn](https://img.shields.io/badge/Yarn-2C8EBB?logo=yarn&logoColor=white)](#) [![pnpm](https://img.shields.io/badge/pnpm-F69220?logo=pnpm&logoColor=white)](#) [![ESLint](https://img.shields.io/badge/ESLint-4B32C3?logo=eslint&logoColor=white)](#) [![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?logo=typescript&logoColor=white)](#) [![Vite](https://img.shields.io/badge/Vite-646CFF?logo=vite&logoColor=white)](#)

</details>

<details>
<summary><strong>⚙️ C / C++</strong></summary>

[![C](https://img.shields.io/badge/C-00599C?logo=c&logoColor=white)](#) [![C++](https://img.shields.io/badge/C++-00599C?logo=c%2B%2B&logoColor=white)](#) [![G++](https://img.shields.io/badge/G++-00599C?logo=gnu&logoColor=white)](#) [![Make](https://img.shields.io/badge/Make-00599C?logo=gnu&logoColor=white)](#) [![CMake](https://img.shields.io/badge/CMake-064F8C?logo=cmake&logoColor=white)](#)

</details>

<details>
<summary><strong>📱 Mobile Development</strong></summary>

![Android Studio](https://img.shields.io/badge/Android_Studio-3DDC84?logo=android-studio&logoColor=white) ![React Native](https://img.shields.io/badge/React_Native-61DAFB?logo=react&logoColor=black) ![Expo](https://img.shields.io/badge/Expo-000020?logo=expo&logoColor=white)

</details>

<details>
<summary><strong>🔗 Useful Aliases</strong></summary>

- Git shortcuts: `gt`, `ga`, `gc`, `gp`  
- Neovim shortcuts: `n`, `vi`, `vim`

</details>


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
   
2. **Use the aliases**:
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
