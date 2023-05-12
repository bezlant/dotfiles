local status_ok, surround = pcall(require, 'nvim-surround')
if not status_ok then
	vim.notify("Can't load nvim-surround")
end

surround.setup()
