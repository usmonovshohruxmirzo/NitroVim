---@diagnostic disable: undefined-global
---@diagnostic disable: undefined-field

local omnisharp_path = "C:/omnisharp/OmniSharp.exe"

return {
  cmd = { omnisharp_path, "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
  filetypes = { "cs", "xaml", "xml" },
  root_dir = function()
    local root = vim.fs.find({ "*.sln", "*.csproj", ".git" }, { upward = true })[1]
    return root and vim.fs.dirname(root) or vim.loop.cwd()
  end,
  capabilities = _G.capabilities,
  enable_ms_build_load_projects_on_demand = true,
  enable_roslyn_analyzers = true,
  organize_imports_on_format = true,
  enable_import_completion = true,
  analyze_open_documents_only = false,
}
