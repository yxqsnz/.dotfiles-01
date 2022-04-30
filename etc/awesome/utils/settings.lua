-- processed config
local settings = require('user.settings')
local terminal = settings.apps.terminal
local editor   = string.format('%s %s', terminal, settings.apps.editor)
local M        = {}
M.terminal     = terminal
M.editor       = editor
return M
