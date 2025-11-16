---@diagnostic disable: undefined-global

require("notify").setup({
  background_colour = "#000000",
})

vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function(args)
    local reg = args.data and args.data.register or "a"
    vim.notify("Recording @" .. reg, "info", { timeout = 2000 })
  end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function(args)
    local reg = args.data and args.data.register or "a"
    vim.notify("Recording @" .. reg .. " stopped", "info", { timeout = 2000 })
  end,
})
