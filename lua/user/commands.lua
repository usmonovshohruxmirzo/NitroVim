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
