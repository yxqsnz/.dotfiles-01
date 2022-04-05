{ pkgs, config, ... }:
with pkgs;
with sway-contrib;
{
    nixpkgs.config.allowUnfree = true;
    programs.command-not-found.enable = true;
    programs.emacs.enable = true;
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
        discord betterdiscordctl
        # <---- AUTH ----> 
        polkit_gnome gnome.gnome-keyring
        # <---- CLI ----> 
        with-shell tmux
        gh git xdg-utils
        bat exa
        neofetch
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
        mplus-outline-fonts
        # <--- THEME ---> 
        papirus-icon-theme
        arc-theme
        numix-cursor-theme        
    ];
}
