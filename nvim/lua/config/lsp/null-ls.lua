local ok, null_ls = pcall(require, "null-ls")
if not ok then
	vim.notify("Can't load null-ls, please install it")
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.stylua,
		formatting.shfmt,
		formatting.goimports,
		formatting.prettierd,
		formatting.sqlfluff.with({
			extra_args = { "--dialect", "postgres" },
		}),
		diagnostics.shellcheck,
		diagnostics.cppcheck.with({
			-- method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
			extra_args = {
				"--enable=style,performance,portability,warning",
				"--std=c++",
			},
		}),
		diagnostics.golangci_lint,
	},
})
