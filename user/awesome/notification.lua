local naughty = require("naughty")
local dpi = require("beautiful.xresources").apply_dpi
naughty.layout.box.maximum_width = 100
naughty.layout.box.maximum_height = 100
naughty.config.padding = dpi(8)
