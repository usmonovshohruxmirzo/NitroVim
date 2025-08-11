vim.opt.termguicolors = true
vim.opt.showtabline = 5

require("bufferline").setup({
    options = {
        mode = "buffers",
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        offsets = {
         {
           filetype = "NvimTree",
           text = "File Explorer",
           text_align = "center",
           separator = false,
           padding = 0
         },
       },
    },
    highlights = {
        buffer_selected = {
            bold = true,
            italic = false,
        },
    }
})
