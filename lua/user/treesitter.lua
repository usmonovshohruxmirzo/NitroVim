require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "javascript",
    "typescript",
    "tsx",
    "html",
    "css",
    "json",
    "c_sharp",
    "vue"
  },
  highlight = { enable = true },
  indent = { enable = true }
})
