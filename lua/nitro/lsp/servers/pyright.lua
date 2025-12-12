---@diagnostic disable: undefined-global
return {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/pyright-langserver", "--stdio" },
  filetypes = { "python" },
  settings = {
    python = {
      analysis = { reportMissingImports = false },
    },
  },
}
