local status_ok, utils = pcall(require, 'config.utils')
if not status_ok then
	vim.notify('Utils not found, check if the file exits in config/utils!')
	return
end

-- map(mode, key, command, options)
local map = utils.map
local opts = { noremap = true }

-- Leader
vim.g.mapleader = ','

-- Disable arrow keys
map({ 'n', 'i', 'v' }, '<Up>', '<Nop>', opts)
map({ 'n', 'i', 'v' }, '<S-Up>', '<Nop>', opts)
map({ 'n', 'i', 'v' }, '<Down>', '<Nop>', opts)
map({ 'n', 'i', 'v' }, '<S-Down>', '<Nop>', opts)
map({ 'n', 'i', 'v' }, '<Left>', '<Nop>', opts)
map({ 'n', 'i', 'v' }, '<S-Left>', '<Nop>', opts)
map({ 'n', 'i', 'v' }, '<Right>', '<Nop>', opts)
map({ 'n', 'i', 'v' }, '<S-Right>', '<Nop>', opts)

-- Easier pane navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Quick escape
map('i', 'jk', '<ESC>', opts)

-- Visual --
-- Moving text
map('v', '<A-j>', "<cmd>m '>+1<CR>gv=gv", opts)
map('v', '<A-k>', "<cmd>m '<-2<CR>gv=gv", opts)

-- Visual block
map('x', 'J', ":move '>+1<CR>gv-gv", opts)
map('x', 'K', ":move '<-2<CR>gv-gv", opts)
map('x', '<A-j>', "<cmd>m '>+1<CR>gv=gv", opts)
map('x', '<A-k>', "<cmd>m '<-2<CR>gv=gv", opts)

-- Map global register to '|'
map({ 'n', 'v' }, '"|', '"+', opts)

-- Bbye & Buffers
map('n', '<leader>bd', '<cmd>Bdelete! %<CR>', opts)
map('n', '<leader>h', '<cmd>bprevious<cr>zz', opts)
map('n', '<leader>l', '<cmd>bnext<cr>zz', opts)
map('n', '<leader>ba', '<cmd>bufdo :Bdelete<CR>', opts)
map('n', '<leader>bo', '<cmd>%bd|e#|bd#<CR>', opts)

-- Tabs
map('n', '<leader>tn', '<cmd>tabnew<cr>', opts)
map('n', '<leader>to', '<cmd>tabonly<cr>', opts)
map('n', '<leader>tc', '<cmd>tabclose<cr>', opts)
map('n', '<leader>tm', '<cmd>tabmove<cr>', opts)
map('n', '<leader>t<leader>', '<cmd>tabnext<cr>zz', opts)

-- Custom
-- Save on leader + w
map('n', '<leader>w', '<cmd>w<CR>', opts)

-- Highligts off
map('n', '<leader><CR>', '<cmd>noh<CR>', opts)

-- Jump to the first non blanck character
map('n', '0', '^', opts)

-- Stop yanking the damn '\n' (Yanky.nvim does it by default)
-- map("n", "Y", "yg$", opts)

-- Scrolling improved (Neoscroll fixes this)
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)

-- Easy yank to the system clipboard
map({ 'n', 'v' }, '<leader>y', '"+y', opts)

-- Easy paste from the system clipboard
map({ 'n', 'v' }, '<leader>p', '"+p', opts)
map({ 'n', 'v' }, '<leader>P', '"+P', opts)

-- You need this
map('n', '<leader>x', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', opts)

-- Search improved
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)

-- Get to the current folder
map('n', '<leader>cd', '<cmd>cd %:p:h<cr><cmd>:pwd<cr>', opts)

-- Plugins config
-- Telescope
map(
	'n',
	'<C-f>',
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({ previewer = false, layout_config = { height = 0.2 }}))<cr>",
	opts
)

