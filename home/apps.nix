{ pkgs, ... }: {
  home.packages = with pkgs; [
    jq
    mc
  ];

  programs = {

    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };

  };
}