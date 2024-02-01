{ pkgs, fullName, emailAddress, ... }:

{
    programs.git = {
      enable = true;
      userName = fullName;
      userEmail = emailAddress;
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
        pull.rebase = true;
      };
    };
}
