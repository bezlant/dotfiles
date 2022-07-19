local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok then
	vim.notify("Can't load the cmp_nvim_lsp plugin! :(")
	return
end

local M = {}
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.offsetEncoding = { "utf-16" }
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = false,
		signs = { active = signs },
		severity_sort = true,
		virtual_text = false,
		update_in_insert = false,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	})
end

local map = function(key, command)
	vim.keymap.set("n", key, command, { buffer = 0 })
end

local function lsp_keymaps()
	map("K", vim.lsp.buf.hover)
	map("gd", vim.lsp.buf.definition)
	map("<leader>dj", vim.diagnostic.goto_next)
	map("<leader>dk", vim.diagnostic.goto_prev)
	map("<leader>dt", "<cmd>Telescope diagnostics<CR>")
	map("<leader>r", vim.lsp.buf.rename)
	map("<leader>a", vim.lsp.buf.code_action)
	map("<leader>w", "<cmd>lua vim.lsp.buf.format()<CR> <cmd>lua vim.api.nvim_command('write')<CR>")
end

M.on_attach = function()
	lsp_keymaps()
end

return M
