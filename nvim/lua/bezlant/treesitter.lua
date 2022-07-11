local configs = require("nvim-treesitter.configs")
configs.setup {
ensure_installed = { "c", "lua", "cpp", "go" },
    sync_install = false,
    ignore_install = { "" }, -- Parsers to ignore
    auto_install = true,
    highlight = {
        enable = true, -- False to disable treesitter
        disable = { "" }, -- Languages to disable
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
}
