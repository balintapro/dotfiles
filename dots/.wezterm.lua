local wezterm = require 'wezterm'
local config = {}
local tmux = {}

if wezterm.target_triple == "x86_64-apple-darwin" then
    tmux = { "/usr/local/bin/tmux", "new", "-As0" }
else
    tmux = { "tmux", "new", "-As0" }
end

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.default_prog = tmux
config.freetype_load_target = "HorizontalLcd"
config.window_close_confirmation = 'NeverPrompt'
config.hide_tab_bar_if_only_one_tab = true

config.window_background_opacity = 1
config.color_scheme = 'rose-pine'

config.default_cursor_style = 'BlinkingBlock'
config.force_reverse_video_cursor = true

config.font =
    wezterm.font('Hack Nerd Font', { weight = 'Regular' })

config.font_size = 11

return config
