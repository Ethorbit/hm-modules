{ lib, pkgs, ... }:

with lib;
{
    options.ethorbit.home-manager.nvim = {
        godotPath = mkOption {
            default = "${pkgs.godot_4-mono}/bin/godot4-mono";
            description = "The path to the godot binary that neovim will edit scripts for.";
        };
    };
}
