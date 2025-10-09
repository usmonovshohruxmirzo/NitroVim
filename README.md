![Banner](https://github.com/user-attachments/assets/60141194-0f2b-4be2-bd62-638bed75ee52)

### A modern, blazing-fast Neovim distribution designed for an exceptional development experience.

<p align="center">
  <!-- GitHub Repo Stats -->
  <a href="https://github.com/usmonovshohruxmirzo/nitrovim/stargazers">
    <img src="https://img.shields.io/github/stars/usmonovshohruxmirzo/nitrovim?style=for-the-badge&color=yellow" alt="Stars" />
  </a>
  <a href="https://github.com/usmonovshohruxmirzo/nitrovim/network/members">
    <img src="https://img.shields.io/github/forks/usmonovshohruxmirzo/nitrovim?style=for-the-badge&color=blue" alt="Forks" />
  </a>
  <a href="https://github.com/usmonovshohruxmirzo/nitrovim/issues">
    <img src="https://img.shields.io/github/issues/usmonovshohruxmirzo/nitrovim?style=for-the-badge&color=orange" alt="Issues" />
  </a>
  <a href="https://github.com/usmonovshohruxmirzo/nitrovim/pulls">
    <img src="https://img.shields.io/github/issues-pr/usmonovshohruxmirzo/nitrovim?style=for-the-badge&color=purple" alt="Pull Requests" />
  </a>
  <a href="https://github.com/usmonovshohruxmirzo/nitrovim/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/usmonovshohruxmirzo/nitrovim?style=for-the-badge&color=success" alt="License" />
  </a>
  <a href="https://github.com/usmonovshohruxmirzo/nitrovim/releases/latest">
    <img src="https://img.shields.io/github/v/release/usmonovshohruxmirzo/nitrovim?style=for-the-badge&color=brightgreen" alt="Latest Release" />
  </a>
  <a href="https://github.com/usmonovshohruxmirzo/nitrovim/releases">
    <img src="https://img.shields.io/github/release-date/usmonovshohruxmirzo/nitrovim?style=for-the-badge&color=blue" alt="Release Date" />
  </a>
  <a href="https://github.com/usmonovshohruxmirzo/nitrovim/releases">
    <img src="https://img.shields.io/github/v/tag/usmonovshohruxmirzo/nitrovim?style=for-the-badge&color=yellow" alt="Latest Tag" />
  </a>
</p>

## 📚 Table of Contents

- [Features](#-features)
- [Keybindings](#-keybindings)
- [Installation](#-installation)
- [Plugins](#-plugins)
- [Language Support](#-language-support)
- [Customization](#-customization)
- [Troubleshooting](#-troubleshooting)

## ✨ Features

- 🚀 **LSP Integration** - Native language server support
- 💡 **Smart Completion** - Context-aware suggestions
- 🔍 **Fuzzy Finding** - Quick file and text search
- 🌳 **File Explorer** - Tree-style project navigation
- 🎨 **20+ Themes** - With transparency support
- ⚡ **Lazy Loading** - Fast startup times
- 📦 **Git Integration** - Built-in source control
- 🔌 **Plugin System** - Extensible architecture

## ⌨ Keybindings

### General

| Key          | Action               |
| ------------ | -------------------- |
| `<Space>`    | Leader key           |
| `<C-\>`      | Toggle terminal      |
| `<leader>lg` | Open Lazygit         |
| `<C-n>`      | Toggle file explorer |
| `<C-p>`      | Find files           |
| `<leader>ff` | Fuzzy finder         |

### LSP

| Key          | Action           |
| ------------ | ---------------- |
| `gd`         | Go to definition |
| `gr`         | Show references  |
| `K`          | Show hover       |
| `<leader>ca` | Code actions     |
| `<leader>rn` | Rename symbol    |

### Navigation

| Key       | Action          |
| --------- | --------------- |
| `<C-h>`   | Window left     |
| `<C-j>`   | Window down     |
| `<C-k>`   | Window up       |
| `<C-l>`   | Window right    |
| `<Tab>`   | Next buffer     |
| `<S-Tab>` | Previous buffer |

### Code

| Key         | Action              |
| ----------- | ------------------- |
| `gcc`       | Toggle comment      |
| `<leader>f` | Format document     |
| `]d`        | Next diagnostic     |
| `[d`        | Previous diagnostic |

## Theme & Appearance

| Command               | Description              |
| --------------------- | ------------------------ |
| `:TransparentEnable`  | Enable transparency      |
| `:TransparentDisable` | Disable transparency     |
| `:TransparentToggle`  | Toggle transparency      |
| `:ThemeSwitch`        | Open theme switcher menu |

## Learning & Documentation

| Command       | Description                      |
| ------------- | -------------------------------- |
| `:NitroLearn` | Open NitroVim learning dashboard |

## 🛠️ Installation

### Prerequisites

- [Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md) >= 0.8.0
- [Git](https://git-scm.com/downloads)
- [Node.js](https://nodejs.org/en/download) >= 14 (for LSP)
- [A Nerd Font](https://www.nerdfonts.com/font-downloads)
- [Lazygit](https://github.com/jesseduffield/lazygit) (for git integration)

#### Installing Lazygit

**Windows (using winget)**:

```powershell
winget install jesseduffield.lazygit
```

**Windows (using Chocolatey)**:

```powershell
choco install lazygit
```

**Windows (using Scoop)**:

```powershell
scoop install lazygit
```

**macOS**:

```bash
brew install lazygit
```

**Linux (using snap)**:

```bash
snap install lazygit
```

**Linux (using pacman)**:

```bash
pacman -S lazygit
```

**Manual Installation**:
Download the latest release from [Lazygit Releases](https://github.com/jesseduffield/lazygit/releases)

### Windows

```powershell
# Install Neovim
winget install Neovim.Neovim
# OR with Chocolatey
choco install neovim

# Clone NitroVim
git clone https://github.com/usmonovshohruxmirzo/nitrovim $env:LOCALAPPDATA\nvim
```

### Linux/macOS

```bash
# Clone configuration
git clone https://github.com/usmonovshohruxmirzo/nitrovim ~/.config/nvim
```

## 🔌 Plugins

Core plugins included:

- nvim-tree (File explorer)
- telescope.nvim (Fuzzy finder)
- mason.nvim (LSP installer)
- nvim-cmp (Completion)
- treesitter (Syntax)
- toggleterm (Terminal)
- gitsigns (Git integration)
- bufferline (Tab management)
- lualine (Status line)
- noice.nvim (UI improvements)

## 🎯 Language Support

Built-in support for:

- JavaScript/TypeScript
- Python
- C#/.NET
- HTML/CSS
- React/Next.js
- Lua
- Markdown
- JSON/YAML
- And more...

## ⚙️ Customization

### Adding Plugins

Edit `lua/user/plugins.lua`:

```lua
require("lazy").setup({
  -- Add your plugins here
  { "author/plugin-name" },
})
```

### Changing Settings

Edit `lua/user/options.lua`:

```lua
vim.opt.option_name = value
```

### Custom Keymaps

Edit `lua/user/keymaps.lua`:

```lua
vim.keymap.set('mode', 'key', 'action')
```

## 📸 Screenshots

#### Dashboard
<img width="1920" height="1039" alt="Screenshot (386)" src="https://github.com/user-attachments/assets/a26b4c29-e4e2-44fe-910a-88a5d258e1d4" />

#### Editor
<img width="1920" height="1019" alt="Screenshot (365)" src="https://github.com/user-attachments/assets/a0207659-b734-4271-b83e-c57f37d2b25e" />

#### Fuzzy Finder
<img width="1920" height="1020" alt="Screenshot (366)" src="https://github.com/user-attachments/assets/0cddb8c4-e139-425a-8f65-8ce4da535953" />

#### LazyGit
<img width="1920" height="1017" alt="Screenshot (367)" src="https://github.com/user-attachments/assets/606190d4-5923-4ed4-a7b3-b6c3249106e2" />

#### 20+ Themes
<img width="1920" height="1017" alt="Screenshot (368)" src="https://github.com/user-attachments/assets/bcd698e2-0ffb-43a7-afd0-1b4956667ca6" />

#### Transparency
<img width="1920" height="1035" alt="Screenshot (369)" src="https://github.com/user-attachments/assets/925b0237-326c-438d-b6ba-755121a76edf" />

## 🔧 Troubleshooting

1. Run health checks:

```vim
:checkhealth
```

2. Update plugins:

```vim
:Lazy update
```

3. Common issues:

   - Icons not showing? Install a Nerd Font
   - LSP not working? Run `:Mason` to install servers
   - Slow startup? Check `:Lazy profile`

4. Reporting Issues:
   If you encounter any problems:
   1. Check the [existing issues](https://github.com/usmonovshohruxmirzo/nitrovim/issues) first
   2. [Open a new issue](https://github.com/usmonovshohruxmirzo/nitrovim/issues/new) with:
      - NitroVim version (`git rev-parse HEAD` in your config directory)
      - Neovim version (`:version`)
      - Operating system
      - Steps to reproduce
      - Expected vs actual behavior
      - Screenshots/error messages if applicable
      - Relevant config files or changes you made

## 📊 Performance

- Startup Time: ~50ms
- Memory Usage: ~100MB
- Lazy-loaded plugins: 80%

## 🤝 Contributing

1. Fork the repository
2. Create feature branch
3. Commit changes
4. Push to branch
5. Create Pull Request

## 📜 License

[MIT](./LICENSE) © [Shohruxmirzo Usmonov](https://github.com/usmonovshohruxmirzo)

---

<p align="center">Made with ❤️ by the <a href="https://github.com/NitroBrain">NitroBrain</a> team</p>
