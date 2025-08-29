{ pkgs, ... }:
{
  nixpkgs = {
    config.allowUnfree = true;
    # hostPlatform = "aarch64-darwin";
  };

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    git
    neovim
  ];
}