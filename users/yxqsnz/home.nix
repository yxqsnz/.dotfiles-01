{ home-manager, services, pkgs, ... }:
with pkgs;

let 
    config = import ./modules/base/configs.nix;
    dri = pkgs.writeScriptBin "dri" ''
        pushd /home/yxqsnz/etc/me.dots >> /dev/null
        HOST=nixos
        if [[ "$1" == "switch" ]]; then
            nixos-rebuild switch --flake '.#nixos'
        fi
        if [[ $1 == "boot" ]]; then
            nixos-rebuild boot --flake '.#nixos' 
        fi
        if [[ $1 == "update" ]]; then
            git add -A
            git commit -m 'update'
        fi
        
        popd >> /dev/null
    '';

in { 
    home.username = "yxqsnz";
    home.homeDirectory = "/home/yxqsnz";
    fonts = {
        fontconfig = {
            enable = true;
        };
    };
    
    home.packages = [
        pavucontrol
        git
        zellij
        # other
        discord
        nixfmt
        betterdiscordctl
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
        pinentry pinentry-curses gnupg
        dri
    ];
    xdg = {
        enable = true;
    };

    programs.command-not-found.enable = true;
    imports = [
        ./modules/apps/desktop/sway.nix
        ./modules/apps/browser/firefox.nix
        ./modules/apps/editor/emacs.nix
        ./modules/apps/tools/git.nix
        ./modules/services/gnupg.nix
    ];
}
