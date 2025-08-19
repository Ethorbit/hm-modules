{ config, lib, pkgs, ... }:

{
    options = with lib; {
        ethorbit.home-manager.polybar.scripts.amd.cpu = lib.mkOption {
            type = types.package;
            default = (pkgs.writeShellScript "amd-cpu.sh" ''
                TEMP=$("${config.ethorbit.home-manager.polybar.scripts.amd.cpu-temperature}")
                USAGE=$("${config.ethorbit.home-manager.polybar.scripts.amd.cpu-usage}")

                echo "$TEMP$USAGE"
            '');
        };
    };
}
