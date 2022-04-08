{ home-manager, services, pkgs, ... }:
with pkgs;
with sway-contrib;
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
        # <---- GUI ----> 
        gnome.nautilus gnome.seahorse  
        firefox font-manager easyeffects
        pinentry pinentry-curses gnupg
        discord betterdiscordctl vscode
        mako vanilla-dmz ubuntu_font_family
        # <---- AUTH ----> 
        polkit_gnome gnome.gnome-keyring
        # <---- CLI ----> 
        with-shell dri
        gh git xdg-utils
        bat exa zellij
        neofetch nixfmt
        docker-compose 
        fzf lolcat
        pamixer playerctl libnotify
        ffmpeg ripgrep light wl-clipboard
        # <---- LANG ---> 
        rustup elixir
        cached-nix-shell
        clang libstdcxx5
        deno nodejs

        # <--- DESK ----> 
        eww wofi grimshot
        # <--- FONT ----> 
        (nerdfonts.override 
            { fonts = [ "Iosevka" "FiraCode"]; })
        noto-fonts
        noto-fonts-cjk
        noto-fonts-emoji
        liberation_ttf
        fira-code
        fira-code-symbols
        
        # <--- THEME ---> 
        papirus-icon-theme
        arc-theme
        numix-cursor-theme 
    ];
    xdg = {
        enable = true;
    };

    programs.command-not-found.enable = true;
    imports = [
        ./modules/apps/desktop/sway.nix
        ./modules/apps/desktop/gtk.nix
        ./modules/apps/desktop/kitty.nix
        ./modules/apps/browser/firefox.nix
        ./modules/apps/editor/emacs.nix
        ./modules/apps/tools/git.nix
        ./modules/services/gnupg.nix
    ];
}
