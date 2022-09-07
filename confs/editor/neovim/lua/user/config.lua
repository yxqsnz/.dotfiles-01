return {
  theme = {
    re = 'catppuccin/nvim',
    as = 'catppuccin',
    rc = 'user.custom.catppuccin',
  },

  lsp = {
    servers = { 'sumneko_lua', 'pyright', 'html', 'tsserver', 'tailwindcss' },
    formatters = { 'stylua', 'black', 'isort', 'rustfmt', 'clang_format', 'prettier' },
    diagnostics = { 'eslint', 'flake8' },
  },

  treesitter = {
    ensure_installed = {
      'c',
      'go',
      'lua',
      'cpp',
      'tsx',
      'java',
      'make',
      'bash',
      'json',
      'toml',
      'yaml',
      'norg',
      'html',
      'rust',
      'meson',
      'kotlin',
      'haskell',
      'python',
      'comment',
      'cmake',
      'markdown',
      'javascript',
      'typescript',
      'markdown_inline',
    },
  },
}
