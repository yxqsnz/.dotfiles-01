local mod = {}

function mod.colorize(color, text)
  return string.format('<span color="%s">%s</span>', color, text)
end

function mod.box(items)
  local data = ''

  for _, item in pairs(items) do
    data = data .. item
  end

  return string.format('<span>%s</span>', data)
end

return mod
