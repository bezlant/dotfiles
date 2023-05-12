local status_ok, relative_toggle = pcall(require, 'relative-toggle')
if not status_ok then
	vim.notify('Relative_toggle is not installed')
	return
end

relative_toggle.setup({
	pattern = '*',
	events = {
		on = { 'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter', 'CmdlineLeave' },
		off = { 'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave', 'CmdlineEnter' },
	},
})
