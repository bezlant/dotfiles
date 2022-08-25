local attach_to_buffer = function(output_bufnr, command, pattern)
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = vim.api.nvim_create_augroup("Autorunner", { clear = true }),
        pattern = pattern,
        callback = function()
            local compile_ok = true
            local append_data = function(_, data)
                local empty = { "" }
                if data[1] ~= empty[1] then
                    compile_ok = false
                    vim.api.nvim_buf_set_lines(output_bufnr, 0, -1, false, data)
                end
            end

            local compile = vim.fn.jobstart(command, {
                stderr_buffered = true,
                on_stderr = append_data,
            })

            vim.fn.jobwait({ compile })

            if compile_ok then
                vim.fn.jobstart({ "./test" }, {
                    stdout_buffered = true,
                    on_stdout = append_data,
                })
            end
        end,
    })
end

-- attach_to_buffer(36, { "g++", "-g", "-o", "test", "-std=c++11", "test.cpp" }, "*.cpp")

vim.api.nvim_create_user_command("Autorun", function()
    local bufnr = vim.fn.input("Bufnr: ")
    local command = vim.split(vim.fn.input("Command: "), " ")
    local pattern = vim.fn.input("Pattern: ")
    attach_to_buffer(tonumber(bufnr), command, pattern)
end, {})
