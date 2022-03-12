OmegaVim = {
  plugins = {},
  theme = "catppuccin",
  lineTheme = "catppuccin",
  vim = vim,
}
local vim = OmegaVim
function plugin(plug)
   vim.plugins[plug.name or plug.url] = plug
end
-- require default plugins
require('plugins')
-- start packer
require('core.packer')
-- default config
require('etc.settings')
