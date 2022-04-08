{ config, pkgs, ... }:
with builtins;
let 
    sys = import ../../resources/settings/system.nix { pkgs = pkgs; config = config; };
    sysTheme = import ../../resources/settings/appearance.nix { pkgs = pkgs; };
in {
 wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = {
      modifier = "Mod4";
      terminal = "${pkgs.kitty}/bin/kitty";
      seat = { "*" = { hide_cursor = "when-typing enable"; }; };
      gaps = {
          inner = 2;
          outer = 0;
      };
      input = {
        "type:keyboard" = {
            xkb_layout = sys.keyboard.layout;
            xkb_options = "grp:alt_caps_toggle";
            xkb_numlock = "enabled";
        };
        "type:touchpad" = {
            tap = "enabled";
            natural_scroll = "disabled";
            scroll_method = "two_finger";
        };
      };
      keybindings = sys.keybindings;
      startup = map(app: { command = app; }) sys.autoStart;
    };
    extraConfig = ''
      seat seat0 xcursor_theme ${sysTheme.cursor.theme.name} ${sysTheme.cursor.theme.size}
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
      export NO_AT_BRIDGE=1;
      export NIXPKGS_ALLOW_UNFREE=1; # forgive-me Richard stallsan, OwO
    '';
 };
}