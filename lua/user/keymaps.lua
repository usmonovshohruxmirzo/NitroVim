vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle File Explorer" })
vim.keymap.set("n", "<leader>h", ":NvimTreeFocus<CR>", { noremap = true, silent = true, desc = "Focus File Explorer" })
vim.keymap.set("n", "<leader>g", ":wincmd p<CR>", { noremap = true, silent = true, desc = "Focus Editor" })
