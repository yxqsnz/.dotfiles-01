plugin {
  'folke/todo-comments.nvim',
  requires = 'nvim-lua/plenary.nvim',
  event = 'BufWinEnter',
  config = function()
    require('todo-comments').setup {}
  end,
}
