plugin {
  'lukas-reineke/indent-blankline.nvim',
  event = { 'BufRead', 'BufNewFile' },
  config = function()
    require('indent_blankline').setup {}
  end,
}

plugin {
  'numToStr/Comment.nvim',
  event = { 'BufRead', 'BufNewFile' },
  config = function()
    require('Comment').setup()
  end,
}

plugin {
  'mg979/vim-visual-multi',
}

plugin {
  'wakatime/vim-wakatime',
  event = { 'BufNewFile', 'BufRead' },
}

plugin {
  'folke/trouble.nvim',
  requires = { 'kyazdani42/nvim-web-devicons' },
  command = { 'Trouble', 'TroubleClose', 'TroubleToggle', 'TroubleRefresh' },
  config = function()
    require('trouble').setup {}
  end,
}
