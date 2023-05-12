local treesitter_configs = require('nvim-treesitter.configs')

treesitter_configs.setup({
	autotag = {
		enable = true,
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true },
	fold = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<CR>',
			scope_incremental = '<CR>',
			node_incremental = '<TAB>',
			node_decremental = '<S-TAB>',
		},
	},
})

require('treesitter-context').setup({
	mode = 'topline',
	line_numbers = true,
})
