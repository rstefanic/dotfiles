local wezterm = require('wezterm')

local config = wezterm.config_builder()
config.enable_tab_bar = false;
config.cursor_blink_rate = 0
config.font_size = 16
config.font = wezterm.font('JetBrains Mono', { weight = 'Bold' })

return config
