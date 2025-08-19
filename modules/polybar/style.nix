{ lib, ... }:

{
    options = with lib; {
        ethorbit.home-manager.polybar.style = {
            radius = lib.mkOption {
                type = types.str;
                default = "0.0";
            };
        };
    };
}
