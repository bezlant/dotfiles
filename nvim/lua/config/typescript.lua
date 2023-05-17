local handlers = require('config.lsp.handlers')

require('typescript').setup({
	disable_commands = false,
	debug = false,
	go_to_source_definition = {
		fallback = true,
	},
	server = {
		on_attach = handlers.on_attach,
		capabilities = handlers.capabilities,
		settings = {
			init_options = {
				preferences = {
					disableSuggestions = false,
					quotePreference = 'auto',
					importModuleSpecifier = 'non-relative',
				},
			},
		},
	},
})
