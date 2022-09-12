local tborder = { fg = '#3e4145', bg = '#181825' }
local ucolors = require('catppuccin.utils.colors')
local latte = require('catppuccin.palettes').get_palette('latte')

local opts = {
  dim_inactive = {
    enabled = true,
    shade = 'dark',
    percentage = 0.15,
  },
  transparent_background = false,
  term_colors = false,
  compile = {
    enabled = true,
    path = vim.fn.stdpath('cache') .. '/catppuccin',
  },
  styles = {
    comments = { 'italic' },
    conditionals = { 'italic' },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { 'bold' },
        hints = {},
        warnings = {},
        information = {},
      },
      underlines = {
        errors = { 'underline' },
        hints = { 'underline' },
        warnings = { 'underline' },
        information = { 'underline' },
      },
    },
    coc_nvim = false,
    lsp_trouble = false,
    cmp = true,
    lsp_saga = true,
    gitgutter = false,
    gitsigns = true,
    leap = false,
    telescope = true,
    nvimtree = true,

    neotree = {
      enabled = false,
      show_root = true,
      transparent_panel = false,
    },

    dap = {
      enabled = false,
      enable_ui = false,
    },

    which_key = false,

    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },

    dashboard = false,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    markdown = true,
    lightspeed = false,
    ts_rainbow = true,
    hop = false,
    notify = true,
    telekasten = true,
    symbols_outline = false,
    mini = false,
    aerial = false,
    vimwiki = false,
    beacon = true,
    navic = {
      enabled = false,
      custom_bg = 'NONE',
    },
    overseer = false,
  },
  color_overrides = {},
  highlight_overrides = {
    all = {
      TelescopeNormal = { bg = '#181825' },
      TelescopePromptBorder = tborder,
      TelescopeResultsBorder = tborder,
      TelescopePreviewBorder = tborder,
    },
    latte = {
      Normal = { fg = ucolors.darken(latte.base, 0.7, latte.mantle) },
    },
    mocha = {
      CmpBorder = { fg = '#3e4145' },
      LspBorder = { fg = '#3e4145', bg = '#181825' },
      LspSagaHoverBorder = { fg = '#3e4145', bg = '#181825' },
      LspSagaRenameBorder = { fg = '#3e4145', bg = '#11111b' },
    },
  },
}

vim.g.catppuccin_flavour = 'mocha'
require('catppuccin').setup(opts)
