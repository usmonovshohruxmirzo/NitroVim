---@diagnostic disable: undefined-global
---@type table

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
    "pyright",
    "omnisharp",
    "lua_ls",
    "rust_analyzer"
  },
  automatic_installation = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  end,
})


local rt_ok, rust_tools = pcall(require, "rust-tools")
if rt_ok then
  rust_tools.setup({
    server = {
      on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rr", rust_tools.runnables.runnables, opts)
        vim.keymap.set("n", "<leader>rd", rust_tools.debuggables.debuggables, opts)
      end,
      settings = {
        ["rust-analyzer"] = {
          cargo = { allFeatures = true },
          checkOnSave = { command = "clippy" },
        }
      }
    }
  })
end

vim.keymap.set("n", "<leader>rr", rust_tools.runnables.runnables, opts)

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_ok then
  capabilities = cmp_lsp.default_capabilities(capabilities)
end

vim.lsp.config('*', {
  capabilities = capabilities,
})

vim.lsp.config('omnisharp', {
  cmd = { "omnisharp" },
  enable_editorconfig_support = true,
  enable_roslyn_analyzers = true,
  organize_imports_on_format = true,
  enable_import_completion = true,
  handlers = {
    ["textDocument/definition"] = require('omnisharp_extended').handler,
  },
})

vim.lsp.enable({
  "ts_ls",
  "eslint",
  "html",
  "cssls",
  "tailwindcss",
  "emmet_language_server",
  "jsonls",
  "pyright",
  "omnisharp",
})
