{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/release-24.11";

        ethorbitpkgs = {
            url = "github:ethorbit/nix-packages";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        home-manager = {
            url = "github:nix-community/home-manager/release-24.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        utils.url = "github:numtide/flake-utils";
    };

    outputs = {
        self,
        nixpkgs,
        ethorbitpkgs,
        home-manager,
        utils
    }: 
    utils.lib.eachDefaultSystem (system:
    let
        pkgs = import nixpkgs {
            inherit system;
            allowUnfree = true;
            overlays = [
                ethorbitpkgs.overlays.default
            ];
        };

        # Import the modules you want in your own Home Manager config
        homeModules = import ./modules;
    in {
        #  For building / testing individual home modules
        legacyPackages.homeConfigurations = builtins.mapAttrs (name: module:
            home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    module
                    {
                        home = {
                            username = "builder";
                            homeDirectory = "/home/builder";
                            stateVersion = "24.11";
                        };
                    }
                ];
            }
        ) homeModules;
    });
}
