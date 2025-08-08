require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "ts_ls",
    "eslint",
    "html",
    "cssls",
    "tailwindcss",
    "emmet_ls",
    "jsonls",
    "prismals",
    "volar",
  },
})


local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true }
  local map = vim.api.nvim_buf_set_keymap

  map(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  map(bufnr, 'n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  map(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
end

lspconfig.tsserver.setup({
  on_attach = on_attach,
})

lspconfig.eslint.setup({
  on_attach = on_attach,
})

lspconfig.html.setup({
  on_attach = on_attach,
})

lspconfig.cssls.setup({
  on_attach = on_attach,
})

lspconfig.tailwindcss.setup({
  on_attach = on_attach,
})

lspconfig.emmet_ls.setup({
  filetypes = {
    "html", "css", "scss", "sass",
    "javascript", "javascriptreact",
    "typescript", "typescriptreact",
  },
})
lspconfig.jsonls.setup({
  on_attach = on_attach,
})