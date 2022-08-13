with({ 'folke/which-key.nvim' }, function()
  require("which-key").setup()
  pcall(require, 'user.maps')
end)

