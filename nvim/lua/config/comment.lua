local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	vim.notify("Comment plugin couldn't load!")
	return
end

comment.setup({
	---Add a space b/w comment and the line
	padding = true,
	---Whether the cursor should stay at its position
	sticky = true,
	---Lines to be ignored while (un)comment
	ignore = nil,
	---LHS of toggle mappings in NORMAL mode
	toggler = {
		---Line-comment toggle keymap
		line = "gbc",
		---Block-comment toggle keymap
		block = "gcc",
	},
	---LHS of operator-pending mappings in NORMAL and VISUAL mode
	opleader = {
		---Line-comment keymap
		line = "gb",
		---Block-comment keymap
		block = "gc",
	},
	---LHS of extra mappings
	extra = {
		---Add comment on the line above
		above = "gcO",
		---Add comment on the line below
		below = "gco",
		---Add comment at the end of line
		eol = "gcA",
	},
	---Enable keybindings
	---NOTE: If given `false` then the plugin won't create any mappings
	mappings = {
		---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
		basic = true,
		---Extra mapping; `gco`, `gcO`, `gcA`
		extra = true,
	},
	---Function to call before (un)comment
	pre_hook = nil,
	---Function to call after (un)comment
	post_hook = nil,
})

local ft_status_ok, ft = pcall(require, "Comment.ft")
if not ft_status_ok then
	vim.notify("Comment.ft couldn't load!")
	return
end

-- 1. Using set function

ft
	-- Set both line and block commentstring
	.set("yaml", { "#%s", "#%s" })
	.set("javascript", { "/*%s*/", "{/*%s*/}" })
	.set("typescriptreact", { "/*%s*/", "{/*%s*/}" })

-- Multiple filetypes
ft({ "go", "rust" }, ft.get("c"))
ft({ "toml", "graphql" }, "#%s")
