local wezterm = require("wezterm")

local get_random_entry = function(tbl)
	local keys = {}
	for key, _ in ipairs(tbl) do
		table.insert(keys, key)
	end
	local randomKey = keys[math.random(1, #keys)]
	return tbl[randomKey]
end

local get_wallpaper = function()
	local wallpapers = {
		wezterm.config_dir .. '/backdrops/space.jpg' ,
		wezterm.config_dir .. '/backdrops/2.jpg' ,
		wezterm.config_dir .. '/backdrops/5.jpg' ,
		wezterm.config_dir .. '/backdrops/6.jpg' ,
		wezterm.config_dir .. '/backdrops/3.jpeg' ,
		wezterm.config_dir .. '/backdrops/9.png' ,
		wezterm.config_dir .. '/backdrops/gh.jpg' ,
	}
	
	local wallpaper = get_random_entry(wallpapers)
	return {
		source = { File = { path = wallpaper } },
		height = "Cover",
		width = "Cover",
		horizontal_align = "Right",
		repeat_x = "Repeat",
		repeat_y = "Repeat",
		opacity = 1,
		-- speed = 200,
	}
end




return get_wallpaper