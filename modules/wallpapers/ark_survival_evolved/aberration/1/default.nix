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
        || elem "ark_survival_evolved/aberration/1" cfg
    ) {
        home.file.".wallpapers/ark_survival_evolved_aberration_1.jpg" = {
            source = (builtins.fetchurl {
                url = "https://cdnb.artstation.com/p/assets/images/images/015/301/215/large/mike-rodriguez-biolum5.jpg?1547837396";
                sha256 = "1y7yrlmgy7qc6jq8nlb302lqxf9jfsy2p9k10mvmnqlmywsg76zx";
            });
        };
    };
}
