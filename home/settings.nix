{ ... }:
{
  # MacOS settings
  # targets.darwin.currentHostDefaults = {
  #  "com.apple.controlcenter" = {
  #    BatteryShowPercentage = true;
  #  };
  # };
  targets.darwin.defaults = {
    "com.apple.dock".autohide = true;
    "com.apple.finder".AppleShowAllFiles = true;
  };
}