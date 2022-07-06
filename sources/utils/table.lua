function table.keys_to_string(keys)
   local str = ''
   for key, _ in pairs(keys) do
      str = str .. key .. ' '
   end
   return str
end