require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { statusline = {}, winbar = {} },
    always_divide_middle = true,
    globalstatus = true,
    refresh = { statusline = 1000, tabline = 100, winbar = 100 },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      'branch',
      'diff',
      {
        'diagnostics',
        sources = { 'nvim_lsp' },
        sections = { 'error', 'warn', 'info', 'hint' },
        colored = true,
        update_in_insert = false,
        always_visible = true,
      }
    },
    lualine_c = { { 'filename', file_status = true, path = 1 } },
    lualine_x = {
      'filesize',
      'encoding',
      'fileformat',
      'filetype',
      'searchcount',
      'selectioncount',
    },
    lualine_y = { 'progress' },
    lualine_z = {
      'location',
      {
        function()
          local clock_icon = " "
          return clock_icon .. " " .. os.date('%H:%M')
        end
      }
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = { 'fugitive', 'quickfix' }
}
