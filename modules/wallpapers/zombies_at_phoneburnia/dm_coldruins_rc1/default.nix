{ config, lib, ... }:

with lib;

let
    cfg = config.ethorbit.home-manager.wallpapers;
in

{
    config = mkIf (
        elem "all" cfg 
        || elem "zombies_at_phoneburnia" cfg 
        || elem "zombies_at_phoneburnia/dm_coldruins_rc1" cfg)
    {
            home.file.".wallpapers/dm_coldruins_rc1.jpeg" = {
                source = ./dm_coldruins_rc1.jpeg;
            };
    };
}
