Settings = {
  theme = {
    repo = "catppuccin/nvim",
    name = "catppuccin",
    config = "user.theme",
  },
  lsp = {
    servers = {
      "rust_analyzer",
      "sumneko_lua",
      "clangd",
      "cssls",
      "jsonls",
      "tsserver",
      "pylsp",
      "cssls",
    },
    linters = { "staticcheck", "credo", "eslint", "mdl" },
    code_actions = { "eslint", "gitsigns", "refactoring" },
    formatters = {
      "stylua",
      "clang_format",
      "rustfmt",
      "cmake_format",
      "black",
      "prettier",
    },
  },
  treesitter = {
    ensure_installed = {
      "rust",
      "lua",
      "markdown",
      "markdown_inline",
      "c",
      "cpp",
    },
  },
}
