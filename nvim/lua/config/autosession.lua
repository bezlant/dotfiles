local status_ok, autosession = pcall(require, "auto-session")
if not status_ok then
	vim.notify("Auto-session is not installed or has problems in config:(")
	return
end

autosession.setup({
	log_level = "info",
})
