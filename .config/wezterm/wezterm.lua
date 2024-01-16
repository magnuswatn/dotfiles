local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = false

config.skip_close_confirmation_for_processes_named = {}

config.keys = {
  -- Rebind OPT-Space to just Space, to avoid annoying non-breaking spaces
  {
    key = ' ',
    mods = 'OPT',
    action = act.SendKey { key = ' ' },
  },
}


return config
