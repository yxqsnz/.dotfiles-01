plugin {
  'nvim-telescope/telescope.nvim',
  requires = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-ui-select.nvim' },

  cmd = 'Telescope',
  module = { 'telescope' },

  config = function()
    require('telescope').load_extension('ui-select')
  end,
}
