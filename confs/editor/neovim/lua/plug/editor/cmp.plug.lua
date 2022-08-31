plugin {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  module = { 'cmp', 'cmp_nvim_lsp' },
  requires = {
    { 'hrsh7th/cmp-nvim-lsp', wants = 'nvim-cmp' },
    { 'hrsh7th/cmp-buffer', wants = 'nvim-cmp' },
    { 'hrsh7th/cmp-path', wants = 'nvim-cmp' },
    { 'hrsh7th/cmp-cmdline', wants = 'nvim-cmp' },
    { 'L3MON4D3/LuaSnip', wants = 'nvim-cmp' },
    { 'saadparwaiz1/cmp_luasnip', wants = 'nvim-cmp' },
    { 'windwp/nvim-autopairs', wants = 'nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp', wants = 'nvim-cmp' },
    { 'rafamadriz/friendly-snippets', wants = 'nvim-cmp' },
  },

  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')

    require('nvim-autopairs').setup { map_bs = false, map_cr = false }

    local kind_icons = {
      Namespace = '',
      Text = ' ',
      Method = ' ',
      Function = ' ',
      Constructor = ' ',
      Field = 'ﰠ ',
      Variable = ' ',
      Class = 'ﴯ ',
      Interface = ' ',
      Module = ' ',
      Property = 'ﰠ ',
      Unit = '塞 ',
      Value = ' ',
      Enum = ' ',
      Keyword = ' ',
      Snippet = ' ',
      Color = ' ',
      File = ' ',
      Reference = ' ',
      Folder = ' ',
      EnumMember = ' ',
      Constant = ' ',
      Struct = 'פּ ',
      Event = ' ',
      Operator = ' ',
      TypeParameter = ' ',
      Table = '',
      Object = ' ',
      Tag = '',
      Array = '[]',
      Boolean = ' ',
      Number = ' ',
      Null = 'ﳠ',
      String = ' ',
      Calendar = '',
      Watch = ' ',
      Package = '',
    }

    local function border(hl_name)
      return {
        { '╭', hl_name },
        { '─', hl_name },
        { '╮', hl_name },
        { '│', hl_name },
        { '╯', hl_name },
        { '─', hl_name },
        { '╰', hl_name },
        { '│', hl_name },
      }
    end

    cmp.setup {
      window = {
        completion = cmp.config.window.bordered {
          border = border('CmpBorder'),
        },

        documentation = cmp.config.window.bordered {
          border = border('CmpBorder'),
        },
      },

      formatting = {
        format = function(entry, vim_item)
          vim_item.kind = string.format('%s%s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
          vim_item.menu = ''
          return vim_item
        end,
      },

      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),

        ---@diagnostic disable-next-line: missing-parameter
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },

        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'n', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'n', 's' }),
      },
      sources = {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
      },
    }

    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'cmp_git' },
      }, {
        { name = 'buffer' },
      }),
    })

    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      },
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        { name = 'cmdline' },
      }),
    })

    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
}
