require('lualine').setup({
  options = {
    theme = 'gruvbox-material',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_x = { "filetype" }
  }
})
