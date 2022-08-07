local ok, zen = pcall(require, "true-zen")
if not ok then
	vim.notify("Can't load true-zen plugin, please make sure it's installed")
	return
end

local lualine = require("lualine")
local map = require("config.utils").map
map("n", "<leader>z", "<cmd>TZAtaraxis<CR>", { noremap = true })

local tmux_off = function()
	if vim.fn.exists("$TMUX") == 0 then
		return
	end
	vim.cmd([[silent !tmux set status off]])
end

local tmux_on = function()
	if vim.fn.exists("$TMUX") == 0 then
		return
	end
	vim.cmd([[silent !tmux set status on]])
end

local open_cb = function()
	lualine.hide()
	tmux_on()
end

local close_cb = function()
	lualine.hide({ unhide = true })
	tmux_off()
end

zen.setup({
	modes = { -- configurations per mode
		ataraxis = {
			shade = "dark", -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
			backdrop = 0, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
			minimum_writing_area = { -- minimum size of main window
				width = 80,
				height = 44,
			},
			quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
			padding = { -- padding windows
				left = 45,
				right = 45,
				top = 0,
				bottom = 0,
			},
			open_callback = open_cb,
			close_callback = close_cb,
		},
		minimalist = {
			ignored_buf_types = { "nofile" }, -- save current options from any window except ones displaying these kinds of buffers
			options = { -- options to be disabled when entering Minimalist mode
				number = false,
				relativenumber = false,
				showtabline = 0,
				signcolumn = "no",
				statusline = "",
				cmdheight = 1,
				laststatus = 0,
				showcmd = false,
				showmode = false,
				ruler = false,
				numberwidth = 1,
			},
			open_callback = nil, -- run a function when opening Minimalist mode
			close_callback = nil, -- run a function when closing Minimalist mode
		},
		narrow = {
			--- change the style of the fold lines. Set it to:
			--- `informative`: to get nice pre-baked folds
			--- `invisible`: hide them
			--- function() end: pass a custom func with your fold lines. See :h foldtext
			folds_style = "informative",
			run_ataraxis = true, -- display narrowed text in a Ataraxis session
			open_callback = nil, -- run a function when opening Narrow mode
			close_callback = nil, -- run a function when closing Narrow mode
		},
		focus = {
			open_callback = nil, -- run a function when opening Focus mode
			close_callback = nil, -- run a function when closing Focus mode
		},
	},
	integrations = {
		tmux = true, -- hide tmux status bar in (minimalist, ataraxis)
		kitty = { -- increment font size in Kitty. Note: you must set `allow_remote_control socket-only` and `listen_on unix:/tmp/kitty` in your personal config (ataraxis)
			enabled = false,
			font = "+3",
		},
		twilight = false, -- enable twilight (ataraxis)
	},
})
