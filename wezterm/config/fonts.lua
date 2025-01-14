local wezterm = require('wezterm')
local platform = require('utils.platform')

local font = 'JetBrainsMono NF'
-- local font = 'Cascadia Code'
-- local font = 'Nova Nerd Font'
-- local font = 'Hack Nerd Font'

-- local font = 'Geist Mono'
-- local font_size = platform().is_mac and 12 or 13

return {
   font = wezterm.font(font),
   font_size = 14,
   -- line_height = 1.1,
   -- cell_width = 1,

   --ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
   -- freetype_load_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
   -- freetype_render_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}
