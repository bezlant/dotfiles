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

-- Plugins config
-- Telescope
map(
	"n",
	"<leader>f",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({ previewer = false, layout_config = { height = 0.2 }}))<cr>",
	opts
)

-- NvimTree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

-- Bbye & Buffers
map("n", "<leader>bd", "<cmd>Bdelete %<CR>", opts)
map("n", "<leader>h", "<cmd>bprevious<cr>", opts)
map("n", "<leader>l", "<cmd>bnext<cr>", opts)

-- Custom
map("n", "<leader>w", "<cmd>w<CR>", opts)
map("n", "<leader>so", "<cmd>so<CR>", opts)
map("n", "<leader><CR>", "<cmd>noh<CR>", opts)
