require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "ts_ls",
    "eslint",
    "html",
    "cssls",
    "tailwindcss",
    "emmet_language_server",
    "jsonls",
    "pyright",
    "omnisharp",
    "rust_analyzer",
    "clangd"
  },
  automatic_installation = true,
})
