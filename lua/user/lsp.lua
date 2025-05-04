require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "tsserver", "pyright", "gopls", "clangd" }, -- Add your preferred language servers
})

local nvim_lsp = require("lspconfig")

nvim_lsp.tsserver.setup({
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
  end,
  flags = {
    debounce_text_changes = 150,
  }
})

nvim_lsp.pyright.setup({
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
  end,
})
