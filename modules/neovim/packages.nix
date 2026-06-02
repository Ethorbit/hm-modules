{ pkgs, ... }:

with pkgs;

let
    roslyn = pkgs.roslyn-ls;
    wrappedRoslyn = pkgs.writeShellScriptBin "roslyn-language-server" ''
        exec ${roslyn}/bin/Microsoft.CodeAnalysis.LanguageServer "$@"
    '';
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
            #csharp-ls
            wrappedRoslyn
            ethorbit.easydotnet
            dotnet-ef
            dotnet-sdk_10
            netcoredbg
            nodePackages.eslint
            vscode-langservers-extracted
            nodePackages.typescript-language-server
            nodePackages.svelte-language-server
            lua-language-server
            yaml-language-server
            docker-compose-language-service
            dockerfile-language-server-nodejs
            gdscript-formatter
        ];
    };
}
