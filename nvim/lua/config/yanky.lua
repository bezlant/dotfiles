local ok, yanky = pcall(require, 'yanky')
if not ok then
	vim.notify("Can't load yanky plugin, please make sure it's installed")
	return
end

yanky.setup({
	highlight = {
		timer = 150,
	},
	preserve_cursor_position = {
		enabled = true,
	},
	system_clipboard = {
		sync_with_ring = false,
	},
})
