plugin {
  'nvim-neorg/neorg',
  ft = 'norg',
  cmd = 'Neorg',
  after = 'nvim-treesitter',
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {},
        ['external.kanban'] = {},
        ['core.gtd.base'] = {
          config = {
            workspace = 'default',
          },
        },
        ['core.norg.concealer'] = {
          config = {
            icon_preset = 'diamond',
          },
        },
        ['core.norg.completion'] = {
          config = {
            engine = 'nvim-cmp',
          },
        },
      },
    }
  end,

  requires = { 'nvim-lua/plenary.nvim', 'max397574/neorg-kanban' },
}
