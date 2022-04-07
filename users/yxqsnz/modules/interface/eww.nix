{ pkgs, ... }:
let 
  configs = import ../base/configs.nix;
in 
{
  programs.eww = {
    enable = true;
    package = pkgs.eww.override  { withWayland = true; };
  };
}
