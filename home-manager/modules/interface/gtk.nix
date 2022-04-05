{ pkgs, ... }:
# TODO: Re-write this
with pkgs;
let 
  cursor-theme-name = "Numix-Cursor-Dark";
  theme = arc-theme;
  themeName = "Arc-Dark";
  iconTheme = papirus-icon-theme;
  iconThemeName = "Papirus-Dark";
in {
  gtk.enable = true;
  gtk.iconTheme.package = iconTheme;
  gtk.iconTheme.name = iconThemeName;
  gtk.theme.package = theme;
  gtk.theme.name = themeName;
  gtk.gtk2.extraConfig = ''
    gtk-cursor-theme-name = "${cursor-theme-name}"
  '';
  gtk.gtk3.extraConfig = {
    gtk-cursor-theme-name = cursor-theme-name;
  };
}
