{ pkgs, ... }:

{
    home = with pkgs; {
        packages = [
            dconf
        ];
    };

    dconf.settings = {
        "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
        };
    };
}
