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

            header-nvim

            luasnip
            cmp-nvim-lsp
            cmp-buffer
            cmp-path
            cmp-cmdline
            nvim-cmp

            pkgs.unstable.vimPlugins.easy-dotnet-nvim

            nvim-dap
            nvim-dap-ui
            nvim-treesitter.withAllGrammars
            godotdev-nvim

            # LSP stuff
            nvim-lspconfig
            nvim-lint
            formatter-nvim

            vim-qml
            vim-svelte

            indent-blankline-nvim

            plenary-nvim
            telescope-nvim
            nvim-neoclip-lua
            
            nui-nvim
        ];
    };
}
