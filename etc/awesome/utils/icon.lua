local lgi     = require("lgi")
local ok, gtk = lgi.require("Gtk", "4.0")
local logger  = require("utils.logger")
if not ok then
  logger.warn("can't find GTK 4.0. using GTK 3.0 instead.")
  gtk = lgi.require('Gtk', '3.0')
end
-- Create a launcher widget and a main menu
local function lookup_icon(icon, size)
  local icon_theme = gtk.IconTheme.get_default()
  local icon_info = icon_theme:lookup_icon(icon, size, "USE_BUILTIN")
  return icon_info and icon_info:get_filename() or nil
end

return {
  lookup_icon = lookup_icon
}
