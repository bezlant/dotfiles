local status_ok, pairs = pcall(require, "nvim-autopairs")
if not status_ok then
    vim.notify("Can't load nvim-autopairs :(")
    return
end

pairs.setup {
    check_ts = true,
    disable_filetype = { "TelescopePrompt" },

    fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey='Comment'
    },
}
