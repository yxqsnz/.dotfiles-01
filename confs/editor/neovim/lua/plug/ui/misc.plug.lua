plugin {
  'folke/todo-comments.nvim',
  requires = 'nvim-lua/plenary.nvim',
  event = { 'BufRead', 'BufNewFile' },
  config = function()
    require('todo-comments').setup {}
  end,
}
