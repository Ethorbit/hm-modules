-- godotdev fix since it thinks it needs to enable the gdscript LSP for gdshader files
vim.lsp.config["gdscript"] = vim.tbl_extend("force", vim.lsp.get_config and vim.lsp.get_config("gdscript") or {}, {
    filetypes = { "gd", "gdscript", "gdscript3" }
})
