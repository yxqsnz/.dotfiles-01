local colors = require('core.colors')

return function(module)
  local logger = {}

  local function send_log(level, color, ...)
    local fmt_content = string.format(...)
    print(
      string.format('[%s%s%s %s%s%s] %s', color, level, colors.reset, colors.dim, module, colors.reset, fmt_content)
    )
  end

  function logger:info(...)
    send_log('INFO', colors.green, ...)
  end

  function logger:debug(...)
    send_log('DEBUG', colors.cyan, ...)
  end

  return logger
end
