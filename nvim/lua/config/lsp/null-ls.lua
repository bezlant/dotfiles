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
		formatting.clang_format,
		formatting.stylua,
		formatting.shfmt,
		diagnostics.shellcheck,
		diagnostics.cppcheck,
	},
})
