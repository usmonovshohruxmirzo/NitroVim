vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle File Explorer" })
vim.keymap.set("n", "<leader>h", ":NvimTreeFocus<CR>", { noremap = true, silent = true, desc = "Focus File Explorer" })

local function toggle_term_bottom()
  if vim.bo.filetype == "NvimTree" then
    vim.cmd("wincmd l")
  end
  vim.cmd("ToggleTerm direction=horizontal size=15")
end

vim.keymap.set("n", "<leader>t", toggle_term_bottom, { noremap = true, silent = true, desc = "Toggle Terminal Bottom" })

vim.keymap.set("t", "<leader>t", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", false) -- exit terminal mode
  vim.cmd("ToggleTerm")
  if vim.fn.bufexists("#") == 1 then
    vim.cmd("wincmd p")
  end
end, { noremap = true, silent = true, desc = "Toggle Terminal Bottom" })

vim.keymap.set("n", "<leader>g", ":wincmd p<CR>", { noremap = true, silent = true, desc = "Focus Editor" })
