{ username, useremail, ... }:
{
  programs.git = {
    enable = true;

    userName = username;
    userEmail = useremail;

    # includes = [
    #  {
    #    # use diffrent email & name for work
    #    path = "~/work/.gitconfig";
    #    condition = "gitdir:~/work/";
    #  }
    # ];

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
    };
  };
}
