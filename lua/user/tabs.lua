vim.opt.termguicolors = true
vim.opt.showtabline = 5

require("bufferline").setup({
    options = {
        mode = "buffers",
        separator_style = "slant",
        offsets = {
         {
           filetype = "NvimTree",
           text = "File Explorer",
           text_align = "left",
           separator = false,
           padding = 0
         },
       },
    },
    highlights = {
        buffer_selected = {
            bold = true,
            italic = false,
        }
    }
})
