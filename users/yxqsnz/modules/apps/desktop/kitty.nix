{ pkgs, ... }:
let
  sys = import ../../resources/settings/appearance.nix { pkgs = pkgs; };
in {
  programs.kitty = {
    enable = true;
    settings = { 
      font_size = sys.monospace.font.size;
      font_family = sys.monospace.font.name;
    };
  };
}