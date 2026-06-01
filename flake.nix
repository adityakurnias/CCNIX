{
  description = "Kurnias NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell/v5";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    arion = {
      url = "github:hercules-ci/arion";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      niri,
      arion,
      noctalia,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.ccnixos = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs;
        };

        modules = [
          {
            nixpkgs = {
              config = {
                allowUnfree = true;
                permittedInsecurePackages = [
                  "ventoy-1.1.12"
                ];
              };
            };
          }

          ./hosts/ccnixos/configuration.nix
          home-manager.nixosModules.home-manager
          arion.nixosModules.arion

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.kurnias = import ./profiles/kurnias/home.nix;
              extraSpecialArgs = {
                inherit
                  inputs
                  niri
                  noctalia
                  ;
              };
              backupFileExtension = "backup";
            };
          }
        ];
      };

      homeConfigurations.kurnias = home-manager.lib.homeManagerConfiguration {
        modules = [ ./profiles/kurnias/home.nix ];
        extraSpecialArgs = {
          inherit
            inputs
            niri
            noctalia
            ;
        };
      };
    };
}
