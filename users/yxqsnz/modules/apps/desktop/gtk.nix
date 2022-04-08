{ pkgs, ... }:
let 
  sys = import ../../resources/settings/appearance.nix { pkgs = pkgs; };
in
{
  gtk = {
    enable = true;
    font = sys.font;
    theme = sys.gtk.theme;
    iconTheme = sys.gtk.iconTheme;
  };
}