{ ... }:

{
    services.espanso.enable = true;

    home.file.".config/espanso" = {
        source = ./config;
        recursive = true;
    };
}
