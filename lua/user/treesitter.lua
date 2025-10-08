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
    "astro",
    "markdown",
    "markdown_inline",
    "python"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false;
  },
  indent = { enable = true },
})
