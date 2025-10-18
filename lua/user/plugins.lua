---@diagnostic disable: undefined-global
---@type table

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- File Explorer
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- Themes
  { "navarasu/onedark.nvim" },
  { "folke/tokyonight.nvim" },
  { "tanvirtin/monokai.nvim" },
  { "folke/tokyonight.nvim" },
  { "tanvirtin/monokai.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "catppuccin/nvim",         name = "catppuccin" },
  { "Mofiqul/dracula.nvim" },
  { "shaunsingh/nord.nvim" },
  { "sainnhe/everforest" },
  { "rose-pine/neovim",        name = "rose-pine" },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end,
  },

  -- Dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("user.dashboard")
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        shade_terminals = true,
        direction = "float",
        float_opts = {
          border = "curved",
          width = math.floor(vim.o.columns * 0.9),
          height = math.floor(vim.o.lines * 0.9),
        },
      })

      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        hidden = true,
        direction = "float",
      })

      function _lazygit_toggle()
        lazygit:toggle()
      end

      vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
    end,
  },

  -- LSP + Mason
  {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },

  -- Completion (nvim-cmp)
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "saadparwaiz1/cmp_luasnip" },

  -- Snippets
  { "L3MON4D3/LuaSnip" },
  { "rafamadriz/friendly-snippets" },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- CSS utilities
  { "norcalli/nvim-colorizer.lua" },
  { "NvChad/nvim-colorizer.lua" },

  -- Auto Save
  {
    "pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        enabled = true,
        execution_message = {
          message = function() return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S")) end,
          dim = 0.18,
          cleaning_interval = 1250,
        },
        trigger_events = { "InsertLeave", "TextChanged" },
        conditions = {
          exists = true,
          filename_is_not = {},
          filetype_is_not = {},
          modifiable = true,
        },
        write_all_buffers = false,
        debounce_delay = 135,
      }
    end,
  },

  -- TODO COMMENTS
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },

  -- Auto Pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- Transparent
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
  },

  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end
        map("n", "]h", function() gs.nav_hunk("next") end, "Next Hunk")
        map("n", "[h", function() gs.nav_hunk("prev") end, "Prev Hunk")
      end,
    },
  },

  -- Noice
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },

  -- Smear Cursor
  {
    "sphamba/smear-cursor.nvim",
    opts = {},
  },

  -- Vim Surround
  {
    "tpope/vim-surround"
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },

  -- Auto Tag
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },

  -- Trouble
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
  },

  -- C#
  { "OrangeT/vim-csharp" },
  { "hrsh7th/vim-vsnip" },
  { "Hoffs/omnisharp-extended-lsp.nvim" },

  -- Git Blame
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
      enabled = true,
      message_template = " <summary> • <date> • <author> • <<sha>>",
      date_format = "%m-%d-%Y %H:%M:%S",
      virtual_text_column = 1,
    },
  },

  -- Draw ASCII diagrams
  {
    "jbyuki/venn.nvim",
    config = function()
      function _G.Toggle_venn()
        local venn_enabled = vim.inspect(vim.b.venn_enabled)
        if venn_enabled == "nil" then
          vim.b.venn_enabled = true
          vim.cmd [[setlocal ve=all]]
          vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
          vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
          vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
          vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
          vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true })
        else
          vim.cmd [[setlocal ve=]]
          vim.api.nvim_buf_del_keymap(0, "n", "J")
          vim.api.nvim_buf_del_keymap(0, "n", "K")
          vim.api.nvim_buf_del_keymap(0, "n", "L")
          vim.api.nvim_buf_del_keymap(0, "n", "H")
          vim.api.nvim_buf_del_keymap(0, "v", "f")
          vim.b.venn_enabled = nil
        end
      end

      vim.api.nvim_set_keymap("n", "<leader>v", ":lua Toggle_venn()<CR>", { noremap = true, silent = true })
    end
  },

  -- Project
  {
    "ahmedkhalf/project.nvim",
    event = "VimEnter",
    config = function()
      require("project_nvim").setup({
        manual_mode = false,
        detection_methods = { "lsp", "pattern" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pyproject.toml" },
        ignore_lsp = {},
        exclude_dirs = {},
        show_hidden = false,
        silent_chdir = true,
        scope_chdir = 'global',
        datapath = vim.fn.stdpath("data"),
      })

      require("telescope").load_extension("projects")
    end,
  },

  -- Auto Session
  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      vim.o.sessionoptions = "buffers,curdir,tabpages,winsize,help,globals,skiprtp,folds,localoptions"

      require("auto-session").setup({
        log_level = "info",
        auto_session_enabled = true,
        auto_save_enabled = true,
        auto_restore_enabled = false,
        auto_session_suppress_dirs = { "~/" },
      })
    end,
  },

  { "simrat39/rust-tools.nvim" },

})
