---@diagnostic disable: undefined-global

return {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/lua-language-server" },
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true, -- only load Neovim Lua runtime
        },
        checkThirdParty = false,
      },
    },
  },
}
