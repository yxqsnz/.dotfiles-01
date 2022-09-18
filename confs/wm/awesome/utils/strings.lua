local mod = {}

function mod.trim(s)
  return s:match('^%s*(.-)%s*$')
end

return mod
