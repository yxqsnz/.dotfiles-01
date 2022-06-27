-- vim: foldmarker={{,}} foldmethod=marker
local theme = {}
local gears = require("gears")
local dpi = require("beautiful.xresources").apply_dpi
-- {{ Confdir, wallpaper, iconTheme
theme.confdir = gears.filesystem.get_configuration_dir() .. "themes/tokyonight"
theme.wallpaper = theme.confdir .. "/assets/wallpaper.jpg"
theme.icon_theme = "Papirus-Dark"
-- }}
-- {{ Font
theme.dashboardFont = "Iosevka SS14"
theme.nerdFont = "Symbols Nerd Font"
theme.font = "Iosevka"
-- }}
-- {{ Colors
-- {{ Background
theme.bg_normal = "#1a1b26"
theme.bg_focus = theme.bg_normal
theme.bg_urgent = "#f7768e"
theme.bg_minimize = "#15161E"
theme.bg_systray = theme.bg_normal
-- }}
-- {{ Foreground
theme.fg_normal = "#c0caf5"
theme.fg_focus = "#bb9af7"
theme.fg_urgent = "#f7768e"
theme.fg_minimize = theme.bg_minimize
-- }}
-- {{ Border and Gap
theme.useless_gap = dpi(4)
theme.border_width = dpi(1)
theme.border_normal = "#7aa2f7"
theme.border_focus = "#535d6c"
theme.border_marked = "#91231c"
theme.notification_border_color = theme.fg_focus
-- }}
-- }}
-- {{ Misc
theme.systray_icon_spacing = 8
theme.systray_max_rows = 2
theme.hotkeys_modifiers_fg = theme.fg_focus
-- }}
-- {{ Notification
theme.notification_icon_size = 50
-- }}
Log.debug("(Theme[Wibar]) Loading Wibar")
return theme
