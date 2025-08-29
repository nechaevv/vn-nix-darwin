{
  description = "Nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-25.05-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { self, nixpkgs, nix-darwin, home-manager, ... }:
  let
    username = "vn";
    useremail = "vn.glider@gmail.com";
    system = "aarch64-darwin";
    hostname = "vn-laptop";

    specialArgs = inputs // {
      inherit username useremail hostname;
    };

  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#vn-laptop
    darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
      inherit system specialArgs;
      modules = [
        ./nix-core.nix
        ./system.nix
        ./apps.nix
        ./host-users.nix
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = specialArgs;
          home-manager.backupFileExtension = "pre-hm-backup";
          home-manager.users.${username} = import ./home;
        }
      ];
    };
  };
}
