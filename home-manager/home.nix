{ config, pkgs, ... }:
let 
    config = import ./modules/base/configs.nix;
in { 
    home.username = "yxqsnz";
    home.homeDirectory = "/home/yxqsnz";
    home.file.".wpp.png" = {
            source = (builtins.fetchurl {
                url = config.theme.wallpaper.url;
                sha256 = config.theme.wallpaper.sha256;
            });
    };
    programs.home-manager.enable = true;
    imports = [
        ./modules/interface/sway.nix
        ./modules/interface/gtk.nix
#        ./modules/interface/waybar.nix
	./modules/apps/git.nix
        ./modules/apps/alacritty.nix
        ./modules/apps/starship.nix
        ./modules/apps/mako.nix
        ./manager.nix
        config.shell.package
    ];
}
