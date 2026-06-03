local get_option_val = vim.api.nvim_get_option_value
local set_option_val = vim.api.nvim_set_option_value 
local options = {}

-- Some vim-styled options:
vim.cmd [[
let g:ranger_replace_netrw = 1
let g:transparent_enabled = 1
]]

-- 08/29/25 fix for messages not showing anymore after I updated neovim
-- https://github.com/neovim/neovim/issues/33073
vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false,
})

vim.g.loaded_lua_ftplugin = 1

ranger_replace_netrw = 1

options = {
    opt = {
        autochdir = true,
        confirm = true,
        clipboard = "unnamedplus",
        mouse = "",
        number = true,
        autoindent = true,
        smartindent = false,
        cindent = false,
        expandtab = true,
        softtabstop = 0,
        shiftwidth = 0,
        tabstop = 4,
        foldlevelstart = 99,
        backspace = "indent,eol,start",
        list = true,
        listchars = {["tab"] = "▷⋮"},
        shellcmdflag="-c",
        backupdir = os.getenv("HOME") .. "/.config/nvim/cache"
    },
    wo = {
        foldenable = true,
        foldmethod = "expr",
        foldexpr = "v:lua.vim.lsp.foldexpr()",
        foldlevel = 99,
        foldcolumn = "1",
    }
}

local cpopts = get_option_val("cpoptions", {})
set_option_val("cpoptions", cpopts .. "I", {})

for scope,tbl in pairs(options) do
    for k,v in pairs(tbl) do
        vim[scope][k] = v
    end
end
