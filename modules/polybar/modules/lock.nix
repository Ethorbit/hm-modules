{ config, ... }:

{
    services.polybar.config = {
        "module/lock" = {
            type = "custom/text";
            click-left = "${config.ethorbit.home-manager.polybar.scripts.lock.outPath}";
            label-urgent = "";
            label = "  🔒";
            format-offset = "-13";
            #format-margin = 1;
            format-underline = "#7895c4";
            #f50a4d
        };
    };
}
