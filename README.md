# ⚡ The NitroVim Experience ⚡

![Banner](https://github.com/user-attachments/assets/60141194-0f2b-4be2-bd62-638bed75ee52)

NitroVim is a **modern, fast, and fully customizable Neovim distribution** designed to boost developer productivity out-of-the-box. It comes preconfigured with LSP, autocompletion, snippets, file explorer, fuzzy finder, Git integration, themes, transparency, and more.

Whether you’re coding in **JavaScript, TypeScript, Python, C#, React, or Next.js**, NitroVim gives you everything you need to start coding immediately.

---

## ✨ Features

* 🚀 **Preconfigured LSP support** (TypeScript, Python, C#, HTML, CSS, and more)
* ⚡ **Autocompletion & Snippets** powered by `nvim-cmp` and `friendly-snippets`
* 🧭 **File Explorer** (`nvim-tree`)
* 🔍 **Fuzzy Finder** (`telescope.nvim`)
* 🖥️ **Beautiful Dashboard** for quick project access
* 🎨 **20+ Themes** with full **transparency support**
* 🔧 **Lazy loading plugins** for fast startup
* 📦 **Built-in Git integration** with `lazygit`
* 🛠️ **Fully customizable** — tweak settings, plugins, or keybindings

---

## 📸 Screenshots

### Dashboard

![image](https://github.com/user-attachments/assets/a6e0dcf7-fbf1-4496-aa72-603f6c7e6b98)

### Editor

![image](https://github.com/user-attachments/assets/f4c4ed07-f7fc-48c5-9911-0700bf031d35)

### Fuzzy Finder

![image](https://github.com/user-attachments/assets/312223ad-0db6-4c60-9d2a-67fc644058a1)

### LazyGit

![Image](https://github.com/user-attachments/assets/dafd0803-2a79-4b18-b4c3-ccfa646cf3d4)

### Themes

![Image](https://github.com/user-attachments/assets/9f20dc47-d0e9-4c62-ae69-0668fc43010b)

### Transparency

![Images](https://github.com/user-attachments/assets/150523c7-4978-435e-baee-97b034da0b1d)

---

## 🛠️ Installation

### Linux / macOS

```bash
# Install Neovim (if not installed)
# Linux (Debian/Ubuntu)
sudo apt install neovim -y  

# macOS (Homebrew)
brew install neovim  

# Clone NitroVim
git clone https://github.com/usmonovshohruxmirzo/nitrovim ~/.config/nvim  

# Start Neovim
nvim
```

---

### Windows (PowerShell)

```powershell
# Install Neovim using Scoop
scoop install neovim

# Clone NitroVim
git clone https://github.com/usmonovshohruxmirzo/nitrovim $env:LOCALAPPDATA\nvim

# Start Neovim
nvim
```

**Alternative (Windows with Chocolatey):**

```powershell
choco install neovim
```

---

## ⚙️ Customization

NitroVim is built to be **fully customizable**.

* Edit `lua/plugins.lua` to add or remove plugins
* Change keybindings in `lua/keymaps.lua`
* Tweak UI, themes, and transparency in `lua/config.lua`

---

## 📚 Supported Languages

* HTML
* CSS
* JavaScript
* TypeScript
* Python
* C#
* React.js
* Next.js
* Django Templates

---

## 🚀 Roadmap

* [ ] Add Rust & Go support
* [ ] Improve debugging integration (`nvim-dap`)
* [ ] More pre-configured themes
* [ ] Snippets for all major frameworks

---

## 🤝 Contributing

1. Fork the repository
2. Create a new branch (`feature/my-feature`)
3. Commit changes (`git commit -m "Add new feature"`)
4. Push to branch (`git push origin feature/my-feature`)
5. Open a Pull Request

---

## 📜 License

[MIT](LICENSE) © 2025 [Shohruxmirzo Usmonov](https://github.com/usmonovshohruxmirzo)
