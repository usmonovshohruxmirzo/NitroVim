vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.opt.fillchars:append({ eob = " " })
vim.o.autoread = true
vim.opt.cursorline = true
vim.opt.wrap = false

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Performance
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500

-- File Handling
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.hidden = true
vim.opt.confirm = true

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
