local theme = require("catppuccin")
theme.setup({
  term_colors = true,
  integrations = {
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = "NONE",
        hints = "NONE",
        warnings = "NONE",
        information = "NONE",
      },
      underlines = {
        errors = "underline",
        hints = "underline",
        warnings = "underline",
        information = "underline",
      },
    },
    nvimtree = {
      enabled = true,
      show_root = true,
    },
    markdown = true,
    treesitter = true,
    lsp_saga = true,
    notify = true,
    ts_rainbow = true,
  },
})
vim.g.catppuccin_flavour = "mocha"
vim.api.set_theme("catppuccin")
