vim.opt.termguicolors = true
vim.opt.showtabline = 5

require("bufferline").setup({
    options = {
        mode = "buffers",
        separator_style = "slant",
    },
    highlights = {
        buffer_selected = {
            bold = true,
            italic = false,
        }
    }
})
