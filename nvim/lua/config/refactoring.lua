local status_ok, refactoring = pcall(require, 'refactoring')
if not status_ok then
	vim.notify('Telescope is not installed or has problems in config:(')
	return
end

refactoring.setup({
	prompt_func_return_type = {
		typescript = true,
		javascript = true,
		go = true,
		java = true,
		cpp = true,
		c = true,
		h = true,
		hpp = true,
		cxx = true,
	},
	prompt_func_param_type = {
		typescript = true,
		javascript = true,
		go = true,
		java = true,
		cpp = true,
		c = true,
		h = true,
		hpp = true,
		cxx = true,
	},
	printf_statements = {},
	print_var_statements = {},
})
