local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	vim.notify("Comment plugin couldn't load!")
	return
end

comment.setup()

local ft_status_ok, ft = pcall(require, "Comment.ft")
if not ft_status_ok then
	vim.notify("Comment.ft couldn't load!")
	return
end

-- 1. Using set function

ft
	-- Set only line comment
	.set("yaml", "#%s")
	-- Or set both line and block commentstring
	.set("javascript", { "{/*%s*/}" })
	.set("typescriptreact", { "{/*%s*/}" })

-- 2. Metatable magic

ft.javascript = { "//%s", "/*%s*/" }
ft.yaml = "#%s"

-- Multiple filetypes
ft({ "go", "rust" }, ft.get("c"))
ft({ "toml", "graphql" }, "#%s")
