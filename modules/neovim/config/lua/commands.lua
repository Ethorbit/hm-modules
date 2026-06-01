vim.api.nvim_create_user_command("Godot", function(opts)
    local cmd = { "godot", "--path", vim.fn.getcwd() }
    if opts.args ~= "" then
        table.insert(cmd, opts.args)
    end
    vim.fn.jobstart(cmd, { detach = true })
end, { nargs = "?" })
