OmegaVim = {
  plugins = {},
  theme = "catppuccin",
  lineTheme = "catppuccin",
  vim = vim,
}
local vim = OmegaVim
function plugin(plug)
   vim.plugins[plug.url] = plug
end
-- require default plugins
require('plugins')
-- start packer
require('core.plugins')
-- default config
require('etc.settings')
-- keybinds
require('etc.keybinds')
