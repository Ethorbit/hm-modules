{ pkgs, lib, ... }:

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

        # Recursive above makes it not possible to override any files
        # however any customizations you make to this custom/init.lua
        # will run last, thus it can override any value you set inside
        ".config/nvim/lua/custom/init.lua".source = mkDefault ./config_overridable/lua/custom/init.lua;
        # example for overriding clipboard option:
        # ".config/nvim/lua/custom/init.lua".text = ''
        #     vim.opt.clipboard = "unnamed"
        # '';
    };

    # home.file.".config/nvim/lua/nix.lua".text = ''
    #     vim.g.godot_executable = "${config.ethorbit.home-manager.nvim.godotPath}"
    # '';

    programs.bash.bashrcExtra = shellVars;
    programs.zsh.initExtra = shellVars;
}
