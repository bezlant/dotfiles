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
-- map("x", "J", "<cmd>m '>+1<CR>gv=gv", opts)
-- map("x", "K", "<cmd>m '<-2<CR>gv=gv", opts)
map("x", "<A-j>", "<cmd>m '>+1<CR>gv=gv", opts)
map("x", "<A-k>", "<cmd>m '<-2<CR>gv=gv", opts)

-- Don't copy on paste
map("v", "p", '"_dP', opts)

-- Map global register to '|'
map("n", '"|', '"+', opts)

-- Bbye & Buffers
map("n", "<leader>bd", "<cmd>Bdelete %<CR>", opts)
map("n", "<leader>h", "<cmd>bprevious<cr>zz", opts)
map("n", "<leader>l", "<cmd>bnext<cr>zz", opts)
map("n", "<leader>ba", "<cmd>bufdo :Bdelete<CR>", opts)

-- Tabs
map("n", "<leader>tn", "<cmd>tabnew<cr>", opts)
map("n", "<leader>to", "<cmd>tabonly<cr>", opts)
map("n", "<leader>tc", "<cmd>tabclose<cr>", opts)
map("n", "<leader>tm", "<cmd>tabmove<cr>", opts)
map("n", "<leader>t<leader>", "<cmd>tabnext<cr>zz", opts)

-- Custom
-- Save on leader + w
map("n", "<leader>w", "<cmd>w<CR>", opts)

-- Source fresh config
map("n", "<leader>c", "<cmd>so<CR>", opts)

-- Highligts off
map("n", "<leader><CR>", "<cmd>noh<CR>", opts)

-- Jump to the first non blanck character
map("n", "0", "^", opts)

-- Stop yanking the damn '\n' (Yanky.nvim does it by default)
-- map("n", "Y", "yg$", opts)

-- Scrolling improved
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Easy yank to the system clipboard
map("n", "<leader>y", '"+y', opts)
map("v", "<leader>y", '"+y', opts)

-- Easy paste from the system clipboard
map("n", "<leader>p", '"+p', opts)
map("v", "<leader>p", '"+p', opts)

-- You need this
map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", opts)

-- Search improved
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

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

-- NvimTree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)
