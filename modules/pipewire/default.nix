{ ... }:

{
    home.file.".config/pipewire" = {
        source = ./config;
        recursive = true;
    };
}
