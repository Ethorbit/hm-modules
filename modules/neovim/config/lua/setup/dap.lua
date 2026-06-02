local dap = require("dap")
local dapui = require("dapui")

dap.adapters.godot = {
    type = "server",
    host = "127.0.0.1",
    port = 6006,
}

dap.configurations.gdscript = {
    {
        type = "godot",
        request = "launch",
        name = "Launch",
        project = "${workspaceFolder}"
    }
}

dapui.setup {
    layouts = {
        {
            elements = {
                { id = "easy-dotnet_cpu", size = 0.5 },  -- CPU usage panel (50% of layout)
                { id = "easy-dotnet_mem", size = 0.5 },  -- Memory usage panel (50% of layout)
            },
            size = 35,      -- Width of the sidebar
            position = "right",
        },
    },
}
