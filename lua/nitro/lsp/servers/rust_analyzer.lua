---@diagnostic disable: undefined-global

return {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/rust-analyzer" },
  filetypes = { "rust" },
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = { command = "clippy" },
    },
  },
}
