local typescript = require('typescript')

typescript.setup({
	disable_commands = false, -- prevent the plugin from creating Vim commands
	debug = false, -- enable debug logging for commands
	go_to_source_definition = {
		fallback = true, -- fall back to standard LSP definition on failure
	},
	server = { -- pass options to lspconfig's setup method
		on_attach = require('config.lsp.handlers').on_attach,
		capabilities = require('config.lsp.handlers').capabilities,
		settings = {
			init_options = {
				preferences = {
					disableSuggestions = false,
					quotePreference = 'single',
					importModuleSpecifier = 'non-relative',
				},
			},
		},
	},
})
