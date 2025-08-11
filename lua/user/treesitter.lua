require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "javascript",
    "typescript",
    "tsx",
    "html",
    "css",
    "json",
    "c_sharp"
  },
  highlight = { enable = true },
})
