local awful = require('awful')
client.connect_signal('manage', function(client)
  -- Set the windows at the slave,
  -- i.e. put it at the end of others instead of setting it master.
  -- if not awesome.startup then awful.client.setslave(c) end

  if
    awesome.startup
    and not client.size_hints.user_position
    and not client.size_hints.program_position
  then
    -- Prevent clients from being unreachable after screen count changes.
    awful.placement.no_offscreen(client)
  end
end)
