local options = {
	backup = false,
	cmdheight = 1,
	completeopt = { "menuone", "noselect" },
	conceallevel = 0,
	expandtab = true,
	fileencoding = "utf-8",
	guifont = "monospace:h17",
	hlsearch = true,
	ignorecase = true,
	number = true,
	numberwidth = 2,
	pumheight = 10,
	relativenumber = true,
	scrolloff = 8,
	shiftwidth = 4,
	showmode = false,
	showtabline = 1,
	sidescrolloff = 8,
	signcolumn = "yes",
	smartcase = true,
	smartindent = true,
	swapfile = false,
	tabstop = 4,
	termguicolors = true,
	timeoutlen = 1000,
	undofile = true,
	updatetime = 300,
	wrap = true,
	writebackup = false,
    splitbelow = true,
    splitright = true,
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

vim.cmd [[ set whichwrap+=<,>,[,],h,l ]]
vim.cmd [[ set formatoptions-=cro ]]
vim.cmd [[ set foldmethod=expr ]]
vim.cmd [[ set foldexpr=nvim_treesitter#foldexpr() ]]
