---@diagnostic disable: undefined-global
---@type table

local M = {}

local config_content = [[
{
  "venv": "venv",
  "venvPath": ".",
  "pythonVersion": "3.12",
  "include": ["."],
  "reportMissingImports": true,
  "reportMissingModuleSource": false
}
]]

local function get_project_root()
  local markers = { ".git", "pyproject.toml", "setup.py", "requirements.txt" }
  local root = vim.fs.find(markers, { upward = true, path = vim.fn.getcwd() })[1]
  if root then
    return vim.fs.dirname(root)
  else
    return vim.fn.getcwd()
  end
end

function M.ensure_pyright_config()
  local root = get_project_root()
  local config_path = root .. "/pyrightconfig.json"

  if vim.fn.filereadable(config_path) == 0 then
    vim.fn.writefile(vim.split(config_content, "\n"), config_path)
    vim.notify("✅ pyrightconfig.json created in " .. root, vim.log.levels.INFO)
  end
end

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.py",
  callback = function()
    M.ensure_pyright_config()
  end,
})

return M
