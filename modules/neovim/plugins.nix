{ pkgs, ... }:

{
    programs.neovim = {
        withNodeJs = true;
        plugins = 
            with pkgs.vimPlugins; 
            with pkgs.ethorbit.vimPlugins;
        [
            confirm-quit

            nvim-osc52

            markdown-preview-nvim

            transparent-nvim

            vim-rooter
            lualine-nvim
            nvim-web-devicons
            ranger-vim
            bclose-vim
            comment-nvim

            luasnip
            cmp-nvim-lsp
            cmp-buffer
            cmp-path
            cmp-cmdline
            nvim-cmp
            #mason-nvim
            #mason-lspconfig-nvim

            nvim-dap
            nvim-dap-ui
            (nvim-treesitter.withPlugins (p: with p; [
                glsl
                gdshader
                gdscript
            ]))
            #godotdev-nvim

            # LSP stuff
            nvim-lspconfig
            nvim-lint
            formatter-nvim

            vim-qml
            vim-svelte

            indent-blankline-nvim

            fzf-lua
            nvim-neoclip-lua
            
            nui-nvim
        ];
    };
}
