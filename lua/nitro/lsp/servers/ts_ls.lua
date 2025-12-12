---@diagnostic disable: undefined-global

return {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/typescript-language-server", "--stdio" },
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  root_dir = function()
    return vim.fs.dirname(vim.fs.find({ "package.json", ".git" }, { upward = true })[1])
  end,
}
