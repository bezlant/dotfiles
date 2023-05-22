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
	on_attach = function(client, bufnr)
		if client.supports_method('textDocument/formatting') then
			vim.keymap.set('n', '<Leader>f', function()
				vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
			end, { buffer = bufnr, desc = '[lsp] format' })
		end

		if client.supports_method('textDocument/rangeFormatting') then
			vim.keymap.set('x', '<Leader>f', function()
				vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
			end, { buffer = bufnr, desc = '[lsp] format' })
		end
	end,
})

require('prettier').setup({
	bin = 'prettierd',
	filetypes = {
		'css',
		'graphql',
		'html',
		'javascript',
		'javascriptreact',
		'json',
		'less',
		'markdown',
		'scss',
		'typescript',
		'typescriptreact',
		'yaml',
	},
})
