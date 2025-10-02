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
    mas
    neovim
  ];

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true; # Fetch the newest stable branch of Homebrew's git repo
      upgrade = true; # Upgrade outdated casks, formulae, and App Store apps
      # 'zap': uninstalls all formulae(and related files) not listed in the generated Brewfile
      cleanup = "zap";
    };
    # Applications to install from Mac App Store using mas.
    # You need to install all these Apps manually first so that your apple account have records for them.
    # otherwise Apple Store will refuse to install them.
    # For details, see https://github.com/mas-cli/mas
    masApps = {
      xcode = 497799835;
      telegram = 747648890;
      faa-private-pilot-prep = 552933297;
    };

    # `brew install`
    # brews = [];

    # `brew install --cask`
    casks = [
      "adobe-creative-cloud"
      "clion"
      "discord"
      "dropbox"
      "firefox"
      "freecad"
      "google-chrome"
      "imaging-edge"
      "intellij-idea"
      "microsoft-teams"
      "obsidian"
      "openscad"
      "spotify"
      # "telegram" - install through AppStore
      "ultimaker-cura"
      "wacom-tablet"
      "zoom"
    ];
  };
}
