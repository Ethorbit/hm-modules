{ lib, ... }:

with lib;

{
    imports = [
        ./ark_survival_evolved
        ./space
        ./zombies_at_phoneburnia
    ];

    options.ethorbit.home-manager.wallpapers = mkOption {
        type = types.listOf types.str;
        description = "A list of wallpapers to install";
        example = literalExpression [ "space/4k_1" ];
        default = [ ];
    };
}
