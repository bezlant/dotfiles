local options = {
	backup = false,
	cmdheight = 1,
	completeopt = { 'menu', 'menuone', 'noselect' },
	sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal',
	conceallevel = 0,
	cursorline = true,
	expandtab = true,
	fileencoding = 'utf-8',
	guifont = 'monospace:h17',
	hlsearch = true,
	ignorecase = true,
	infercase = true,
	number = true,
	numberwidth = 2,
	pumheight = 5,
	relativenumber = true,
	scrolloff = 6,
	shiftwidth = 4,
	showmode = false,
	showtabline = 1,
	sidescrolloff = 6,
	signcolumn = 'yes',
	smartcase = true,
	smartindent = true,
	autoindent = true,
	swapfile = false,
	tabstop = 4,
	termguicolors = true,
	timeoutlen = 300,
	undofile = true,
	updatetime = 50,
	wrap = true,
	writebackup = false,
	splitbelow = true,
	splitright = true,
	incsearch = true,
	linebreak = true,
	foldmarker = '{,}',
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

-- Folding with tresitter
vim.cmd([[ set foldmethod=expr ]])
vim.cmd([[ set foldexpr=nvim_treesitter#foldexpr() ]])

vim.cmd([[ set backspace=eol,start,indent]])

-- Remove useless messages in statusline
vim.cmd([[ set shortmess+=c ]])

-- Buffer behavior
vim.cmd([[ set switchbuf=useopen,uselast,usetab ]])

-- Mouse for the normies
vim.cmd([[set mouse=a]])

-- Autocommands
-- Return to the previous location in the file on open
vim.api.nvim_create_autocmd(
	'BufReadPost',
	{ command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]] }
)

-- Autoread buffer on an external change
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, { command = 'checktime' })

-- Easily close useless buffers
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'sqls_output', 'help', 'startuptime', 'qf', 'lspinfo', 'httpRequest' },
	command = [[ nnoremap <buffer><silent> q :close<CR> ]],
})

vim.api.nvim_create_autocmd('FileType', { pattern = { 'man' }, command = [[ nnoremap <buffer><silent> q :quit<CR> ]] })

-- Fix that god damn formatoptions (for some reason have to do it on every BufEnter)
-- Prevent annoying comment continuation when inserting a new line with 'O'
vim.api.nvim_create_autocmd('BufEnter', {
	command = 'set formatoptions-=cro',
})
