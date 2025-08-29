{ pkgs, lib, ... }:
{
  nix = {
    # false for Determinate nix, true for managed install
    enable = false;

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

}