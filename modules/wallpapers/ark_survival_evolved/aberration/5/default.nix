{ config, lib, ... }:

with lib;

let
    cfg = config.ethorbit.home-manager.wallpapers;
in

{
    config = mkIf (
        elem "all" cfg
        || elem "ark_survival_evolved" cfg 
        || elem "ark_survival_evolved/aberration" cfg
        || elem "ark_survival_evolved/aberration/5" cfg
    ) {
        home.file.".wallpapers/ark_survival_evolved_aberration_5.jpg" = {
            source = (builtins.fetchurl {
                url = "https://wallpaperaccess.com/full/6274493.jpg";
                sha256 = "sha256:13p54d9p013xyq5zkbvqj7vawxmkq7fy86528y24hvyrp8v0zsfc";
            });
        };
    };
}
