local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = true,
	sources = {
		require('typescript.extensions.null-ls.code-actions'),
		formatting.stylua,
		formatting.shfmt,
		formatting.goimports,
		formatting.sqlfluff.with({
			extra_args = { '--dialect', 'postgres' },
		}),
		diagnostics.sqlfluff.with({
			extra_args = { '--dialect', 'postgres' },
		}),
		diagnostics.shellcheck,
		diagnostics.cppcheck.with({
			method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
			extra_args = {
				'--enable=style,performance,portability,warning',
				'--std=c++',
			},
		}),
	},
})
