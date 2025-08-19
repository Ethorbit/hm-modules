{ config, ... }:

{
    services.polybar.config = {
        "module/microphone" = {
            exec = "${config.ethorbit.home-manager.polybar.scripts.microphone.outPath}";
            type = "custom/script";
            click-left = "pa-toggle-mic.sh --toggle";
            interval = 1;
            format-underline = "#ffffff";
        };
    };
}
