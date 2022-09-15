local colors = require('utils.termcolors')

return function(scope)
  local log = { scope = scope }

  function log:info(...)
    print(
      string.format(
        '[%sINFO%s  %s%s%s] %s',
        colors.cyan,
        colors.reset,
        colors.dim,
        self.scope,
        colors.reset,
        string.format(...)
      )
    )
  end

  function log:debug(...)
    print(
      string.format(
        '[%sDEBUG%s %s%s%s] %s',
        colors.green,
        colors.reset,
        colors.dim,
        self.scope,
        colors.reset,
        string.format(...)
      )
    )
  end

  function log:error(...)
    print(
      string.format(
        '[%sERROR%s %s%s%s] %s',
        colors.red,
        colors.reset,
        colors.dim,
        self.scope,
        colors.reset,
        string.format(...)
      )
    )
  end

  function log:warn(...)
    print(
      string.format(
        '[%sWARN%s %s%s%s] %s',
        colors.yellow,
        colors.reset,
        colors.dim,
        self.scope,
        colors.reset,
        string.format(...)
      )
    )
  end

  return log
end
