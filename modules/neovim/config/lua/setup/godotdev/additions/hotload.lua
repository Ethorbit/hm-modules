-- Reload current scene when code is changed.
local function find_godot_project()
    local result = vim.fs.find("project.godot", { upward = true, path = vim.fn.expand("%:p:h") })
    return result[1] ~= nil
end

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "*.cs", "*.gd", "*.tscn" },
    callback = function()
        if not find_godot_project() then return end

        -- Prevent duplicates
        vim.fn.system("pgrep -af 'godot' | grep -- '--path' | grep -v -- '--editor' | awk '{print $1}' | xargs -r kill")

        local old_notify = vim.notify
        vim.notify = function() end
        if not require("godotdev.run").run_current_scene() then
            require("godotdev.run").run_project()
        end
        vim.notify = old_notify
    end
})
