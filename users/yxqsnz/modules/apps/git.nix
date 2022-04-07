{pkgs, ...}:
{
  programs.git = {
    enable = true;
    userName = "yxqsnz";
    userEmail = "yxqsnz@gmail.com";
    signing = {
      key = "F4216D44798CE83C8D693C14FD27C3F265D62E4A";
      gpgPath = "${pkgs.gnupg}/bin/gpg";
      signByDefault = true;
    };
    aliases = {
      prettylog =
        "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(r) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
      root = "rev-parse --show-toplevel";
    };
    extraConfig = {
      branch.autosetuprebase = "always";
      color.ui = true;
      core.askPass = ""; # needs to be empty to use terminal for ask pass
      credential.helper = "store"; # want to make this more secure
      github.user = "yxqsnz";
      push.default = "tracking";
      init.defaultBranch = "main";
    };
  };
}
