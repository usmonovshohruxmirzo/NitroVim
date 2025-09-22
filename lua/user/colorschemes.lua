-- OneDark
local onedark = {
  { name = "onedark", variant = "darker" },
  { name = "onedark", variant = "cool" },
  { name = "onedark", variant = "warm" },
}

-- Monokai
local monokai = {
  { name = "monokai", variant = "soda" },
  { name = "monokai", variant = "pro" },
  { name = "monokai", variant = "ristretto" },
}

-- Tokyonight
local tokyonight = {
  { name = "tokyonight", variant = "night" },
  { name = "tokyonight", variant = "storm" },
  { name = "tokyonight", variant = "day" },
  { name = "tokyonight", variant = "moon" },
}

-- Gruvbox
local gruvbox = {
  { name = "gruvbox", variant = "dark" },
  { name = "gruvbox", variant = "light" },
}

-- Catppuccin
local catppuccin = {
  { name = "catppuccin", variant = "latte" },
  { name = "catppuccin", variant = "frappe" },
  { name = "catppuccin", variant = "macchiato" },
  { name = "catppuccin", variant = "mocha" },
}

-- Dracula
local dracula = {
  { name = "dracula", variant = "default" },
}

-- Nord
local nord = {
  { name = "nord", variant = "default" },
}

-- Everforest
local everforest = {
  { name = "everforest", variant = "soft" },
  { name = "everforest", variant = "medium" },
  { name = "everforest", variant = "hard" },
}

-- Rose Pine
local rosepine = {
  { name = "rose-pine", variant = "main" },
  { name = "rose-pine", variant = "moon" },
  { name = "rose-pine", variant = "dawn" },
}

local themes = {}
for _, list in ipairs({
  onedark, monokai, tokyonight, gruvbox,
  catppuccin, dracula, nord, everforest, rosepine
}) do
  for _, theme in ipairs(list) do
    table.insert(themes, theme)
  end
end

local theme_save_path = vim.fn.stdpath("config") .. "/theme.json"

local function save_theme(theme)
  local file = io.open(theme_save_path, "w")
  if file then
    file:write(vim.fn.json_encode(theme))
    file:close()
  end
end

local function load_theme()
  local file = io.open(theme_save_path, "r")
  if file then
    local content = file:read("*a")
    file:close()
    local ok, decoded = pcall(vim.fn.json_decode, content)
    if ok and decoded then
      return decoded
    end
  end
  return nil
end

local function apply_theme(theme, save)
  local transparent = false

  if theme.name == "onedark" then
    require("onedark").setup({ style = theme.variant, transparent = transparent })
  elseif theme.name == "monokai" then
    require("monokai").setup({
      transparent_background = transparent,
      palette = require("monokai")[theme.variant]
    })
  elseif theme.name == "tokyonight" then
    require("tokyonight").setup({ style = theme.variant, transparent = transparent })
  elseif theme.name == "gruvbox" then
    require("gruvbox").setup({ transparent_mode = transparent })
  elseif theme.name == "catppuccin" then
    require("catppuccin").setup({ flavour = theme.variant, transparent_background = transparent })
  elseif theme.name == "dracula" then
    require("dracula").setup({ transparent_bg = transparent })
  elseif theme.name == "nord" then
    vim.g.nord_disable_background = transparent
  elseif theme.name == "everforest" then
    vim.g.everforest_background = theme.variant
    vim.g.everforest_transparent_background = 1
  elseif theme.name == "rose-pine" then
    require("rose-pine").setup({ variant = theme.variant, disable_background = transparent })
  end

  vim.cmd.colorscheme(theme.name)

  if save then
    save_theme(theme)
  end
end

vim.api.nvim_create_user_command("ThemeSwitch", function()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  pickers.new({}, {
    prompt_title = "Select Theme",
    finder = finders.new_table {
      results = vim.tbl_map(function(t)
        return string.format("%s (%s)", t.name, t.variant)
      end, themes)
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(_, map)
      local previewed = nil

      local function parse_entry(entry_str)
        local name, variant = entry_str:match("^(.-) %((.-)%)$")
        return { name = name, variant = variant }
      end

      local function live_preview()
        local entry = action_state.get_selected_entry()
        if entry and entry[1] and entry[1] ~= previewed then
          previewed = entry[1]
          apply_theme(parse_entry(entry[1]), false)
        end
      end

      local function select_theme(bufnr)
        local entry = action_state.get_selected_entry()
        actions.close(bufnr)
        if entry and entry[1] then
          local theme = parse_entry(entry[1])
          apply_theme(theme, true)
          print("Theme changed to " .. theme.name .. " [" .. theme.variant .. "]")
        end
      end

      map("i", "<Tab>", live_preview)
      map("n", "<Tab>", live_preview)
      map("i", "<C-n>", function() actions.move_selection_next(); live_preview() end)
      map("i", "<C-p>", function() actions.move_selection_previous(); live_preview() end)
      map("n", "j", function() actions.move_selection_next(); live_preview() end)
      map("n", "k", function() actions.move_selection_previous(); live_preview() end)

      map("i", "<CR>", select_theme)
      map("n", "<CR>", select_theme)

      return true
    end,
  }):find()
end, {})

local last_theme = load_theme()
if last_theme then
  apply_theme(last_theme, false)
else
  apply_theme({ name = "onedark", variant = "darker" }, false)
end
