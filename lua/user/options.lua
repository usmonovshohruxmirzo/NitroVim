vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.opt.fillchars:append({ eob = " " })
vim.o.autoread = true

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  command = "checktime",
})

vim.api.nvim_create_autocmd("FileChangedShell", {
  callback = function()
    if vim.fn.filereadable(vim.fn.expand("%")) == 0 then
      vim.schedule(function()
        vim.cmd("bdelete")
      end)
    end
  end,
})

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    spacing = 2,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    focusable = true,
    max_width = 80,
    wrap = true,
    source = "always",
    header = "",
    prefix = "",
  },
})
