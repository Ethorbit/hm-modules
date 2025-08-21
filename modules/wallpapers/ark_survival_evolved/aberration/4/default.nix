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
        || elem "ark_survival_evolved/aberration/4" cfg
    ) {
        home.file.".wallpapers/ark_survival_evolved_aberration_4.jpg" = {
            source = (builtins.fetchurl {
                url = "https://wallpaperaccess.com/full/7153576.jpg";
                sha256 = "sha256:09k63dbj24wqb8vqn6zhxkrd1kggwhvmykw4y34g1sq8xmwkd5hr";
            });
        };
    };
}
