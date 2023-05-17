local lpsconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lpsconfig_ok then
	vim.notify("can't load lspconfig plugin :(")
	return
end

return {
	default_config = {
		cmd = { 'golangci-lint-langserver' },
		root_dir = lspconfig.util.root_pattern('go.mod', '.git'),
		init_options = {
			command = {
				'golangci-lint',
				'run',
				'--fast',
				'--out-format',
				'json',
				'--issues-exit-code=1',
			},
		},
	},
}
