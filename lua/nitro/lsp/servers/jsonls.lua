---@diagnostic disable: undefined-global

return {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/vscode-json-language-server", "--stdio" },
  filetypes = { "json" },
  settings = {
    json = {
      validate = { enable = true },
    },
  },
}
