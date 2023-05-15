local status_ok, go = pcall(require, 'go')
if not status_ok then
	vim.notify("Go plugin couldn't load!")
	return
end

go.setup()
