---@diagnostic disable: undefined-global
---@type table

vim.api.nvim_create_user_command(
  "MkDir",
  function(opts)
    local dir = opts.args
    if dir == "" then
      print("Please provide a folder path!")
      return
    end
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
      print("Folder created: " .. dir)
    else
      print("Folder already exists: " .. dir)
    end
  end,
  { nargs = 1 }
)

vim.api.nvim_create_user_command("DeleteAllBuffers", function()
  local current_buf = vim.api.nvim_get_current_buf()

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and buf ~= current_buf then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end

  vim.notify("All buffers except the current one have been deleted", vim.log.levels.INFO)
end, { nargs = 0 })
