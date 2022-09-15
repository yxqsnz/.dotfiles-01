local ruled = require('ruled')
local awful = require('awful')

ruled.client.connect_signal('request::rules', function()
  -- @DOC_GLOBAL_RULE@
  -- All clients will match this rule.

  ruled.client.append_rule {
    id = 'global',
    rule = {},
    properties = {
      focus = awful.client.focus.filter,
      raise = true,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen,
    },
  }

  -- @DOC_FLOATING_RULE@
  -- Floating clients.
  ruled.client.append_rule {
    id = 'floating',
    rule_any = {
      instance = { 'copyq', 'pinentry' },
      class = {
        'Arandr',
        'Blueman-manager',
        'Gpick',
        'Kruler',
        'Sxiv',
        'Tor Browser',
        'Wpa_gui',
        'veromix',
        'xtightvncviewer',
      },
      -- Note that the name property shown in xprop might be set slightly after creation of the client
      -- and the name shown there might not match defined rules here.
      name = {
        'Event Tester', -- xev.
      },
      role = {
        'AlarmWindow', -- Thunderbird's calendar.
        'ConfigManager', -- Thunderbird's about:config.
        'pop-up', -- e.g. Google Chrome's (detached) Developer Tools.
      },
    },
    properties = { floating = true },
  }

  -- @DOC_DIALOG_RULE@
  -- Add titlebars to normal clients and dialogs
  ruled.client.append_rule {
    -- @DOC_CSD_TITLEBARS@
    id = 'titlebars',
    rule_any = { type = { 'normal', 'dialog' } },
    properties = { titlebars_enabled = false },
  }

  ruled.client.append_rule {
    id = 'discordfix',
    rule_any = { class = { 'discord' } },
    properties = {
      on_ready = function(client)
        client.maximized = false
      end,
    },
  }

  -- Set Firefox to always map on the tag named "2" on screen 1.
  -- ruled.client.append_rule {
  --     rule       = { class = "Firefox"     },
  --     properties = { screen = 1, tag = "2" }
  -- }
end)
