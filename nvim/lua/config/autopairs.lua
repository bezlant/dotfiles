local status_ok, pairs = pcall(require, 'nvim-autopairs')
if not status_ok then
	vim.notify("Can't load nvim-autopairs :(")
	return
end

pairs.setup({
	check_ts = true,
	disable_filetype = { 'TelescopePrompt' },
	ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], '%s+', ''),

	fast_wrap = {
		map = '<M-e>',
		chars = { '{', '[', '(', '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
		offfset = 0,
		end_key = '$',
		keys = 'qwertyuiopzxcvbnmasdfghjkl',
		check_comma = true,
		highlight = 'Search',
		highlight_grey = 'Comment',
	},
})

-- Add parentheses when autocompleting
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

-- Add spaces between parentheses
local Rule = require('nvim-autopairs.rule')
pairs.add_rules({
	Rule(' ', ' '):with_pair(function(opts)
		local pair = opts.line:sub(opts.col - 1, opts.col)
		return vim.tbl_contains({ '()', '[]', '{}' }, pair)
	end),
	Rule('( ', ' )')
		:with_pair(function()
			return false
		end)
		:with_move(function(opts)
			return opts.prev_char:match('.%)') ~= nil
		end)
		:use_key(')'),
	Rule('{ ', ' }')
		:with_pair(function()
			return false
		end)
		:with_move(function(opts)
			return opts.prev_char:match('.%}') ~= nil
		end)
		:use_key('}'),
	Rule('[ ', ' ]')
		:with_pair(function()
			return false
		end)
		:with_move(function(opts)
			return opts.prev_char:match('.%]') ~= nil
		end)
		:use_key(']'),
})
