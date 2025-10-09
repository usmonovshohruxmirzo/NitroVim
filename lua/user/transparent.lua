---@diagnostic disable: undefined-global
---@type table

local ok, transparent = pcall(require, "transparent")
if not ok then
  vim.notify("transparent.nvim not found!", vim.log.levels.ERROR)
  return
end

require("transparent").setup({
  groups = {
    "Normal", "NormalNC", "Comment", "Constant", "Special", "Identifier",
    "Statement", "PreProc", "Type", "Underlined", "Todo", "String", "Function",
    "Conditional", "Repeat", "Operator", "Structure", "LineNr", "NonText",
    "SignColumn", "CursorLine", "CursorLineNr", "StatusLine", "StatusLineNC",
    "EndOfBuffer", "MsgArea", "VertSplit", "WinSeparator",
    "DiagnosticNormal", "DiagnosticSignWarn", "DiagnosticSignError", "DiagnosticSignHint",
    "TabLine", "TabLineFill", "TabLineSel",

    "lualine_a_normal_separator", "lualine_a_insert_separator", "lualine_a_visual_separator",
    "lualine_a_replace_separator", "lualine_a_command_separator",

    "lualine_b_normal", "lualine_b_insert", "lualine_b_visual", "lualine_b_replace", "lualine_b_command",
    "lualine_b_normal_separator", "lualine_b_insert_separator", "lualine_b_visual_separator",
    "lualine_b_replace_separator", "lualine_b_command_separator",

    "lualine_c_normal", "lualine_c_insert", "lualine_c_visual", "lualine_c_replace", "lualine_c_command",
    "lualine_c_normal_separator", "lualine_c_insert_separator", "lualine_c_visual_separator",
    "lualine_c_replace_separator", "lualine_c_command_separator",

    "lualine_x_normal", "lualine_x_insert", "lualine_x_visual", "lualine_x_replace", "lualine_x_command",
    "lualine_x_normal_separator", "lualine_x_insert_separator", "lualine_x_visual_separator",
    "lualine_x_replace_separator", "lualine_x_command_separator",

    "lualine_y_normal", "lualine_y_insert", "lualine_y_visual", "lualine_y_replace", "lualine_y_command",
    "lualine_y_normal_separator", "lualine_y_insert_separator", "lualine_y_visual_separator",
    "lualine_y_replace_separator", "lualine_y_command_separator",

    "lualine_z_normal", "lualine_z_insert", "lualine_z_visual", "lualine_z_replace", "lualine_z_command",
    "lualine_z_normal_separator", "lualine_z_insert_separator", "lualine_z_visual_separator",
    "lualine_z_replace_separator", "lualine_z_command_separator",
  },
  extra_groups = {
    "NormalFloat", "FloatBorder",

    "NvimTreeNormal", "NvimTreeNormalNC", "NvimTreeEndOfBuffer", "NvimTreeVertSplit",

    "TelescopeNormal", "TelescopeBorder", "TelescopePromptNormal", "TelescopePromptBorder",
    "TelescopeResultsNormal", "TelescopeResultsBorder", "TelescopePreviewNormal", "TelescopePreviewBorder",

    "TermNormal", "TermNormalNC",
    "Pmenu", "PmenuSbar",
  },
  exclude_groups = {
    "lualine_a_normal", "lualine_a_insert", "lualine_a_visual", "lualine_a_replace", "lualine_a_command",
  },
  on_clear = function() end,
})

pcall(transparent.clear_prefix, "BufferLine")
pcall(transparent.clear_prefix, "NvimTree")
pcall(transparent.clear_prefix, "ToggleTerm")
pcall(transparent.clear_prefix, "lualine")

local buffer_offset_groups = { "BufferLineOffset", "BufferLineOffsetSeparator" }
for _, group in ipairs(buffer_offset_groups) do
  pcall(vim.api.nvim_set_hl, 0, group, { bg = "NONE", ctermbg = "NONE" })
end
