{ pkgs, ... }:

let
    script = pkgs.writeShellScriptBin "script" ''
       if [ "$1" ]; then
           ${pkgs.moc}/bin/mocp mocp -l "$1"
       else
           ${pkgs.moc}/bin/mocp mocp, mode "default"
       fi
    '';
in
{
    xdg.desktopEntries.moc = {
        name = "moc";
        exec = ''/usr/bin/env sh ${script}/bin/script %f'';
        terminal = true;
        type = "Application";
        categories = [ "Audio" ];
        mimeType = [ "audio/*" ];
    };
}
