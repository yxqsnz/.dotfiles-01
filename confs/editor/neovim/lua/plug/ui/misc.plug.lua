plugin {
  "folke/todo-comments.nvim",
  requires = "nvim-lua/plenary.nvim",
  event = "BufRead",
  config = function()
    require("todo-comments").setup({})
  end
}
