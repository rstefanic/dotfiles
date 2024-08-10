local wezterm = require('wezterm')

local config = wezterm.config_builder()
config.enable_tab_bar = false;
config.default_cursor_style = 'SteadyBlock'
config.cursor_blink_rate = 0

config.font = wezterm.font('JetBrainsMono Nerd Font')
config.font_size = 16

return config
