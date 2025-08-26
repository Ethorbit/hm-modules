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

        # You can override any of these in your own configs:
        ".config/nvim/lua/custom/init.lua".source = ./config_overridable/lua/custom/init.lua;
        ".config/nvim/lua/custom/setup/init.lua".source = ./config_overridable/lua/custom/setup/init.lua;
        ".config/nvim/lua/custom/setup/avante.lua".source = ./config_overridable/lua/custom/setup/avante.lua;
    };

    # home.file.".config/nvim/lua/nix.lua".text = ''
    #     vim.g.godot_executable = "${config.ethorbit.home-manager.nvim.godotPath}"
    # '';

    programs.bash.bashrcExtra = shellVars;
    programs.zsh.initExtra = shellVars;
}
