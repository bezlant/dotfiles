local ok, toggleterm = pcall(require, 'toggleterm')
if not ok then
	vim.notify("Can't load toggleterm plugin, please install")
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	persist_mode = false,
	direction = 'float',
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = 'curved',
		winblend = 0,
		highlights = {
			border = 'Normal',
			background = 'Normal',
		},
	},
})

local bufmap = function(key, command)
	vim.api.nvim_buf_set_keymap(0, 't', key, command, { noremap = true })
end

function _G.set_terminal_keymaps()
	bufmap('<esc><esc>', [[<C-\><C-n>]])
	bufmap('<C-h>', [[<C-\><C-n><C-W>h]])
	bufmap('<C-j>', [[<C-\><C-n><C-W>j]])
	bufmap('<C-k>', [[<C-\><C-n><C-W>k]])
	bufmap('<C-l>', [[<C-\><C-n><C-W>l]])
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

vim.api.nvim_set_keymap('', '<leader>g', '<cmd>lua _LAZYGIT_TOGGLE()<CR>', { noremap = true, silent = true })
