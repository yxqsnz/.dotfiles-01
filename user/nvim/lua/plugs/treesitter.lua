require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "lua", "rust", "elixir" },
  sync_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
