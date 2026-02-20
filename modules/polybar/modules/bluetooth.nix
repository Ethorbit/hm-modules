{ config, ... }:

{
    services.polybar.config = {
        # Thanks to https://www.reddit.com/r/Polybar/comments/1g1ogux/i_made_a_modulescript_to_show_the_battery_of_my/
        "module/bluetooth/battery" = {
            type = "custom/script";
            exec = "${config.ethorbit.home-manager.polybar.scripts.bluetooth.battery}";
            exec-if = "${config.ethorbit.home-manager.polybar.scripts.bluetooth.battery} >/dev/null 2>&1";
            interval = 60;
            label = "%{F#ffffff}♐ %output%%{F-}";
        };
    };
}
