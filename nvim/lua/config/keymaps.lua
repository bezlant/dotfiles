local status_ok, utils = pcall(require, "config.utils")
if not status_ok then
	vim.notify("Utils not found, check if the file exits in config/utils!")
	return
end

-- map(mode, key, command, options)
local map = utils.map
local opts = { noremap = true }

-- Leader
vim.g.mapleader = ","

-- Disable arrow keys
map("n", "<Up>", "<Nop>", opts)
map("n", "<S-Up>", "<Nop>", opts)
map("n", "<Down>", "<Nop>", opts)
map("n", "<S-Down>", "<Nop>", opts)
map("n", "<Left>", "<Nop>", opts)
map("n", "<S-Left>", "<Nop>", opts)
map("n", "<Right>", "<Nop>", opts)
map("n", "<S-Right>", "<Nop>", opts)

map("i", "<Up>", "<Nop>", opts)
map("i", "<S-Up>", "<Nop>", opts)
map("i", "<Down>", "<Nop>", opts)
map("i", "<S-Down>", "<Nop>", opts)
map("i", "<Left>", "<Nop>", opts)
map("i", "<S-Left>", "<Nop>", opts)
map("i", "<Right>", "<Nop>", opts)
map("i", "<S-Right>", "<Nop>", opts)

map("v", "<Up>", "<Nop>", opts)
map("v", "<S-Up>", "<Nop>", opts)
map("v", "<Down>", "<Nop>", opts)
map("v", "<S-Down>", "<Nop>", opts)
map("v", "<Left>", "<Nop>", opts)
map("v", "<S-Left>", "<Nop>", opts)
map("v", "<Right>", "<Nop>", opts)
map("v", "<S-Right>", "<Nop>", opts)

-- Easier pane navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Quick escape
map("i", "jk", "<ESC>", opts)

-- Visual --
-- Moving text
map("v", "<A-j>", "<cmd>m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", "<cmd>m '<-2<CR>gv=gv", opts)

-- Visual block
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "<A-j>", "<cmd>m '>+1<CR>gv=gv", opts)
map("x", "<A-k>", "<cmd>m '<-2<CR>gv=gv", opts)

-- Map global register to '|'
map("n", '"|', '"+', opts)

-- Bbye & Buffers
map("n", "<leader>bd", "<cmd>Bdelete! %<CR>", opts)
map("n", "<leader>h", "<cmd>bprevious<cr>zt", opts)
map("n", "<leader>l", "<cmd>bnext<cr>zt", opts)
map("n", "<leader>ba", "<cmd>bufdo :Bdelete<CR>", opts)
map("n", "<leader>bo", "<cmd>%bd|e#|bd#<CR>", opts)

-- Tabs
map("n", "<leader>tn", "<cmd>tabnew<cr>", opts)
map("n", "<leader>to", "<cmd>tabonly<cr>", opts)
map("n", "<leader>tc", "<cmd>tabclose<cr>", opts)
map("n", "<leader>tm", "<cmd>tabmove<cr>", opts)
map("n", "<leader>t<leader>", "<cmd>tabnext<cr>zt", opts)

-- Custom
-- Save on leader + w
map("n", "<leader>w", "<cmd>w<CR>", opts)

-- Highligts off
map("n", "<leader><CR>", "<cmd>noh<CR>", opts)

-- Jump to the first non blanck character
map("n", "0", "^", opts)

-- Stop yanking the damn '\n' (Yanky.nvim does it by default)
-- map("n", "Y", "yg$", opts)

-- Scrolling improved (Neoscroll fixes this)
map("n", "<C-d>", "<C-d>zt", opts)
map("n", "<C-u>", "<C-u>zt", opts)

-- Easy yank to the system clipboard
map("n", "<leader>y", '"+y', opts)
map("v", "<leader>y", '"+y', opts)

-- Easy paste from the system clipboard
map("n", "<leader>p", '"+p', opts)
map("v", "<leader>p", '"+p', opts)
map("n", "<leader>P", '"+P', opts)
map("v", "<leader>P", '"+P', opts)

-- You need this
map("n", "<leader>x", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", opts)

-- Search improved
map("n", "n", "nztzv", opts)
map("n", "N", "Nztzv", opts)

-- Get to the current folder
map("n", "<leader>cd", "<cmd>cd %:p:h<cr><cmd>:pwd<cr>", opts)

-- Plugins config
-- Telescope
map(
	"n",
	"<C-f>",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({ previewer = false, layout_config = { height = 0.2 }}))<cr>",
	opts
)

map(
	"n",
	"<leader>f",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({ previewer = false, layout_config = { height = 0.2 }}))<cr>",
	opts
)

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
map("n", "<leader>fm", "<cmd>Telescope man_pages<cr>", opts)
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", opts)
map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", opts)
map("n", "<leader>fs", "<cmd>Telescope luasnip<cr>", opts)
map("n", "<leader>fy", "<cmd>Telescope yank_history<cr>", opts)
map("v", "<leader>fr", "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", { noremap = true })

-- NvimTree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

