plugin({
  'kyazdani42/nvim-tree.lua',
  requires = { 'kyazdani42/nvim-web-devicons' },
  cmd = 'NvimTreeToggle',
  config = function()
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      hijack_unnamed_buffer_when_opening = true,

      view = {
        side = 'right',
        adaptive_size = true,
        mappings = {
          list = {
            { key = "u", action = "dir_up" },
          },
        },
      },

      renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
          git_placement = "after",
        },

      },

      diagnostics = {
        enable = true
      },

      update_focused_file = {
        enable = true
      },

      filters = {
        dotfiles = true,
      },
    })
  end
})
