local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("Can't start lspconfig, please check the lsp folder")
    return
end

require("bezlant.lsp.lsp-installer")
require("bezlant.lsp.handlers").setup()
