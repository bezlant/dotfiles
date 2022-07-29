local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	vim.notify("Can't load the lualine plugin :(")
	return
end

lualine.setup({
	options = {
		theme = "dracula-nvim",
		globalstatus = true,
	},
})
