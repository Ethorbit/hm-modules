{ lib, ... }:

let
    shellVars = ''
        EDITOR=nvim
        VISUAL=nvim
    '';
in
{
    imports = [
        ./plugins.nix
        ./packages.nix
        ./options.nix
    ];

    programs.neovim = {
        enable = true;
        defaultEditor = true;
        vimAlias = true;
        viAlias = true;
        vimdiffAlias = true;
    };

    home.file = with lib; {
        ".config/nvim" = {
            source = ./config;
            recursive = true;
        };

        # Override these in your custom system configs:
        ".config/nvim/lua/custom/init.lua".text = mkDefault "";
    };

    # home.file.".config/nvim/lua/nix.lua".text = ''
    #     vim.g.godot_executable = "${config.ethorbit.home-manager.nvim.godotPath}"
    # '';

    programs.bash.bashrcExtra = shellVars;
    programs.zsh.initExtra = shellVars;
}
