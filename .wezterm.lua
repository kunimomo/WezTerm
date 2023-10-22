local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- カラースキームの設定
config.color_scheme = 'tokyonight_night'

-- 背景透過
config.window_background_opacity = 0.9

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
