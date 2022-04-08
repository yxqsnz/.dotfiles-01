{ config, pkgs, ... }:
let cfg = config.wayland.windowManager.sway;
in {
  keyboard = { layout = "br"; };
  keybindings = let
    mod = cfg.config.modifier;
    audio = "exec ${pkgs.pamixer}/bin/pamixer";
    playerctl = "exec ${pkgs.playerctl}/bin/playerctl";
    light = "exec ${pkgs.light}/bin/light";
  in {
    "${mod}+Return" = "exec ${cfg.config.terminal}";
    "${mod}+q" = "kill";
    "${mod}+d" = "exec ${cfg.config.menu}";
    "${mod}+f" = "fullscreen toggle";
    XF86AudioRaiseVolume = "${audio} -i 1";
    XF86AudioLowerVolume = "${audio} -d 1";
    XF86AudioMute = "${audio} -t";
    XF86AudioPlay = "${playerctl} play-pause";
    XF86AudioPause = "${playerctl} play-pause";
    XF86AudioNext = "${playerctl} next";
    XF86AudioPrev = "${playerctl} previous";
    XF86MonBrightnessUp = "${light} -A 10";
    XF86MonBrightnessDown = "${light} -U 10";
    "Print" = "exec grimshot copy screen --notify";
    "Shift+Print" = "exec grimshot copy area --notify";
    "${mod}+1" = "workspace number 1";
    "${mod}+2" = "workspace number 2";
    "${mod}+3" = "workspace number 3";
    "${mod}+4" = "workspace number 4";
    "${mod}+5" = "workspace number 5";
    "${mod}+6" = "workspace number 6";
    "${mod}+7" = "workspace number 7";
    "${mod}+8" = "workspace number 8";
    "${mod}+9" = "workspace number 9";
    "${mod}+s" = "floating toggle";
    "Mod1+f" = "focus mode_toggle";
    "${mod}+Shift+1" = "move container to workspace number 1";
    "${mod}+Shift+2" = "move container to workspace number 2";
    "${mod}+Shift+3" = "move container to workspace number 3";
    "${mod}+Shift+4" = "move container to workspace number 4";
    "${mod}+Shift+5" = "move container to workspace number 5";
    "${mod}+Shift+6" = "move container to workspace number 6";
    "${mod}+Shift+7" = "move container to workspace number 7";
    "${mod}+Shift+8" = "move container to workspace number 8";
    "${mod}+Shift+9" = "move container to workspace number 9";
  };
  autoStart = [
      "mako"
  ];

}
