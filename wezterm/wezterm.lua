local wezterm = require('wezterm')
return {
	color_scheme = 'Dracula (Official)',
	enable_tab_bar = false,
	tab_bar_at_bottom = false,
	use_fancy_tab_bar = false,
	window_decorations = 'RESIZE',
	font = wezterm.font('VictorMono Nerd Font Mono'),
	font_size = 20,
	line_height = 1.1,
	freetype_load_target = 'Light',
	freetype_render_target = 'HorizontalLcd',
	window_padding = {
		bottom = 0,
	},
}
