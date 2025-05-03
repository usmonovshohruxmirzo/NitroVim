local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  vim.notify("nvim-tree not found!", vim.log.levels.ERROR)
  return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

pcall(require, "nvim-web-devicons")

nvim_tree.setup({
  auto_reload_on_write = true,
  disable_netrw = true,
  hijack_cursor = true,
  hijack_netrw = true,
  sync_root_with_cwd = true,

  view = {
    width = 40,
    side = "left",
    cursorline = true,
    signcolumn = "yes",
    float = {
      enable = false,
    },
  },

  renderer = {
    indent_width = 2,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
        modified = true,
      },
      glyphs = {
        modified = "●",
        git = {
          unstaged = "✗",
          staged = "✓",
          renamed = "➜",
          untracked = "★",
          ignored = "◌",
        },
      },
    },
    root_folder_label = ":~:s?$?/..?",
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
  },

  hijack_directories = {
    enable = true,
    auto_open = true,
  },

  update_focused_file = {
    enable = true,
  },

  filters = {
    dotfiles = false,
  },

  git = {
    enable = true,
    ignore = false,
    show_on_dirs = true,
    show_on_open_dirs = true,
    timeout = 400,
  },

  actions = {
    use_system_clipboard = true,
    change_dir = { enable = true },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },

  trash = {
    cmd = "trash",
    require_confirm = true,
  },

  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },

  notify = {
    threshold = vim.log.levels.INFO,
  },
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)
vim.keymap.set('n', '<leader>n', ':NvimTreeFindFile<CR>', opts)