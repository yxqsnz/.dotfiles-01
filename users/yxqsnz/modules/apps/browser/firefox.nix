{ pkgs, ... }:
with builtins;
let 
    userChrome = readFile (fetchurl {
        url = "https://raw.githubusercontent.com/marmmaz/FirefoxCSS/master/userChrome.css";
        sha256 = "df054e1014cc688aca72f6461c27d86664f079d71d58e3d2aeacff9831f2cc2a";
    });
in 
{
  programs.firefox = {
    enable = true;
    profiles = {
        flavor = {
            isDefault = true;
            settings = { 
                "layout.css.backdrop-filter.enabled" = true;
                "gfx.webrender.all" = true;
                "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
                "browser.uidensity" = 1;
            };
            #quserChrome = userChrome;
        };
    };
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        https-everywhere
        privacy-badger
        return-youtube-dislikes
        rust-search-extension
        search-by-image
        refined-github
        single-file
        sponsorblock
        stylus
        tampermonkey
        textern
        translate-web-pages
        terms-of-service-didnt-read
        don-t-fuck-with-paste
        df-youtube
        darkreader  
        auto-tab-discard
        add-custom-search-engine
        copy-selection-as-markdown
        a11ycss
        ff2mpv
        honey
        ipfs-companion
    ];
  };
}
