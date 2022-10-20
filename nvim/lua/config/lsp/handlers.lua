local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok then
	vim.notify("Can't load the cmp_nvim_lsp plugin! :(")
	return
end

local border_opts = {
	focusable = false,
	style = "minimal",
	border = "rounded",
	source = "always",
	header = "",
	prefix = "",
	scope = "line",
}

vim.diagnostic.config({ virtual_text = false, underline = false, update_in_insert = false, float = border_opts })

local M = {}
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.offsetEncoding = { "utf-16" }
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

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

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, border_opts)

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, border_opts)

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		signs = { active = signs },
		severity_sort = true,
	})
end

local map = function(key, command)
	vim.keymap.set("n", key, command, { buffer = 0 })
end

local function lsp_keymaps()
	map("K", vim.lsp.buf.hover)
	map("<leader>v", vim.lsp.buf.signature_help)
	map("gd", vim.lsp.buf.definition)
	map("gr", "<cmd>Telescope lsp_references<cr>")
	map("gi", "<cmd>Telescope lsp_implementations<cr>")
	map("<leader>j", vim.diagnostic.goto_next)
	map("<leader>k", vim.diagnostic.goto_prev)
	map("<leader>dt", "<cmd>Telescope diagnostics<CR>")
	map("<leader>r", vim.lsp.buf.rename)
	map("<leader>a", vim.lsp.buf.code_action)
	map("<leader>ds", require("telescope.builtin").lsp_document_symbols)
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

M.on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
		})
	end
	lsp_keymaps()
end

return M
