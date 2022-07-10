-- map(mode, key, command, options)
local map = require("bezlant.utils").map
local opts = { noremap = true }

-- Leader
map("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Easier window 
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Explorer
map("n", "<leader>e", ":Lex 30<cr>", opts)

-- Buffer navigation
map("n", "<leader>h", ":bprevious<cr>", opts)
map("n", "<leader>l", ":bnext<cr>", opts)

-- Quick escape 
map("i", "jk", "<ESC>", opts) 

-- Visual --
-- Moving text
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Visual block
map("x", "J", ":m '>+1<CR>gv=gv", opts)
map("x", "K", ":m '<-2<CR>gv=gv", opts)
map("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Don't copy on paste
map("v", "p", "\"_dP", opts)

-- Terminal navigation improved
map("t", "<C-h>", "<C-\\><C-N><C-w>h", {})
map("t", "<C-j>", "<C-\\><C-N><C-w>j", {})
map("t", "<C-k>", "<C-\\><C-N><C-w>k", {})
map("t", "<C-l>", "<C-\\<C-N><C-w>l", {})
