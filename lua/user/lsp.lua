require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "ts_ls",
    "eslint",
    "html",
    "cssls",
    "tailwindcss",
    "emmet_language_server",
    "jsonls",
  },
  automatic_enable = false
})

local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }
  local map = vim.api.nvim_buf_set_keymap

  map(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  map(bufnr, 'n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  map(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
end

local servers = {
  "ts_ls",
  "eslint",
  "html",
  "cssls",
  "tailwindcss",
  "emmet_language_server",
  "jsonls"
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
  })
end
