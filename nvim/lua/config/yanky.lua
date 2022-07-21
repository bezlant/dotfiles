local ok, yanky = pcall(require, "yanky")
if not ok then
	vim.notify("Can't load yanky plugin, please make sure it's installed")
	return
end

yanky.setup({
	highlight = {
		timer = 150,
	},

	system_clipboard = {
		sync_with_ring = false,
	},
})

-- Keymaps
local map = require("config.utils").map

map("n", "p", "<Plug>(YankyPutAfter)", {})
map("n", "P", "<Plug>(YankyPutBefore)", {})
map("x", "p", "<Plug>(YankyPutAfter)", {})
map("x", "P", "<Plug>(YankyPutBefore)", {})
map("n", "gp", "<Plug>(YankyGPutAfter)", {})
map("n", "gP", "<Plug>(YankyGPutBefore)", {})
map("x", "gp", "<Plug>(YankyGPutAfter)", {})
map("x", "gP", "<Plug>(YankyGPutBefore)", {})
map("n", "<c-n>", "<Plug>(YankyCycleForward)", {})
map("n", "<c-p>", "<Plug>(YankyCycleBackward)", {})
