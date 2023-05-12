local status_ok, comment = pcall(require, 'Comment')
if not status_ok then
	vim.notify("Comment plugin couldn't load!")
	return
end

comment.setup()

local ft_status_ok, ft = pcall(require, 'Comment.ft')
if not ft_status_ok then
	vim.notify("Comment.ft couldn't load!")
	return
end

ft.set('javascript', { '/*%s*/', '{/*%s*/}' })
	.set('typescriptreact', { '/*%s*/', '{/*%s*/}' })
	.set('yaml', { '#%s', '#%s' })
