---@diagnostic disable: undefined-global

return {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/vscode-eslint-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_dir = function()
    return vim.fs.dirname(vim.fs.find({ "package.json", ".git" }, { upward = true })[1])
  end,
}
