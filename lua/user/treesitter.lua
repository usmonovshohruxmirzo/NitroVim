require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "javascript",
    "typescript",
    "tsx",
    "html",
    "css",
    "json",
    "c_sharp",
    "vue",
    "astro"
  },
  highlight = { enable = true },
  indent = { enable = true },
})
