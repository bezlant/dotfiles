local ok, neogen = pcall(require, 'neogen')
if not ok then
	vim.notify("Can't load neogen, please install")
	return
end

neogen.setup({
	snippet_engine = 'luasnip',
})
