return {
  theme = {
    re = "catppuccin/nvim",
    as = "catppuccin",
    rc = "user.custom.catppuccin"
  },

  lsp = {
    servers    = { 'sumneko_lua' },
    formatters = { "stylua" }
  },

  treesitter = {
    ensure_installed = { "lua", "norg" }
  }
}
