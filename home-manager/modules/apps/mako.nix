{ pkgs, ... }: 
let configs = import ../base/configs.nix;
in {
  programs.mako = {
    enable = true;
    layer = "overlay";
    font = "Iosevka Nerd Font";
    anchor = "bottom-right";
    backgroundColor = configs.theme.colors.primary.background;
    progressColor = "source ${configs.theme.colors.primary.foreground}";
    textColor = configs.theme.colors.primary.foreground;
    borderColor = configs.theme.colors.normal.white;
    width = 400;
    height = 90;
    
    borderSize = 2;
    borderRadius = 4;

    defaultTimeout = 10000;
    # hard-codded go brr kek
    extraConfig = ''
      [urgency=high]
      ignore-timeout=1
      text-color=#742A2A
      background-color=#FEB2B2
      progress-color=source #FC8181
    '';
  };
}