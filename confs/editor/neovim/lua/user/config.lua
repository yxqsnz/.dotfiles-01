return {
  theme = {
    re = 'catppuccin/nvim',
    as = 'catppuccin',
    rc = 'user.custom.catppuccin',
  },

  lsp = {
    servers = { 'sumneko_lua', 'pyright' },
    formatters = { 'stylua', 'black', 'isort', 'rustfmt', 'clang_format' },
    diagnostics = { 'eslint', 'flake8' },
  },

  treesitter = {
    ensure_installed = { 'lua', 'norg', 'markdown', 'markdown_inline' },
  },
}
