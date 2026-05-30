require("mason").setup()
require("mason-lspconfig").setup()
require("lint")
require("formatter").setup()

local function add(name, config)
    vim.lsp.config(name, config or {})
    vim.lsp.enable(name)
end

-- https://mason-registry.dev/registry/list
add("nil_ls")

add("eslint", {
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
        })
    end,
})

add("html")
add("jsonls")
add("ts_ls")
add("lua_ls")
add("phpactor")
add("svelte")
add("pylsp", {
    plugins = {
        flake8 = { enabled = true },
        pylint = { enabled = true, executable = "pylint" },
        pyflakes = { enabled = true },
        pycodestyle = { enabled = true },
        pylsp_mypy = { enabled = true },
        pyls_isort = { enabled = true },
    }
})
add("yamlls")
add("docker_compose_language_service")
add("intelephense")
add("dockerls")
add("csharp_ls", {
    on_init = function(client)
        client.notify('workspace/didChangeConfiguration', {
            settings = {
                csharp = {
                    analyzersEnabled = true,
                    useMetadataUris = true, -- Crucial for navigating Godot internals
                }
            }
        })
        return true
    end,
})
add("qmlls")
add("gdscript")
add("gshader_lsp", {
    cmd = { "gdshader-language-server" },
    filetypes = { "gdshader" },
    root_dir = vim.fs.root(0, { ".godot", ".git" })
})
