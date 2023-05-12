local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
	vim.notify("Can't load bufferline :(")
	return
end

bufferline.setup({
	options = {
		numbers = 'ordinal',
		themable = true,
		close_command = 'Bdelete! %d',
		show_close_icon = false,
		show_buffer_close_icons = false,
		modified_icon = '*',
		tab_size = 15,
		max_name_length = 18,
		always_show_bufferline = true,
		separator_style = 'thin',
		enforce_regular_tabs = false,
	},
	highlights = {
		buffer_selected = {
			bold = true,
			italic = true,
		},
	},
})
