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
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "navarasu/onedark.nvim" },
  { "folke/tokyonight.nvim" },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('user.dashboard')
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim"
  },
  {
  "hrsh7th/nvim-cmp",             -- Autocompletion plugin
  "hrsh7th/cmp-nvim-lsp",         -- LSP source for nvim-cmp
  "hrsh7th/cmp-buffer",           -- Buffer completion
  "hrsh7th/cmp-path",             -- Path completion
  "hrsh7th/cmp-cmdline",          -- Command line completion
  "saadparwaiz1/cmp_luasnip",     -- Snippets completion (optional)
  "L3MON4D3/LuaSnip",             -- Snippet engine (optional)
  "williamboman/mason.nvim",      -- Tool for managing LSP servers
  "williamboman/mason-lspconfig.nvim", -- Integration with LSP config
  "neovim/nvim-lspconfig"         -- LSP client setup
},
{ "rafamadriz/friendly-snippets" },
})
