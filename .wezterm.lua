local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- カラースキームの設定
config.color_scheme = 'Sakura (base16)'

-- 背景透過
config.window_background_opacity = 0.9

-- 起動時に最大化
local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

-- ショートカットキーの作成
local act = wezterm.action
config.keys = {
  -- フルスクリーン切り替え
  {
    key = 'f',
    mods = 'SHIFT|CTRL',
    action = act.ToggleFullScreen,
  },
  -- 新規タブ
  {
    key = 't',
    mods = 'SHIFT|CTRL',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  -- 新規ペイン
  {
    key = 'p',
    mods = 'SHIFT|CTRL',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
}

-- フォントの設定
config.font = wezterm.font("HackGen", {weight="Regular", stretch="Normal", style="Normal"})

-- フォントサイズの設定
config.font_size = 16

return config
