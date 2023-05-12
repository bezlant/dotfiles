local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
	vim.notify('Telescope is not installed or has problems in config:(')
	return
end

local actions = require('telescope.actions')

telescope.setup({
	defaults = {
		file_ignore_patterns = {
			'.git/',
			'.cache',
			'*/build/**',
			'dist',
			'node_modules',
			'package-lock.json',
		},
		prompt_prefix = ' ',
		selection_caret = ' ',
		path_display = { 'smart' },

		mappings = {
			i = {
				['<C-n>'] = actions.cycle_history_next,
				['<C-p>'] = actions.cycle_history_prev,

				['<C-j>'] = actions.move_selection_next,
				['<C-k>'] = actions.move_selection_previous,

				['<C-c>'] = actions.close,

				['<Down>'] = actions.move_selection_next,
				['<Up>'] = actions.move_selection_previous,

				['<CR>'] = actions.select_default,
				['<C-x>'] = actions.select_horizontal,
				['<C-v>'] = actions.select_vertical,
				['<C-t>'] = actions.select_tab,

				['<C-u>'] = actions.preview_scrolling_up,
				['<C-d>'] = actions.preview_scrolling_down,

				['<PageUp>'] = actions.results_scrolling_up,
				['<PageDown>'] = actions.results_scrolling_down,

				['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
				['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
				['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
				['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
				['<C-l>'] = actions.complete_tag,
				['<C-_>'] = actions.which_key, -- keys from pressing <C-/>
			},

			n = {
				['<esc>'] = actions.close,
				['<CR>'] = actions.select_default,
				['<C-x>'] = actions.select_horizontal,
				['<C-v>'] = actions.select_vertical,
				['<C-t>'] = actions.select_tab,

				['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
				['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
				['<M-q>'] = actions.send_to_qflist + actions.open_qflist,
				['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,

				['j'] = actions.move_selection_next,
				['k'] = actions.move_selection_previous,
				['H'] = actions.move_to_top,
				['M'] = actions.move_to_middle,
				['L'] = actions.move_to_bottom,

				['<Down>'] = actions.move_selection_next,
				['<Up>'] = actions.move_selection_previous,
				['gg'] = actions.move_to_top,
				['G'] = actions.move_to_bottom,

				['<C-u>'] = actions.preview_scrolling_up,
				['<C-d>'] = actions.preview_scrolling_down,

				['<PageUp>'] = actions.results_scrolling_up,
				['<PageDown>'] = actions.results_scrolling_down,

				['?'] = actions.which_key,
			},
		},
	},
	extensions = {
		media_files = {
			filetypes = { 'png', 'webp', 'jpg', 'jpeg', 'svg' },
			find_cmd = 'rg',
		},
	},
})

-- Extensions
telescope.load_extension('dap')
telescope.load_extension('yank_history')
telescope.load_extension('luasnip')
telescope.load_extension('refactoring')
telescope.load_extension('media_files')
