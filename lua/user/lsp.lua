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
  capabilities = capabilities,
})

local function get_server_cmd(server_name)
  local mappings = require('mason-lspconfig').get_mappings()
  local cmd_path = mappings[server_name]
  if cmd_path then
    return { cmd_path }
  else
    return nil
  end
end

local function start_lsp(server_name, filetypes, extra_config)
  extra_config = extra_config or {}
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetypes,
    callback = function()
      local config = vim.tbl_extend('force', {
        name = server_name,
        cmd = get_server_cmd(server_name),
        root_dir = vim.fs.dirname(vim.fs.find({ ".git", "package.json" }, { upward = true })[1]),
        capabilities = capabilities,
      }, extra_config)
      vim.lsp.start(config)
    end,
  })
end

start_lsp("ts_ls", { "typescript", "typescriptreact", "javascript", "javascriptreact" })
start_lsp("eslint", { "typescript", "typescriptreact", "javascript", "javascriptreact" })
start_lsp("html", { "html" })
start_lsp("cssls", { "css", "scss", "less" })
start_lsp("tailwindcss", { "html", "css", "typescriptreact", "javascriptreact" })
start_lsp("emmet_language_server", { "html", "css" })
start_lsp("jsonls", { "json" })
start_lsp("pyright", { "python" })
start_lsp("omnisharp", { "cs" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.lsp.start({
      name = "lua_ls",
      cmd = get_server_cmd("lua_ls"),
      root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]),
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = { library = vim.api.nvim_get_runtime_file("", true) },
          telemetry = { enable = false },
        },
      },
      capabilities = capabilities,
    })
  end,
})

local rt_ok, rust_tools = pcall(require, "rust-tools")
if rt_ok then
  local on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rr", rust_tools.runnables.runnables, opts)
    vim.keymap.set("n", "<leader>rd", rust_tools.debuggables.debuggables, opts)
  end

  vim.lsp.config('rust_analyzer', {
    cmd = get_server_cmd("rust_analyzer"),
    settings = {
      ["rust-analyzer"] = {
        cargo = { allFeatures = true },
        checkOnSave = { command = "clippy" },
      },
    },
    on_attach = on_attach,
    capabilities = capabilities,
  })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function()
      local root_dir = vim.fs.dirname(vim.fs.find({ "Cargo.toml", ".git" }, { upward = true })[1])
      vim.lsp.start({
        name = "rust_analyzer",
        cmd = get_server_cmd("rust_analyzer"),
        root_dir = root_dir,
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = { command = "clippy" },
          },
        },
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
  })
end
