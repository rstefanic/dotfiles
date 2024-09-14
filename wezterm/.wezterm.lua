local wezterm = require('wezterm')

local key_to_direction = {
  h = 'Left',
  j = 'Down',
  k = 'Up',
  l = 'Right',
}

local function move(key)
  return {
    key = key,
    mods = 'CTRL',
    action = wezterm.action_callback(function(win, pane)
      if pane:get_user_vars().IS_NVIM == 'true'  then
        win:perform_action({ SendKey = { key = key, mods = 'CTRL' }, }, pane)
      else
        win:perform_action({ ActivatePaneDirection = key_to_direction[key] }, pane)
      end
    end),
  }
end

local function resize(key)
  return {
    key = key,
    mods = 'META',
    action = wezterm.action_callback(function(win, pane)
      if pane:get_user_vars().IS_NVIM == 'true'  then
        win:perform_action({ SendKey = { key = key, mods = 'META' }, }, pane)
      else
        win:perform_action({ AdjustPaneSize = { key_to_direction[key], 3 } }, pane)
      end
    end),
  }
end

local config = wezterm.config_builder()
config.tab_bar_at_bottom = true;
config.cursor_blink_rate = 0
config.font_size = 16
config.font = wezterm.font('JetBrains Mono', { weight = 'Bold' })

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
    {
        mods = 'LEADER',
        key = '-',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    {
        mods = 'LEADER',
        key = '|',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    {
        mods = 'LEADER',
        key = 'z',
        action = wezterm.action.TogglePaneZoomState
    },
    {
        mods = 'LEADER',
        key = 's',
        action = wezterm.action.PaneSelect {
            mode = 'SwapWithActive',
        },
    },

    move('h'),
    move('j'),
    move('k'),
    move('l'),

    resize('h'),
    resize('j'),
    resize('k'),
    resize('l'),
}

return config
