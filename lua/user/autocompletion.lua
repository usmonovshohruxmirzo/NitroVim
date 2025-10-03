---@diagnostic disable: undefined-global
---@type table

local function has_plugin(name)
  local ok, _ = pcall(require, name)
  return ok
end

local function setup_completion()
  if has_plugin('luasnip.loaders.from_vscode') then
    require('luasnip.loaders.from_vscode').lazy_load({
      paths = { vim.fn.stdpath("data") .. "/lazy/friendly-snippets" }
    })
  end

  local cmp = require('cmp')
  local luasnip = has_plugin('luasnip') and require('luasnip') or nil

  if has_plugin('luasnip.loaders.from_vscode') then
    require('luasnip.loaders.from_vscode').lazy_load()
  end

  local kind_icons = {
    Text = "T",
    Method = "M",
    Function = "F",
    Constructor = "C",
    Variable = "V",
    Class = "C",
    Interface = "I",
    Module = "M",
    Property = "P",
    Unit = "U",
    Value = "V",
    Enum = "E",
    Keyword = "K",
    Snippet = "S",
    Color = "C",
    File = "F",
    Reference = "R",
    Folder = "D",
    EnumMember = "E",
    Constant = "C",
    Struct = "S",
    Event = "E",
    Operator = "O",
    TypeParameter = "T",
  }

  cmp.setup({
    snippet = {
      expand = function(args)
        if luasnip then
          luasnip.lsp_expand(args.body)
        end
      end,
    },

    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),

      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip and luasnip.expandable() then
          luasnip.expand()
        elseif luasnip and luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),

      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip and luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),

    sources = cmp.config.sources({
      { name = 'buffer',  priority = 700 },
      { name = 'path',    priority = 600 },
      { name = 'luasnip', priority = 800 },
    }),

    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind] or "", vim_item.kind)

        vim_item.menu = ({
          buffer = "[Buffer]",
          path = "[Path]",
          luasnip = "[Snippet]",
        })[entry.source.name]

        return vim_item
      end,
    },
  })

  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
end

setup_completion()

return {
  setup = setup_completion,
}

