local ok, neogen = pcall(require, "neogen")
if not ok then
	vim.notify("Can't load neogen, please install")
	return
end

local map = require("config.utils").map
map("n", "<leader>n", "<cmd>Neogen func<cr>", { noremap = true })

neogen.setup({
	snippet_engine = "luasnip",
})
