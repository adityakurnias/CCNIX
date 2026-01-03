{
  description = "Kurnias NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # quickshell = {
    #   url = "github:outfoxxed/quickshell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    
    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    zed-editor = {
      url = "github:zed-industries/zed";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      dankMaterialShell,
      niri,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      # --- Sistem utama ---
      nixosConfigurations.ccnixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/configuration.nix
          # niri.nixosModules.niri
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = false;
              useUserPackages = true;
              backupFileExtension = "backup";
              users.kurnias = import ./home/home.nix;
              extraSpecialArgs = { inherit dankMaterialShell niri inputs; };
            };
          }
        ];
      };

      homeConfigurations.kurnias = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { inherit system; };
        modules = [ ./home/home.nix ];
        extraSpecialArgs = { inherit dankMaterialShell niri inputs; };
      };
    };
}
