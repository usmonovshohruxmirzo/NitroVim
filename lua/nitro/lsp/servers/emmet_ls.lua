---@diagnostic disable: undefined-global

return {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/emmet-language-server", "--stdio" },
  filetypes = { "html", "css", "javascriptreact", "typescriptreact", "svelte", "vue" },
}
