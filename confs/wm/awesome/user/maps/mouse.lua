return function(modkey)
  local awful = require('awful')

  client.connect_signal('request::default_mousebindings', function()
    awful.mouse.append_client_mousebindings {
      awful.button({}, 1, function(c)
        c:activate { context = 'mouse_click' }
      end),
      awful.button({ modkey }, 1, function(c)
        c:activate { context = 'mouse_click', action = 'mouse_move' }
      end),
      awful.button({ modkey }, 3, function(c)
        c:activate { context = 'mouse_click', action = 'mouse_resize' }
      end),
    }
  end)
end
