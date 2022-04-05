{ pkgs, ... }:
let 
  configs = import ../base/configs.nix;
in 
{
 programs.waybar = {
  enable = true;
  package = pkgs.waybar.override { pulseSupport = true; };
  style = ''
  '';
  settings = [{
    height = 40;
  }];

 };
}