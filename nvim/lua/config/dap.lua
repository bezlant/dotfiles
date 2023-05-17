local dap_ok, dap = pcall(require, 'dap')
if not dap_ok then
	vim.notify('Dap not found please install it!')
	return
end

-- 
vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = '' })
vim.api.nvim_command("au FileType dap-repl lua require('dap.ext.autocompl').attach()")
dap.set_log_level('TRACE')

local dap_vscode_js_ok, dap_vscode_js = pcall(require, 'dap-vscode-js')
if not dap_vscode_js_ok then
	vim.notify('Dap-vscode-js not found please install it!')
	return
end

-- Dap Setup
dap_vscode_js.setup({
	-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
	-- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
	-- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
	adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
	-- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
	log_file_level = vim.log.levels.TRACE, -- Logging level for output to file. Set to false to disable file logging.
	-- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

for _, language in ipairs({ 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' }) do
	dap.configurations[language] = {
		{
			type = 'pwa-node',
			request = 'launch',
			name = 'Launch file',
			program = '${file}',
			cwd = '${workspaceFolder}',
			skipFiles = { '<node_internals>/**' },
			protocol = 'inspector',
			console = 'integratedTerminal',
			sourceMaps = true,
			resolveSourceMapLocations = { '${workspaceFolder}/dist/**/*.js' },
			runtimeExecutable = 'ts-node',
		},
		{
			type = 'pwa-node',
			request = 'attach',
			name = 'Attach',
			processId = require('dap.utils').pick_process,
			cwd = '${workspaceFolder}',
			skipFiles = { '<node_internals>/**' },
			protocol = 'inspector',
			console = 'integratedTerminal',
			sourceMaps = true,
			resolveSourceMapLocations = { '${workspaceFolder}/dist/**/*.js' },
			runtimeExecutable = 'ts-node',
		},
		{
			type = 'pwa-node',
			request = 'launch',
			name = 'Debug Jest Tests',
			-- trace = true, -- include debugger info
			runtimeExecutable = 'node',
			runtimeArgs = {
				'./node_modules/jest/bin/jest.js',
				'--runInBand',
			},
			rootPath = '${workspaceFolder}',
			cwd = '${workspaceFolder}',
			console = 'integratedTerminal',
			internalConsoleOptions = 'neverOpen',
		},
	}
end

dap.adapters.lldb = { type = 'executable', command = '/usr/bin/lldb-vscode', name = 'lldb' }

dap.configurations.cpp = {
	{
		name = 'Launch',
		type = 'lldb',
		request = 'launch',
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
		args = {},
	},
}

dap.configurations.c = dap.configurations.cpp

local dapui_ok, dapui = pcall(require, 'dapui')
if not dapui_ok then
	vim.notify('Dapui not found please install it!')
	return
end

dapui.setup({
	icons = { expanded = '▾', collapsed = '▸', current_frame = '▸' },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { '<CR>' },
		open = 'o',
		remove = 'd',
		edit = 'e',
		repl = 'r',
		toggle = 't',
	},
	-- Expand lines larger than the window
	-- Requires >= 0.7
	expand_lines = vim.fn.has('nvim-0.7'),
	-- Layouts define sections of the screen to place windows.
	-- The position can be "left", "right", "top" or "bottom".
	-- The size specifies the height/width depending on position. It can be an Int
	-- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
	-- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
	-- Elements are the elements shown in the layout (in order).
	-- Layouts are opened in order so that earlier layouts take priority in window sizing.
	layouts = {
		{
			elements = {
				-- Elements can be strings or table with id and size keys.
				{ id = 'scopes', size = 0.25 },
				'breakpoints',
				'stacks',
				'watches',
			},
			size = 40, -- 40 columns
			position = 'left',
		},
		{
			elements = {
				'repl',
			},
			size = 0.25, -- 25% of total lines
			position = 'bottom',
		},
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = 'single', -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { 'q', '<Esc>' },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
		max_value_lines = 100, -- Can be integer or nil.
	},
})

local dap_vtext_ok, dap_vtext = pcall(require, 'nvim-dap-virtual-text')
if not dap_vtext_ok then
	vim.notify('Dap Virtual Text not found please install it!')
	return
end

dap_vtext.setup()

-- Open UI on debugging start
dap.listeners.after.event_initialized['dapui_config'] = function()
	dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
	dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
	dapui.close()
end
