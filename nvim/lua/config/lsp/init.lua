local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	vim.notify("can't load Mason plugin :(")
	return
end

local lps_installer_ok, lsp_installer = pcall(require, "mason-lspconfig")
if not lps_installer_ok then
	vim.notify("can't load nvim-lsp-installer plugin :(")
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local servers = {
	"gopls",
	"sumneko_lua",
	"clangd",
	"bashls",
	"cmake",
	"marksman",
	"omnisharp",
	"jsonls",
	"cssls",
	"tailwindcss",
	"html",
	"tsserver",
	"eslint",
	"yamlls",
	"solc",
}

lsp_installer.setup({
	automatic_installation = true,
	ensure_installed = servers,
})

local lsp_config_ok, lspconfig = pcall(require, "lspconfig")
if not lsp_config_ok then
	vim.notify("can't load lspconfig plugin :(")
	return
end

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("config.lsp.handlers").on_attach,
		capabilities = require("config.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local has_custom_opts, custom_opts = pcall(require, "config.lsp.settings." .. server)

	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", custom_opts, opts)
	end

	lspconfig[server].setup(opts)
end

require("config.lsp.handlers").setup()
require("config.lsp.null-ls")
