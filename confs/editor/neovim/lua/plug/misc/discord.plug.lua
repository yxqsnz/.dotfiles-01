plugin {
  'andweeb/presence.nvim',
  event = { 'BufRead', 'BufNewFile' },
  config = function()
    require('presence'):setup {}
  end,
}
