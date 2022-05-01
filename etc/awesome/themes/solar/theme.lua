local bar = require('themes.solar.bar')
local settings = require('user.settings')
local dpi = require("beautiful.xresources").apply_dpi


local highlight_col = "#61AFEF"
local base_col = "#101020"

theme                     = {}
theme.dir                 = os.getenv("HOME") .. "/.config/awesome/solar"
theme.wallpaper           = os.getenv("HOME") .. "/.wallpaper.png"
theme.useless_gap         = settings.ui.gaps
theme.font                = "Hack Nerd Font Mono 8"
theme.fg_normal           = "#a9b3d9"
theme.fg_focus            = base_col
theme.fg_urgent           = "#a9b3d9"
theme.bg_normal           = base_col
theme.bg_focus            = highlight_col
theme.bg_urgent           = "#ba6840"
theme.clock_color         = "#56b6c2"
theme.mem_color           = "#985fdd"
theme.cpu_color           = "#44b080"
theme.temp_color          = "#c13251"
theme.bat_color           = "#e5c07b"
theme.net_color           = highlight_col
theme.music_color         = "#98c379"
theme.border_width        = dpi(0)
theme.border_focus        = theme.bg_focus
theme.border_marked       = theme.bg_urgent
theme.border_normal       = theme.border_marked
theme.tasklist_bg_focus   = "#395fdc"
theme.titlebar_bg_focus   = theme.bg_focus
theme.titlebar_bg_normal  = theme.bg_normal
theme.titlebar_fg_focus   = theme.fg_focus
theme.bg_systray          = base_col
theme.menu_height         = dpi(24)
theme.menu_width          = dpi(160)
theme.taglist_bg_empty    = base_col
theme.taglist_bg_occupied = "#395fdc"
theme.taglist_fg_occupied = base_col
theme.taglist_bg_focus    = theme.bg_focus
return bar(theme)
