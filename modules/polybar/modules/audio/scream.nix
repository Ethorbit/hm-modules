{ config, ... }:

{
    services.polybar.config = {
        "module/scream" = {
            exec = "${config.ethorbit.home-manager.polybar.scripts.scream.scream.outPath}";
            type = "custom/script";
            click-left = "${config.ethorbit.home-manager.polybar.scripts.scream.toggle.outPath}";
            interval = 1;
            format-underline = "#ffffff";
        };
    };
}
