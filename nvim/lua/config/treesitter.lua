local configs = require("nvim-treesitter.configs")
configs.setup {
    ensure_installed = { "c", "lua", "cpp", "go" },
    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true, -- False to disable treesitter
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
}
