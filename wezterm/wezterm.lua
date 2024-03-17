local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- カラースキームの設定
config.color_scheme = 'iceberg-dark'

-- 背景透過
config.window_background_opacity = 0.8

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


-- カーソルの色設定を追加
config.colors = {
  cursor_bg = '#00FF00',
  cursor_fg = '#000000',
  cursor_border = '#00FF00',
}

return config
