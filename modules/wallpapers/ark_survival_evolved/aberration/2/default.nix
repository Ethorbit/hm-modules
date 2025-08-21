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
        || elem "ark_survival_evolved/aberration/2" cfg
    ) {
        home.file.".wallpapers/ark_survival_evolved_aberration_2.jpg" = {
            source = (builtins.fetchurl {
                url = "https://www.dropbox.com/scl/fi/pp65mcl3h55qh5a0v4rqy/ark-aberration-pink-zone.png?rlkey=l8y9lxyxxb55xqy4s1xfvcfvw";
                sha256 = "sha256:0p79lsby7d13rqbl8c31lybh4d2xihwiivz7d6ipqadl7lahxzdx";
            });
        };
    };
}
