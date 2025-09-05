{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/release-25.05";
        nixpkgs-old.url = "github:nixos/nixpkgs/release-24.11";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        ethorbit-packages = {
            url = "github:ethorbit/nix-packages";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        home-manager = {
            url = "github:nix-community/home-manager/release-25.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        utils.url = "github:numtide/flake-utils";
    };

    outputs = {
        self,
        nixpkgs,
        nixpkgs-old,
        nixpkgs-unstable,
        ethorbit-packages,
        home-manager,
        utils
    }: 
    utils.lib.eachDefaultSystem (system:
    let
        pkgs = import nixpkgs {
            inherit system;
            allowUnfree = true;
            overlays = [
                (self: super: {
                    stable = (import nixpkgs {
                        system = super.system;
                        config.allowUnfree = true;
                    });
                
                    old = (import nixpkgs-old {
                        system = super.system;
                        config.allowUnfree = true;
                    });
                
                    unstable = (import nixpkgs-unstable {
                        system = super.system;
                        config.allowUnfree = true;
                    });
                })

                ethorbit-packages.overlays.default
            ];
        };

        homeModules = import ./modules;
    in {
        # Import the modules you want in your own Home Manager config
        inherit homeModules;

        # For building / testing individual home modules
        legacyPackages.homeConfigurations = builtins.mapAttrs (name: module:
            home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    module
                    # Minimal stuff needed for development and tests
                    (import modules/default)
                    (import modules/shell)
                    (import modules/neovim)
                    {
                        home = {
                            username = "builder";
                            homeDirectory = "/home/builder";
                        };
                    }
                ];
            }
        ) homeModules;
    });
}
