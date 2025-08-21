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
        || elem "ark_survival_evolved/aberration/3" cfg
    ) {
        home.file.".wallpapers/ark_survival_evolved_aberration_3.jpg" = {
            source = (builtins.fetchurl {
                url = "https://cdn.wccftech.com/wp-content/uploads/2017/09/ark_aberration_2.jpg";
                sha256 = "sha256:0s4z04in79x1a1niwmkg6955fpphqq0r11hiskwfbhjh0nindns7";
            });
        };
    };
}
