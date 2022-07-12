-- All the wrapper functions
local M = {}

function M.map(mode, key, command, opts)
    local options = { silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, key, command, options)
end

return M
