plugin {
  "nvim-neorg/neorg",

  config = function()
    require('neorg').setup({})
  end,

  requires = "nvim-lua/plenary.nvim"
}
