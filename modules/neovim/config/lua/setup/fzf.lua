require("fzf-lua").setup({
    fzf_colors = false,
    hls = {},
})

vim.api.nvim_create_user_command("GodotScene", function()
    require("fzf-lua").files({
        prompt = "Select Scene> ",
        fd_opts = "--extension tscn",
        actions = {
            ["default"] = function(selected)
                vim.fn.jobstart({ "godot", "--path", vim.fn.getcwd(), selected[1] }, { detach = true })
            end,
        },
    })
end, {})