map('n', '<leader>ff', '<cmd>Telescope find_files hidden=true<cr>', opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
map('n', '<leader>fm', '<cmd>Telescope man_pages<cr>', opts)
map('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', opts)
map('n', '<leader>ft', '<cmd>TodoTelescope<cr>', opts)
map('n', '<leader>fs', '<cmd>Telescope luasnip<cr>', opts)
map('n', '<leader>fy', '<cmd>Telescope yank_history<cr>', opts)
map('n', '<leader>fo', '<cmd>Telescope vim_options<cr>', opts)
map('n', '<leader>fi', '<cmd>Telescope media_files<cr>', opts)

-- NvimTree
map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', opts)

-- Vimgrep, grep, quickfix list, jump list cycle
map('n', '<leader>o', '<cmd>copen<CR>', opts)
map('n', '<leader>cn', '<cmd>cnext<CR>', opts)
map('n', '<leader>cp', '<cmd>cprev<CR>', opts)

-- Bufferline shortcuts
map('n', '<leader>1', "<cmd>lua require('bufferline').go_to_buffer(1, true)<cr>", opts)
map('n', '<leader>2', "<cmd>lua require('bufferline').go_to_buffer(2, true)<cr>", opts)
map('n', '<leader>3', "<cmd>lua require('bufferline').go_to_buffer(3, true)<cr>", opts)
map('n', '<leader>4', "<cmd>lua require('bufferline').go_to_buffer(4, true)<cr>", opts)
map('n', '<leader>5', "<cmd>lua require('bufferline').go_to_buffer(5, true)<cr>", opts)
map('n', '<leader>6', "<cmd>lua require('bufferline').go_to_buffer(6, true)<cr>", opts)
map('n', '<leader>7', "<cmd>lua require('bufferline').go_to_buffer(7, true)<cr>", opts)
map('n', '<leader>8', "<cmd>lua require('bufferline').go_to_buffer(8, true)<cr>", opts)
map('n', '<leader>9', "<cmd>lua require('bufferline').go_to_buffer(9, true)<cr>", opts)
map('n', '<leader>$', "<cmd>lua require('bufferline').go_to_buffer(-1, true)<cr>", opts)

-- Yanky
map('x', 'y', '<Plug>(YankyYank)', {})
map('n', 'y', '<Plug>(YankyYank)', {})
map('n', 'y', '<Plug>(YankyYank)', {})
map('n', 'p', '<Plug>(YankyPutAfter)', {})
map('n', 'p', '<Plug>(YankyPutAfter)', {})
map('n', 'P', '<Plug>(YankyPutBefore)', {})
map('x', 'p', '<Plug>(YankyPutAfter)', {})
map('x', 'P', '<Plug>(YankyPutBefore)', {})
map('n', 'gp', '<Plug>(YankyGPutAfter)', {})
map('n', 'gP', '<Plug>(YankyGPutBefore)', {})
map('x', 'gp', '<Plug>(YankyGPutAfter)', {})
map('x', 'gP', '<Plug>(YankyGPutBefore)', {})
map('n', '<c-p>', '<Plug>(YankyCycleForward)', {})
map('n', '<c-n>', '<Plug>(YankyCycleBackward)', {})

-- DAP
map('n', '<leader>bb', "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
map('n', '<leader>bl', "<cmd>lua require'dap'.list_breakpoints()<cr>", opts)
map('n', '<leader>bc', "<cmd>lua require'dap'.clear_breakpoints()<cr>", opts)
map('n', '<leader>B', "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
map('n', '<leader>si', "<cmd>lua require'dap'.step_into()<cr>", opts)
map('n', '<leader>ss', "<cmd>lua require'dap'.step_over()<cr>", opts)
map('n', '<leader>so', "<cmd>lua require'dap'.step_out()<cr>", opts)
map('n', '<leader>sb', "<cmd>lua require'dap'.step_back()<cr>", opts)
map('n', '<leader>co', "<cmd>lua require'dap'.continue()<cr>", opts)
map('n', '<leader>cl', "<cmd>lua require'dap'.terminate()<cr>", opts)
map('n', '<leader>\\', "<cmd>lua require'dapui'.toggle()<cr>", opts)

-- Neogen (Doxxygen)
map('n', '<leader>n', '<cmd>Neogen func<cr>', opts)
