vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  pattern = "*",
  callback = function()
    if vim.bo.modified and vim.bo.filetype ~= "" and vim.bo.buftype == "" then
      vim.cmd("silent! write")
    end
  end,
})
