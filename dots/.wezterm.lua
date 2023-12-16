-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

local tmux = {}
if wezterm.target_triple == "x86_64-apple-darwin" then
    tmux = { "/usr/local/bin/tmux", "new", "-As0" }
else
    tmux = { "tmux", "new", "-As0" }
end

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.window_close_confirmation = 'NeverPrompt'

-- For example, changing the color scheme:
config.color_scheme = 'Poimandres'
config.default_prog = tmux

config.freetype_load_target = "HorizontalLcd"

-- Disable animations
config.animation_fps = 1
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

-- Customise colors
local highlight_bg = '#171922'
local highlight_fg = '#5DE4C7'

config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9

config.font =
    wezterm.font('Fira Code Mono', { weight = 'Medium' })

config.font_size = 11

config.colors = {
    selection_bg = highlight_bg,
    selection_fg = highlight_fg,
    -- quick_select_label_bg =             { Color = highlight_bg },
    -- quick_select_label_fg =             { Color = highlight_fg },
    -- quick_select_match_bg =             { Color = highlight_bg },
    -- quick_select_match_fg =             { Color = highlight_fg },
    -- copy_mode_active_highlight_bg =     { Color = highlight_bg },
    -- copy_mode_active_highlight_fg =     { Color = highlight_fg },
    -- copy_mode_inactive_highlight_bg =   { Color = highlight_bg },
    -- :copy_mode_inactive_highlight_fg =   { Color = highlight_fg },
}

-- and finally, return the configuration to wezterm
return config
