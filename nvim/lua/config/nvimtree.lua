local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
    vim.notify("Can't load nvim-tree")
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    vim.notify("Can't load nvim-tree-config")
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvimtree.setup({
    auto_reload_on_write = true,

    view = {
        adaptive_size = true,
        mappings = {
            custom_only = false,
            list = {
                { key = "v", cb = tree_cb "vsplit" },
            },
        },
    },

    renderer = {
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                },
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    deleted = "",
                    untracked = "U",
                    ignored = "◌",
                },
            },
        },
    },

    filters = {
        dotfiles = true,
    },
})
