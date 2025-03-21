local wezterm = require('wezterm')
local get_wallpaper = require('utils.get_wallpaper')

return {
   term = "xterm-256color",
   animation_fps = 60,
   -- max_fps = 60,
   front_end = 'WebGpu',
   webgpu_power_preference = 'HighPerformance',

   -- color scheme
   -- colors = colors,
   -- color_scheme = "Gruvbox dark, medium (base16)"
   color_scheme = 'Aco (Gogh)',

   -- background
   window_background_opacity = 0.97,
   win32_system_backdrop = 'Tabbed', -- Acrylic,Mica
   -- win32_system_backdrop = 'Acrylic', -- Acrylic,Mica, Tabbed
   background = {
      get_wallpaper(),
   --   {
   --      source = { File = wezterm.config_dir .. '/backdrops/space.jpg' },
   --   },
   --   {
   --      source = { File = wezterm.config_dir .. '/backdrops/purple-waves.jpg' },
   -- --   },
     {
        source = { Color = "#1f1f28" },
        height = '100%',
        width = '100%',
        opacity = 0.96,
     },
   },

   -- scrollbar
   -- enable_scroll_bar = false,
   -- min_scroll_bar_height = "0.5cell",
   -- colors = {
   --    scrollbar_thumb = '#454545',
   --    scrollbar_thumb = '#313131',
   -- },

   -- tab bar
   enable_tab_bar = true,
   hide_tab_bar_if_only_one_tab = false,
   use_fancy_tab_bar = false,
   tab_max_width = 25,
   show_tab_index_in_tab_bar = true,
   switch_to_last_active_tab_when_closing_tab = true,

   -- cursor
   default_cursor_style = "SteadyBlock", -- BlinkingBlock,SteadyBar,SteadyBlock
   cursor_blink_ease_in = "Constant",
   cursor_blink_ease_out = "Constant",
   cursor_blink_rate = 700,
   -- force_reverse_video_cursor = true,

   -- window
   window_decorations = "INTEGRATED_BUTTONS|RESIZE",
   integrated_title_button_style = "Gnome",
   window_padding = {
      left = 4,
      right = 4,
      top = 0,
      bottom = 0,
   },
   window_close_confirmation = 'NeverPrompt',
   -- window_frame = {
      -- active_titlebar_bg = '#090909',
      -- font = fonts.font,
      -- font_size = fonts.font_size,
   -- },
   -- inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
}
