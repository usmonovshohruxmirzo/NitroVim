---@diagnostic disable: undefined-global
---@type table

local dashboard = require('dashboard')

local quotes = {
  "💡 Tip: Stay in Normal mode more — that’s the Vim way!",
  "🚀 Speed comes from muscle memory, not menus.",
  "⚡ Focus on editing, not configuring. NitroVim’s got your back.",
  "🌌 Small configs, big productivity.",
  "🔥 Code fast, exit faster. :wq",
}

math.randomseed(os.time())
local random_quote = quotes[math.random(#quotes)]

dashboard.setup({
  theme = 'doom',
  config = {
    header = {
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      '███╗   ██╗██╗████████╗██████╗  ██████╗ ██╗   ██╗██╗███╗   ███╗',
      '████╗  ██║██║╚══██╔══╝██╔══██╗██╔═══██╗██║   ██║██║████╗ ████║',
      '██╔██╗ ██║██║   ██║   ██████╔╝██║   ██║██║   ██║██║██╔████╔██║',
      '██║╚██╗██║██║   ██║   ██╔══██╗██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
      '██║ ╚████║██║   ██║   ██║  ██║╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
      '╚═╝  ╚═══╝╚═╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
      '',
      '⚡ The NITROVIM Experience ⚡',
      '',
      '',
      '',
    },
    center = {
      {
        icon = '  ',
        icon_hl = 'DashboardCenter',
        desc = 'New File',
        desc_hl = 'DashboardCenter',
        key = 'n',
        keymap = 'SPC n f',
        key_hl = 'DashboardCenter',
        action = 'enew',
      },
      {
        icon = '  ',
        icon_hl = 'DashboardCenter',
        desc = 'Recent Files',
        desc_hl = 'DashboardCenter',
        key = 'r',
        key_hl = 'DashboardCenter',
        action = 'Telescope oldfiles',
      },
      {
        icon = '  ',
        icon_hl = 'DashboardCenter',
        desc = 'Find File',
        desc_hl = 'DashboardCenter',
        key = 'f',
        keymap = 'SPC ff',
        key_hl = 'DashboardCenter',
        action = 'Telescope find_files',
      },
      {
        icon = '  ',
        icon_hl = 'DashboardCenter',
        desc = 'File Browser',
        desc_hl = 'DashboardCenter',
        key = 'b',
        keymap = 'SPC e',
        key_hl = 'DashboardCenter',
        action = 'NvimTreeToggle',
      },
      {
        icon = '  ',
        icon_hl = 'DashboardCenter',
        desc = 'Settings',
        desc_hl = 'DashboardCenter',
        key = 's',
        key_hl = 'DashboardCenter',
        action = 'edit ' .. vim.fn.stdpath('config') .. '/init.lua',
      },
      {
        icon = '  ',
        icon_hl = 'DashboardCenter',
        desc = 'Update Plugins',
        desc_hl = 'DashboardCenter',
        key = 'u',
        key_hl = 'DashboardCenter',
        action = 'Lazy update',
      },
      {
        icon = '  ', -- Quit
        icon_hl = 'DashboardCenter',
        desc = 'Quit',
        desc_hl = 'DashboardCenter',
        key = 'q',
        key_hl = 'DashboardCenter',
        action = 'qa',
      },
    },
    footer = {
      "",
      "💻 github.com/NitroVim  |   📦 @NitroBrain",
      "",
      "⚡ Fast. Minimal. Lua.  |  🚀 Crafted for Speed",
      "",
      random_quote,
      "",
    },
  },
})
