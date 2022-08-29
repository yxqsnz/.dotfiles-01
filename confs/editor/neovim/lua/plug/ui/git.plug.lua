plugin {
  'lewis6991/gitsigns.nvim',
  event = 'BufWinEnter',

  config = function()
    require('gitsigns').setup()
  end,
}
