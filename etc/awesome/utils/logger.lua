local stderr = io.stderr
local colors = require('utils.colors')
local _info = colors('[%{blue}info%{reset}] ')
local _warn = colors('[%{yellow}warn%{reset}] ')
local _error = colors('[%{red}error%{reset}] ')
local function info(content)
  print(_info .. content)
end

local function warn(content)
  stderr.write(stderr, _warn .. content .. '\n')
end

local function error(content)
  stderr.write(stderr, _error .. content .. '\n')
end

return {
  info = info,
  error = error,
  warn = warn,
}
