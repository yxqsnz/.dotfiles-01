with({ 'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly',
  cmd = "NvimTreeToggle"
}, function()
  require("nvim-tree").setup({
    respect_buf_cwd = true,
    update_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
  })
end)
