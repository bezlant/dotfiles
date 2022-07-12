local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("Lspconfig can't be loaded :(")
    return
end

require "config.lsp.configs"
require("config.lsp.handlers").setup()
