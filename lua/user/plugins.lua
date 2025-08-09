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

  -- Bufferline
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
    config = true
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
      trigger_events = {"InsertLeave", "TextChanged"},
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
  }
})
