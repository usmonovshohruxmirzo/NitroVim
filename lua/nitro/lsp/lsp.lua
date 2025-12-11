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
    "rust_analyzer",
  },
  automatic_installation = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local opts = { noremap = true, silent = true, buffer = bufnr }
    local buf = vim.lsp.buf

    vim.keymap.set("n", "gd", buf.definition, opts)
    vim.keymap.set("n", "K", buf.hover, opts)
    vim.keymap.set("n", "gi", buf.implementation, opts)
    vim.keymap.set("n", "<leader>rn", buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", buf.code_action, opts)
    vim.keymap.set("n", "gr", buf.references, opts)
    vim.keymap.set("n", "<leader>f", function() buf.format({ async = true }) end, opts)
  end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_ok then
  capabilities = cmp_lsp.default_capabilities(capabilities)
end

vim.lsp.config("*", { capabilities = capabilities })

local function mason_bin(name)
  local bin = vim.fn.stdpath("data") .. "/mason/bin/" .. name
  if vim.fn.executable(bin) == 1 then
    return bin
  elseif vim.fn.executable(name) == 1 then
    return name
  else
    return nil
  end
end

local function start_lsp(server_name, filetypes, extra_config)
  extra_config = extra_config or {}
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetypes,
    callback = function()
      local root = vim.fs.dirname(vim.fs.find({ ".git", "package.json" }, { upward = true })[1])
      local config = vim.tbl_extend("force", {
        name = server_name,
        cmd = mason_bin(server_name) and { mason_bin(server_name) } or nil,
        root_dir = root,
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

start_lsp("omnisharp", { "cs" }, {
  cmd = {
    mason_bin("omnisharp") or "omnisharp",
    "--languageserver",
    "--hostPID",
    tostring(vim.fn.getpid()),
  },
  root_dir = require("lspconfig.util").root_pattern("*.sln", "*.csproj", ".git"),
  enable_editorconfig_support = true,
  enable_ms_build_load_projects_on_demand = false,
  enable_roslyn_analyzers = true,
  organize_imports_on_format = true,
  enable_import_completion = true,
  sdk_include_prereleases = true,
  analyze_open_documents_only = false,
  handlers = {
    ["textDocument/definition"] = require("omnisharp_extended").handler,
  },
  capabilities = vim.tbl_deep_extend("force", capabilities, {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true,
          preselectSupport = true,
          insertReplaceSupport = true,
          labelDetailsSupport = true,
          deprecatedSupport = true,
          commitCharactersSupport = true,
          tagSupport = { valueSet = { 1 } },
          resolveSupport = {
            properties = {
              "documentation",
              "detail",
              "additionalTextEdits",
            },
          },
        },
      },
    },
  }),
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
    local buf = vim.lsp.buf
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gd", buf.definition, opts)
    vim.keymap.set("n", "gr", buf.references, opts)
    vim.keymap.set("n", "K", buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", buf.code_action, opts)
    vim.keymap.set("n", "<leader>f", function() buf.format({ async = true }) end, opts)

    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function() buf.format({ async = false }) end,
    })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.lsp.start({
      name = "lua_ls",
      cmd = { mason_bin("lua-language-server") or "lua-language-server" },
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

  vim.lsp.config("rust_analyzer", {
    cmd = { mason_bin("rust-analyzer") or "rust-analyzer" },
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
        cmd = { mason_bin("rust-analyzer") or "rust-analyzer" },
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

start_lsp("r_language_server", { "r" }, {
  cmd = { "R", "--slave", "-e", "languageserver::run()" },
  filetypes = { "r", "rmd" },
  settings = {},
})
