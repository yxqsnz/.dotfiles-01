plugin {
  'nvim-neorg/neorg',
  ft = 'norg',
  after = 'nvim-treesitter',

  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {},
      },
    }
  end,

  requires = 'nvim-lua/plenary.nvim',
}
