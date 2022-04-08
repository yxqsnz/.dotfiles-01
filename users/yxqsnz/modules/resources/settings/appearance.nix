{ pkgs }:
{
    theme = ../themes/nord.nix;
    font = {
        name = "Fira Code";
        package = pkgs.fira-code;
        size = 11;
    };
    monospace = {
        font = {
            name = "Fira Code";
            size = 8;
        };
    };
    cursor = {
        theme = {
            name = "Vanilla-DMZ";
            size = "24";
        };
    };
    gtk = {
        theme = {
            package = pkgs.arc-theme; 
            name = "Arc-Dark";
        };
        iconTheme = {
            package = pkgs.papirus-icon-theme;
            name = "Papirus-Dark";
        };
    };
}
