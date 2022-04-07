{ pkgs, ... }:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.yxqsnz = ../users/yxqsnz/home.nix;
}
