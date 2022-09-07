plugin {
  'nvim-treesitter/nvim-treesitter',

  requires = {
    { 'RRethy/nvim-treesitter-endwise', after = 'nvim-treesitter' },
    { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' },
    { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' },
    { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' },
  },

  event = { 'BufNewFile', 'BufRead' },

  run = function()
    require('nvim-treesitter.install').update { with_sync = true }
  end,

  config = function()
    local config = require('user.config').treesitter

    local this = {
      sync_install = false,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 100000,
      },

      endwise = {
        enable = true,
      },

      autotag = {
        enable = true,
      },

      context_commentstring = {
        enable = true,
      },
    }

    require('nvim-treesitter.configs').setup(vim.tbl_deep_extend('force', this, config))
  end,
}

plugin {
  'romgrk/nvim-treesitter-context',
  after = 'nvim-treesitter',

  config = function()
    require('treesitter-context').setup {
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
      trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        default = {
          'class',
          'function',
          'method',
        },
      },
      exact_patterns = {},

      zindex = 20, -- The Z-index of the context window
      mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
      separator = nil, -- Separator between context and content. Should be a single character string, like '-'.
    }
  end,
}
