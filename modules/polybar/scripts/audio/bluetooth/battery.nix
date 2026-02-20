#!/bin/bash

{ lib, pkgs, ... }:

{
    options = with lib; {
        ethorbit.home-manager.polybar.scripts.bluetooth.battery = lib.mkOption {
            type = types.package;

            # Ported from:
            # https://www.reddit.com/r/Polybar/comments/1g1ogux/i_made_a_modulescript_to_show_the_battery_of_my/
            # Thanks for sharing!
            default = (pkgs.writeShellScript "bluetooth_battery.sh" ''
                bluetoothctl="${pkgs.bluez}/bin/bluetoothctl"
                [ ! $(command -v bluetoothctl) ] && echo "" && exit

                # Use bluetoothctl to get the list of devices and parse the output
                while IFS=' ' read -r _ address alias; do
                    # Run bluetoothctl info command for each address and check connected status
                    connected_status=$(bluetoothctl info "$address" | grep "Connected:" | awk '{print $2}')
                  
                    if [ "$connected_status" == "yes" ]; then
                        # If the device is connected, get the battery percentage inside parentheses
                        battery_percentage=$(bluetoothctl info "$address" | grep "Battery Percentage:" | grep -oP '\(\K[0-9]+')
                        # Print only the battery percentage for Polybar
                        echo "$battery_percentage%"
                        exit 0
                    fi
                done < <(bluetoothctl devices)

                # Exit with a special code if no device is connected
                exit 1
            '');
        };
    };
}

