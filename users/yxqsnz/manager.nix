{ pkgs, config, ... }:
with pkgs;
with sway-contrib;
{
    programs.command-not-found.enable = true;
    programs.emacs.enable = true;
    fonts = {
        fontconfig = {
            enable = true;
        };
    };

    home.packages = [
        # <---- GUI ----> 
        gnome.nautilus gnome.seahorse gnome.gnome-boxes
        firefox font-manager easyeffects
        pinentry pinentry-curses gnupg brave
        discord betterdiscordctl jetbrains.idea-community 
        bottom lld foot
        # <---- AUTH ----> 
        polkit_gnome gnome.gnome-keyring gcr
        # <---- CLI ----> 
        with-shell tmux inotify-tools
        gh git xdg-utils sccache
        unzip
        bat exa
        neofetch
        docker-compose 
        fzf lolcat
        pamixer playerctl libnotify
        ffmpeg ripgrep light wl-clipboard
        # <---- LANG ---> 
        rustup elixir elixir_ls erlang
        rust-analyzer python310
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
}
