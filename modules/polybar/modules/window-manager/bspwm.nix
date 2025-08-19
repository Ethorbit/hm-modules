{ config, ... }:

{
    services.polybar.config = {
        "module/bspwm" = {
            type = "internal/bspwm";

            label-focused = "%index%";
            label-focused-background = config.ethorbit.home-manager.polybar.colors.background-alt;
            label-focused-underline= config.ethorbit.home-manager.polybar.colors.primary;
            label-focused-padding = 2;

            label-occupied = "%index%";
            label-occupied-padding = 2;

            label-urgent = "%index%!";
            label-urgent-background = config.ethorbit.home-manager.polybar.colors.alert;
            label-urgent-padding = 2;

            label-empty = "%index%";
            label-empty-foreground = config.ethorbit.home-manager.polybar.colors.foreground-alt;
            label-empty-padding = 2;

            # Separator in between workspaces
            #label-separator = |
        };
    };
}
