{ config, lib, ... }:

with lib;

let
    cfg = config.ethorbit.home-manager.wallpapers;
in

{
    config = mkIf (
        elem "all" cfg 
        || elem "zombies_at_phoneburnia" cfg 
        || elem "zombies_at_phoneburnia/dm_raven" cfg) 
    {
        home.file.".wallpapers/dm_raven.jpeg" = {
            source = ./dm_raven.jpeg;
        };
    };
}