-- Vimgrep, grep, quickfix list, jump list cycle
map("n", "<leader>o", "<cmd>copen<CR>", opts)
map("n", "<leader>cn", "<cmd>cnext<CR>", opts)
map("n", "<leader>cp", "<cmd>cprev<CR>", opts)

-- Bufferline shortcuts
map("n", "<leader>1", "<cmd>lua require('bufferline').go_to_buffer(1, true)<cr>", opts)
map("n", "<leader>2", "<cmd>lua require('bufferline').go_to_buffer(2, true)<cr>", opts)
map("n", "<leader>3", "<cmd>lua require('bufferline').go_to_buffer(3, true)<cr>", opts)
map("n", "<leader>4", "<cmd>lua require('bufferline').go_to_buffer(4, true)<cr>", opts)
map("n", "<leader>5", "<cmd>lua require('bufferline').go_to_buffer(5, true)<cr>", opts)
map("n", "<leader>6", "<cmd>lua require('bufferline').go_to_buffer(6, true)<cr>", opts)
map("n", "<leader>7", "<cmd>lua require('bufferline').go_to_buffer(7, true)<cr>", opts)
map("n", "<leader>8", "<cmd>lua require('bufferline').go_to_buffer(8, true)<cr>", opts)
map("n", "<leader>9", "<cmd>lua require('bufferline').go_to_buffer(9, true)<cr>", opts)
map("n", "<leader>$", "<cmd>lua require('bufferline').go_to_buffer(-1, true)<cr>", opts)

-- Zen
map("n", "<leader>z", "<cmd>TZAtaraxis<CR>", opts)

-- Yanky
map("x", "y", "<Plug>(YankyYank)", {})
map("n", "y", "<Plug>(YankyYank)", {})
map("n", "y", "<Plug>(YankyYank)", {})
map("n", "p", "<Plug>(YankyPutAfter)", {})
map("n", "p", "<Plug>(YankyPutAfter)", {})
map("n", "P", "<Plug>(YankyPutBefore)", {})
map("x", "p", "<Plug>(YankyPutAfter)", {})
map("x", "P", "<Plug>(YankyPutBefore)", {})
map("n", "gp", "<Plug>(YankyGPutAfter)", {})
map("n", "gP", "<Plug>(YankyGPutBefore)", {})
map("x", "gp", "<Plug>(YankyGPutAfter)", {})
map("x", "gP", "<Plug>(YankyGPutBefore)", {})
map("n", "<c-p>", "<Plug>(YankyCycleForward)", {})
map("n", "<c-n>", "<Plug>(YankyCycleBackward)", {})

-- DAP
map("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
map("n", "<leader>bl", "<cmd>lua require'dap'.list_breakpoints()<cr>", opts)
map("n", "<leader>bc", "<cmd>lua require'dap'.clear_breakpoints()<cr>", opts)
map("n", "<leader>B", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
map("n", "<leader>si", "<cmd>lua require'dap'.step_into()<cr>", opts)
map("n", "<leader>ss", "<cmd>lua require'dap'.step_over()<cr>", opts)
map("n", "<leader>so", "<cmd>lua require'dap'.step_out()<cr>", opts)
map("n", "<leader>sb", "<cmd>lua require'dap'.step_back()<cr>", opts)
map("n", "<leader>co", "<cmd>lua require'dap'.continue()<cr>", opts)
map("n", "<leader>cl", "<cmd>lua require'dap'.terminate()<cr>", opts)
map("n", "<leader>\\", "<cmd>lua require'dapui'.toggle()<cr>", opts)

-- Neogen (Doxxygen)
map("n", "<leader>n", "<cmd>Neogen func<cr>", opts)

-- Refactoring-- Remaps for the refactoring operations currently offered by the plugin
map(
	"v",
	"<leader>re",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
map(
	"v",
	"<leader>rf",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
map(
	"v",
	"<leader>rv",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
map(
	"v",
	"<leader>ri",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
	{ noremap = true, silent = true, expr = false }
)

-- Extract block doesn't need visual mode
map(
	"n",
	"<leader>rb",
	[[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
	{ noremap = true, silent = true, expr = false }
)

map(
	"n",
	"<leader>rbf",
	[[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]],
	{ noremap = true, silent = true, expr = false }
)

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
map(
	"n",
	"<leader>ri",
	[[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
	{ noremap = true, silent = true, expr = false }
)

-- You can also use below = true here to to change the position of the printf
-- statement (or set two remaps for either one). This remap must be made in normal mode.
map("n", "<leader>rp", ":lua require('refactoring').debug.printf({below = false})<CR>", { noremap = true })

-- Remap in normal mode and passing { normal = true } will automatically find the variable under the cursor and print it
map("n", "<leader>rd", ":lua require('refactoring').debug.print_var({ normal = true })<CR>", { noremap = true })
-- Remap in visual mode will print whatever is in the visual selection
map("v", "<leader>rd", ":lua require('refactoring').debug.print_var({})<CR>", { noremap = true })

-- Cleanup function: this remap should be made in normal mode
map("n", "<leader>rc", ":lua require('refactoring').debug.cleanup({})<CR>", { noremap = true })
