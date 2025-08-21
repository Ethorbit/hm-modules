{ config, lib, ... }:

with lib;

let
    cfg = config.ethorbit.home-manager.wallpapers;
in

{
    config = mkIf (
        elem "all" cfg 
        || elem "zombies_at_phoneburnia" cfg 
        || elem "zombies_at_phoneburnia/pb_z_high_school" cfg
    ) {
        home.file.".wallpapers/pb_z_high_school.jpeg" = {
            source = ./pb_z_high_school.jpeg;
        };
    };
}
