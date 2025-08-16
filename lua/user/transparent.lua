require("transparent").setup({
  groups = {
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
    'EndOfBuffer',
  },

  extra_groups = {
    "NormalFloat", "FloatBorder",
    "NvimTreeNormal", "NvimTreeNormalNC", "NvimTreeEndOfBuffer", "NvimTreeVertSplit",
    "BufferLineBackground", "BufferLineBuffer", "BufferLineSeparator",
    "BufferLineSeparatorVisible", "BufferLineCloseButton", "BufferLineCloseButtonVisible",
    "BufferLineOffset", "BufferLineOffsetSeparator",
    "TelescopeNormal", "TelescopeBorder", "TelescopePromptNormal", "TelescopePromptBorder",
    "TelescopeResultsNormal", "TelescopeResultsBorder", "TelescopePreviewNormal", "TelescopePreviewBorder"
  },
  exclude_groups = {},
  on_clear = function() end
})

require('transparent').clear_prefix('BufferLine')
require('transparent').clear_prefix('NeoTree')
require('transparent').clear_prefix('lualine')

local buffer_offset_groups = { "BufferLineOffset", "BufferLineOffsetSeparator" }
for _, group in ipairs(buffer_offset_groups) do
  pcall(vim.api.nvim_set_hl, 0, group, { bg = "NONE", ctermbg = "NONE" })
end

if pcall(require, 'bufferline.config') then
  local highlights = require('bufferline.config').highlights
  for _, hl in pairs(highlights) do
    vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { hl.hl_group })
  end
end
