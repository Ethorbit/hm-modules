# Dumb fix for Polybar: Disabling module "i3" reason: Could not find i3 socket: i3 --get-socketpath failed with exit code 1 and output

{ config, ... }:

{
    config = {
        home.file.".config/i3/polybar".text = 
          if config.services.polybar.enable
          then ''
          exec systemctl --user restart polybar
          ''
          else "";
    };
}
