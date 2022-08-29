plugin {
  'folke/which-key.nvim',
  keys = '<leader>',
  opt = true,
  module = 'which-key',

  config = function()
    require('which-key').setup()
    require('user.maps')
  end,
}
