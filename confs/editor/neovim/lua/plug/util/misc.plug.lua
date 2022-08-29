plugin {
  'glacambre/firenvim',
  run = function() vim.fn['firenvim#install'](0) end
}

plugin {
  'lukas-reineke/indent-blankline.nvim',
  event = "BufWinEnter",
  config = function()
    require("indent_blankline").setup({})
  end
}

plugin {
  'numToStr/Comment.nvim',
  event = "BufWinEnter",
  config = function()
    require('Comment').setup()
  end
}
