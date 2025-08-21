{ config, lib, ... }:

with lib;

let
    cfg = config.ethorbit.home-manager.wallpapers;
in

{
    config = mkIf (
        elem "all" cfg 
        || elem "zombies_at_phoneburnia" cfg 
        || elem "zombies_at_phoneburnia/dm_mine_entrance" cfg)
    {
        home.file.".wallpapers/dm_mine_entrance.jpeg" = {
            source = ./dm_mine_entrance.jpeg;
        };
    };
}
