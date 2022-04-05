let
  configs = import ../base/configs.nix;
in {
  programs.alacritty = {
    enable = true;
    settings = {
      colors = configs.theme.colors;
      font = {
        normal.family = "Iosevka Nerd Font";
        size = 7;
      };
      window = {
        padding = {
          y = 7;
          x = 7;
        };
      };
      shell = configs.shell.name;
      size = 7;
    };
  };
}

