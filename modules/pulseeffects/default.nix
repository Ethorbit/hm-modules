{ lib, ... }:

with lib;
{
    services.pulseeffects = {
        enable = mkDefault true;
        preset = "Main";
    };

    home.file.".config/PulseEffects" = {
        source = ./config;
        recursive = true;
    };
}
