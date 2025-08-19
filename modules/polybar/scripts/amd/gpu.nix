{ config, lib, pkgs, ... }:

{
    options = with lib; {
        ethorbit.home-manager.polybar.scripts.amd.gpu = lib.mkOption {
            type = types.package;
            default = (pkgs.writeShellScript "amd-gpu.sh" ''
                TEMP=$("${config.ethorbit.home-manager.polybar.scripts.amd.gpu-temperature}")
                USAGE=$("${config.ethorbit.home-manager.polybar.scripts.amd.gpu-usage}")

                echo "$USAGE $TEMP"
            '');
        };
    };
}

