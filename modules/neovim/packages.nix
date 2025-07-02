{ pkgs, ... }:

with pkgs;

{
    programs.neovim.extraPackages = [
        ranger
        ripgrep
    ];
}
