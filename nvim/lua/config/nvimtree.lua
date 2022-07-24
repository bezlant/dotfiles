local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
	vim.notify("Can't load nvim-tree")
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	vim.notify("Can't load nvim-tree-config")
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvimtree.setup({
	auto_reload_on_write = true,
	disable_netrw = true,
	hijack_netrw = true,
	hijack_cursor = true,
	sync_root_with_cwd = true,

	view = {
		adaptive_size = true,
		mappings = {
			custom_only = false,
			list = {
				{ key = "v", cb = tree_cb("vsplit") },
				{ key = "s", cb = tree_cb("split") },
			},
		},
	},

	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},

	update_focused_file = {
		update_cwd = true,
	},

	renderer = {
		add_trailing = false,
		group_empty = true,
		highlight_opened_files = "all",
		root_folder_modifier = ":~",

		indent_markers = {
			enable = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				none = " ",
			},
		},

		icons = {
			webdev_colors = true,
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "U",
					ignored = "◌",
				},
			},
		},
		special_files = {
			"Makefile",
			"build/",
			"CMakeLists.txt",
			"CMakeLists",
		},
	},

	filters = {
		dotfiles = true,
		custom = {
			"^\\.git",
		},
	},
})
