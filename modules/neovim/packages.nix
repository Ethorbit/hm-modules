{ pkgs, ... }:

with pkgs;

let
    roslyn = pkgs.roslyn-ls;
    wrappedRoslyn = pkgs.writeShellScriptBin "roslyn-language-server" ''
        exec ${roslyn}/bin/Microsoft.CodeAnalysis.LanguageServer "$@"
    '';
    hasNodePackages = (builtins.tryEval (builtins.hasAttr "nodePackages" pkgs && pkgs.nodePackages != null)).value;
in
{
    programs.neovim = {
        # NixOS 25.05's neovim v0.11.3 broke built-in lua support
        # I'm downgrading for the time being
        package = lib.mkForce (
            pkgs.old.neovim-unwrapped.overrideAttrs (old: {
                meta = old.meta // { teams = []; };
                buildInputs = (old.buildInputs or []) ++ [ ranger ];
            })
        );

        extraPackages = [
            ranger
            fd
            ripgrep
            trash-cli
            nil
            mdx-language-server
            (python3.withPackages (p: (with p; [
                python-lsp-server
                flake8
                pycodestyle
                pyflakes
                pylint
                pylsp-mypy
                pyls-isort
            ])))
            wrappedRoslyn
            ethorbit.easydotnet
            dotnet-ef
            dotnet-sdk_10
            netcoredbg
            vscode-langservers-extracted
            lua-language-server
            yaml-language-server
            docker-compose-language-service
            dockerfile-language-server-nodejs
            gdscript-formatter
        ] ++ (
            if hasNodePackages then
                [
                    nodePackages.eslint
                    nodePackages.typescript-language-server
                    nodePackages.svelte-language-server
                ]
            else
                [
                    eslint
                    typescript-language-server
                    svelte-language-server
                ]
        );
    };
}
