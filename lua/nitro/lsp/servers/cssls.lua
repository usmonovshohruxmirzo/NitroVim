---@diagnostic disable: undefined-global

return {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
}
