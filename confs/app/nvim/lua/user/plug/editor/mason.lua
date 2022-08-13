with({ 'williamboman/mason.nvim' }, function()
  require("mason").setup({
    ui = {
      icons = {
        package_installed = ' ',
        package_peding = ' ',
        package_uninstalled = ' ',
      }
    }
  })
end)


