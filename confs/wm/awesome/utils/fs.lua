local mod = {}

function mod.read(path)
  local file = io.open(path, 'r')

  if file then
    local output = file:read()
    file:close()

    return output
  end
end
return mod
