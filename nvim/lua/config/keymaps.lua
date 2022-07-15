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

-- Easier window
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Quick escape
map("i", "jk", "<ESC>", opts)

-- Visual --
-- Moving text
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Visual block
-- map("x", "J", ":m '>+1<CR>gv=gv", opts)
-- map("x", "K", ":m '<-2<CR>gv=gv", opts)
map("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Don't copy on paste
map("v", "p", "\"_dP", opts)

-- Terminal navigation improved
map("t", "<C-h>", "<C-\\><C-N><C-w>h", {})
map("t", "<C-j>", "<C-\\><C-N><C-w>j", {})
map("t", "<C-k>", "<C-\\><C-N><C-w>k", {})
map("t", "<C-l>", "<C-\\<C-N><C-w>l", {})

-- Map global register to '|'
map("n", "\"|", "\"+", opts)

-- Plugins config
-- Telescope
map("n", "<leader>f",
    "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({ previewer = false }))<cr>",
    opts)

-- NvimTree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Bbye & Buffers
map("n", "<leader>bd", ":Bdelete %<CR>", opts)
map("n", "<leader>h", ":bprevious<cr>", opts)
map("n", "<leader>l", ":bnext<cr>", opts)

-- Custom
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>so", ":so<CR>", opts)
map("n", "<leader><CR>", ":noh<CR>", opts)
