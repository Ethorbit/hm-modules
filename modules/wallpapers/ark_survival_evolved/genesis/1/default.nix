{ config, lib, ... }:

with lib;

let
    cfg = config.ethorbit.home-manager.wallpapers;
in

{
    config = mkIf (
        elem "all" cfg
        || elem "ark_survival_evolved" cfg 
        || elem "ark_survival_evolved/genesis" cfg 
        || elem "ark_survival_evolved/genesis/1" cfg
    ) {
        # original url: https://wallpapercave.com/wp/wp9285238.jpg
        # the website blocks my download requests so I re-uploaded it to Dropbox.
        home.file.".wallpapers/ark_survival_evolved_genesis_1.jpg" = {
            source = (builtins.fetchurl {
                url = "https://www.dropbox.com/scl/fi/04z20uubl64as0d7bun4s/ark-genesis-shadowmane.webp?rlkey=0v6nkjb3uitfq0puxf04pllwu";
                sha256 = "sha256:0j7dz2yjf3x5i5k1gzvj18acndq81mlvaj4d1f37q6i5ys0i26av";
            });
        };
    };
}
