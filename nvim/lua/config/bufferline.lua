local status_ok, bufferline = pcall(require, "bufferline") if not status_ok then
    vim.notify("Can't load bufferline :(")
    return
end

bufferline.setup {
    options = {
        themable = true,
        offsets = {{ filetype = "NvimTree", text = "", highlight = "Directory", padding = 1 }},
        show_close_icon = false,
        show_buffer_close_icons = false,
        modified_icon = "*",
        tab_size = 15,  
        max_name_length = 18,
        always_show_bufferline = false,
        separator_style = "thin",
    },

    highlights = {
        buffer_selected = {
             gui = "bold",
        },
    },
}

