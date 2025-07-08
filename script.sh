#!/bin/bash

set -e # Stop on error

# Variables
USER_HOME="$HOME"
ZSHRC="$USER_HOME/.zshrc"

# Add alias if missing
add_alias() {
	local alias_cmd="$1"
	grep -qxF "$alias_cmd" "$ZSHRC" || echo "$alias_cmd" >>"$ZSHRC"
}

# Update system
echo "     ==========>     🔄 UPDATE SYSTEM     <=========="
apt update && apt upgrade -y
apt install sudo -y 

# Install basic tools
echo "     ==========>     🛠️  INSTALL BASIC TOOLS     <=========="
sudo apt install -y curl wget git build-essential software-properties-common ca-certificates lsb-release gnupg unzip neofetch screenfetch tree
if ! command -v ollama &>/dev/null; then
	curl -fsSL https://ollama.com/install.sh | sh
fi

# Install Zsh & Oh My Zsh
echo "     ==========>     🎨 INSTALL ZSH + OH MY ZSH     <=========="
sudo apt install -y zsh
if [ ! -d "$USER_HOME/.oh-my-zsh" ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Set zsh as default shell
echo "     ==========>     🐚 SET ZSH AS DEFAULT SHELL     <=========="
chsh -s "$(which zsh)"

# LazyVim & Neovim
echo "     ==========>     📝 INSTALL LAZYVIM + NEOVIM     <=========="
sudo apt install -y vim neovim
if [ ! -d "$USER_HOME/.config/nvim" ]; then
	git clone https://github.com/LazyVim/starter "$USER_HOME/.config/nvim"
fi
export EDITOR=nvim

# Ghostty
echo "     ==========>     👻 INSTALL GHOSTTY     <=========="
git clone https://github.com/ghostty-org/ghostty
cd ghostty

export PATH="/snap/bin:$PATH"

if ! command -v zig &>/dev/null; then
	sudo snap install zig --classic --beta
fi

ZIG_MIN_VERSION="0.14.0"
ZIG_CURRENT_VERSION=$(zig version 2>/dev/null || echo "0.0.0")

version_lt() {
	[ "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "$1" ]
}

if version_lt "$ZIG_CURRENT_VERSION" "$ZIG_MIN_VERSION"; then
	cd ..
	rm -rf ghostty
else
	sudo apt install -y libgtk-4-dev libadwaita-1-dev git blueprint-compiler gettext libxml2-utils
	zig build -Doptimize=ReleaseFast
fi

# C/C++ tools
echo "     ==========>     ⚙️  INSTALL C/C++ TOOLS     <=========="
sudo apt install -y gcc g++ make cmake

# Python environment
echo "     ==========>     🐍 INSTALL PYTHON TOOLS     <=========="
sudo apt install -y python3 python3-pip python3-venv python3-dev python3-setuptools pycodestyle uvicorn

# JavaScript / Node.js
echo "     ==========>     📦 INSTALL JS TOOLS     <=========="
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm install -g yarn pnpm eslint typescript vite

# Rust (via rustup)
echo "     ==========>     🦀 INSTALL RUST TOOLS     <=========="
if ! command -v rustup &>/dev/null; then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
	source "$HOME/.cargo/env"
fi

cargo install cargo-watch trunk

# Mobile Dev Tools (React Native / Android)
echo "     ==========>     📱 INSTALL MOBILE DEV TOOLS     <=========="
sudo snap install android-studio --classic
sudo npm install -g expo-cli react-native-cli

# Add aliases
echo "     ==========>     🔗 ADD ALIASES     <=========="

if ! grep -q "# Vim" ~/.zshrc; then
  cat << 'EOF' >> ~/.zshrc
# Vim
alias n="nvim"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

EOF
fi

if ! grep -q "# Github" ~/.zshrc; then
  cat << 'EOF' >> ~/.zshrc
# Github
alias gs="clear && git status"
alias ga="git add"
alias gc="git commit"
alias gca="git commit --amend"
alias gcan="git commit --amend --no-edit"
alias gp="git push"
alias gpf="git push -f"
alias gcanf="git commit --amend --no-edit && git push -f"
alias gpl="git pull"

EOF
fi

if ! grep -q "# Holberton" ~/.zshrc; then
  cat << 'EOF' >> ~/.zshrc
# Holberton
alias gcch="gcc -Wall -pedantic -Werror -Wextra -std=gnu89"
alias val="clear && valgrind --leak-check=full --track-origins=yes --show-leak-kinds=all ./a.out"

EOF
fi

echo "     ==========>     ⚡ CONFIGURE NEOVIM     <=========="
NVIM_OPTIONS="$HOME/.config/nvim/lua/config/options.lua"
mkdir -p "$(dirname "$NVIM_OPTIONS")"

cat <<'EOF' >"$NVIM_OPTIONS"
-- This file is automatically loaded by plugins.core
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- LazyVim auto format
vim.g.autoformat = true

-- Snacks animations
-- Set to `false` to globally disable all snacks animations
vim.g.snacks_animate = true

-- LazyVim picker to use.
-- Can be one of: telescope, fzf
-- Leave it to "auto" to automatically use the picker
-- enabled with `:LazyExtras`
vim.g.lazyvim_picker = "auto"

-- LazyVim completion engine to use.
-- Can be one of: nvim-cmp, blink.cmp
-- Leave it to "auto" to automatically use the completion engine
-- enabled with `:LazyExtras`
vim.g.lazyvim_cmp = "auto"

-- if the completion engine supports the AI source,
-- use that instead of inline suggestions
vim.g.ai_cmp = true

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

-- Optionally setup the terminal to use
-- This sets `vim.o.shell` and does some additional configuration for:
-- * pwsh
-- * powershell
-- LazyVim.terminal.setup("pwsh")

-- Set LSP servers to be ignored when used with `util.root.detectors.lsp`
-- for detecting the LSP root
vim.g.root_lsp_ignore = { "copilot" }

-- Hide deprecation warnings
vim.g.deprecation_warnings = false

-- Show the current document symbols location from Trouble in lualine
-- You can disable this for a buffer by setting `vim.b.trouble_lualine = false`
vim.g.trouble_lualine = true

local opt = vim.opt

opt.autowrite = true -- Enable auto write
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = false -- Use spaces instead of tabs
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.foldlevel = 99
opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.jumpoptions = "view"
opt.laststatus = 3 -- global statusline
opt.linebreak = true -- Wrap lines at convenient points
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = false -- Relative line numbers
opt.ruler = false -- Disable the default ruler
opt.scrolloff = 10 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 4 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 10 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en", "fr" }
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
opt.tabstop = 4 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
  opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
  opt.foldmethod = "expr"
  opt.foldtext = ""
else
  opt.foldmethod = "indent"
  opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
EOF

# Final message
rm -rf snap
echo "     ==========>     ✅ Setup complete!     <=========="
