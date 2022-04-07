{ config, pkgs, lib, stdenv, ... }:
with pkgs;
with lib;
let 
  wallpaper = "~/.wpp.png";
  base = import ../base/configs.nix;
  cfg = config.wayland.windowManager.sway;
in {
	wayland.windowManager.sway = {
		enable = true;
		wrapperFeatures.gtk = true;
    extraConfig = ''
      seat seat0 xcursor_theme Numix-Color 24
    '';
    extraSessionCommands = ''
      export XDG_SESSION_TYPE=wayland
      export XDG_SESSION_DESKTOP=sway
      export XDG_CURRENT_DESKTOP=sway
      export MOZ_ENABLE_WAYLAND=1
      export CLUTTER_BACKEND=wayland
      export QT_QPA_PLATFORM=wayland-egl
      export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
      export ECORE_EVAS_ENGINE=wayland-egl
      export ELM_ENGINE=wayland_egl
      export SDL_VIDEODRIVER=wayland
      export _JAVA_AWT_WM_NONREPARENTING=1
      export NO_AT_BRIDGE=1
      eval $(gnome-keyring-daemon --daemonize --components=ssh,secrets)
      export SSH_AUTH_SOCK
    '';
    config = {
      output."*" = { bg = "${wallpaper} fill"; };
      modifier = "Mod4";
      menu = "wofi --show drun -I";
      seat = { "*" = { hide_cursor = "when-typing enable"; }; };
      terminal = "${pkgs.foot}/bin/foot";
      input."type:keyboard" = {
        xkb_layout = "br";
        xkb_options = "grp:alt_caps_toggle";
        xkb_numlock = "enabled";
      };
      input."type:touchpad" = {
        tap = "enabled";
        natural_scroll = "disabled";
        scroll_method = "two_finger";
      };
      window = {
        border = 2;
        commands = let
          rule = command: criteria: {
            command = command;
            criteria = criteria;
          };
        in [ (rule "split toggle" { app_id = ".*"; }) ];
      };
      keybindings = let 
        mod = cfg.config.modifier;
        audio = "exec ${pkgs.pamixer}/bin/pamixer";
        playerctl = "exec ${pkgs.playerctl}/bin/playerctl";
        light = "exec ${pkgs.light}/bin/light";
      in {

        "${mod}+Return" = "exec ${cfg.config.terminal}";
        "${mod}+q" = "kill";
        "${mod}+d" = "exec ${cfg.config.menu}";
        
        XF86AudioRaiseVolume = "${audio} -i 5";
        XF86AudioLowerVolume = "${audio} -d 5";
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
        "${mod}+Shift+1" =
          "move container to workspace number 1";
        "${mod}+Shift+2" =
          "move container to workspace number 2";
        "${mod}+Shift+3" =
          "move container to workspace number 3";
        "${mod}+Shift+4" =
          "move container to workspace number 4";
        "${mod}+Shift+5" =
          "move container to workspace number 5";
        "${mod}+Shift+6" =
          "move container to workspace number 6";
        "${mod}+Shift+7" =
          "move container to workspace number 7";
        "${mod}+Shift+8" =
          "move container to workspace number 8";
        "${mod}+Shift+9" =
          "move container to workspace number 9";

      };
      colors = {
        focused = {
          border = base.theme.colors.primary.foreground;
          background = base.theme.colors.primary.background;
          text =  base.theme.colors.primary.foreground;
          indicator = base.theme.colors.primary.foreground;
          childBorder = base.theme.colors.primary.foreground;
        };
      };
      gaps = {
        inner = 2;
        outer = 0;
      };
    };
	};
}
