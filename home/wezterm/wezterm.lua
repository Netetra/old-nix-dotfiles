local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- テーマ
config.color_scheme = "Monokai Dark (Gogh)"
-- フォント
config.font = wezterm.font 'Fira Code'
config.font_size = 10

-- IMEの使用
config.use_ime = true

-- Tabバー
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

-- トキーバインド
-- config.disable_default_key_bindings = true

config.keys = {
  {
    key = "c",
    mods = "ALT",
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
  },{
    key = "v",
    mods = "ALT",
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
  },{
    key = "a",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection "Up",
  },{
    key = "s",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection "Down",
  },{
    key = "d",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection "Left",
  },{
    key = "f",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection "Right",
  },
}

return config