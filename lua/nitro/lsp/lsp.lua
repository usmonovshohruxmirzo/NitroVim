---@diagnostic disable: undefined-global
---@diagnostic disable: deprecated

_G.capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp then
  _G.capabilities = cmp_lsp.default_capabilities(_G.capabilities)
end

local servers = {
  "ts_ls", "eslint", "html", "cssls", "jsonls",
  "tailwindcss", "emmet_ls", "pyright", "lua_ls",
  "omnisharp", "rust_analyzer", "r"
}

for _, name in ipairs(servers) do
  local config = require("nitro.lsp.servers." .. name)
  config.capabilities = capabilities
  vim.lsp.config(name, config)
  vim.lsp.enable(name)
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local buf = vim.lsp.buf
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gd", buf.definition, opts)
    vim.keymap.set("n", "K", buf.hover, opts)
    vim.keymap.set("n", "gi", buf.implementation, opts)
    vim.keymap.set("n", "<leader>rn", buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", buf.code_action, opts)
    vim.keymap.set("n", "gr", buf.references, opts)

    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev({ wrap = false }) end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next({ wrap = false }) end, opts)
    vim.keymap.set("n", "<leader>dl", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>f", function() buf.format({ async = true }) end, opts)
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
