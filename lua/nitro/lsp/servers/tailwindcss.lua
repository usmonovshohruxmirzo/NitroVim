---@diagnostic disable: undefined-global

return {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/tailwindcss-language-server", "--stdio" },
  filetypes = { "html", "css", "scss", "less", "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_dir = function()
    return vim.fs.dirname(vim.fs.find({ "tailwind.config.js", "tailwind.config.ts", "postcss.config.js" }, { upward = true })[1])
  end,
}
