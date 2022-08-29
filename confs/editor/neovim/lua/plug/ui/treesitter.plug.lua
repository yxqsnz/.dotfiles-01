plugin({
  'nvim-treesitter/nvim-treesitter',
  requires = { "p00f/nvim-ts-rainbow", "RRethy/nvim-treesitter-endwise" },
  event = { "BufNewFile", "BufRead" },

  run = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end
}, function()
  local config = require('user.config').treesitter

  local this = {
    sync_install = false,
    auto_install = true,

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false
    },

    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = 100000,
    },

    endwise = {
      enable = true
    }
  }

  require('nvim-treesitter.configs')
      .setup(vim.tbl_deep_extend('force', this, config))
end)
