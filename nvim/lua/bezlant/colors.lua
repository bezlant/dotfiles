require('lualine').setup {
    options = {
        theme = 'dracula-nvim'
    }
}

vim.cmd [[ colorscheme dracula ]]
vim.highlight.create("Pmenu", { guibg = "None" }, false)

