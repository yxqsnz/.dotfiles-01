local this = {}

function this.map(values, callback)
  for _, item in ipairs(values) do
    callback(item)
  end
end

function this.map_field(to_map, values)
  local collector = {}

  for _, field in pairs(values) do
    table.insert(collector, to_map[field])
  end

  return collector
end

return this

