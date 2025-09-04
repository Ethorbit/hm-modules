{ pkgs, ... }:

with pkgs;

{
    programs.neovim.extraPackages = [
        ranger
        ripgrep
        trash-cli
        nil
        unstable.mdx-language-server
        (python3.withPackages (p: (with p; [
            python-lsp-server
            flake8
            pycodestyle
            pyflakes
            pylint
            pylsp-mypy
            pyls-isort
        ])))
        nodePackages.eslint
        vscode-langservers-extracted
        nodePackages.typescript-language-server
        nodePackages.svelte-language-server
        lua-language-server
        yaml-language-server
        docker-compose-language-service
        dockerfile-language-server-nodejs
    ];
}
