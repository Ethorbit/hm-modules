require("easy-dotnet").setup({
    debugger = {
        bin_path = vim.fn.exepath("netcoredbg"),
    }
})
