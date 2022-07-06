Settings = {
  theme = {
    repo = "catppuccin/nvim",
    name = "catppuccin",
    config = "user.theme",
  },
  lsp = {
    servers = { "rust_analyzer", "sumneko_lua", "clangd" },
    linters = { "staticcheck" },
    formatters = { "stylua" },
  },
  treesitter = {
    ensure_installed = { "rust", "lua", "markdown", "markdown_inline" },
  },
}
