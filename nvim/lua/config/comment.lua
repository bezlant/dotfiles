local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	vim.notify("Comment plugin couldn't load!")
	return
end

comment.setup()
