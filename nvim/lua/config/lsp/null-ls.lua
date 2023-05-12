local ok, null_ls = pcall(require, 'null-ls')
if not ok then
	vim.notify("Can't load null-ls, please install it")
	return
end

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		require('typescript.extensions.null-ls.code-actions'),
		formatting.stylua,
		formatting.shfmt,
		formatting.goimports,
		formatting.prettierd,
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
		diagnostics.golangci_lint,
	},
	on_attach = function(client, bufnr)
		if client.supports_method('textDocument/formatting') then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 2000 })
				end,
			})
		end
	end,
})
