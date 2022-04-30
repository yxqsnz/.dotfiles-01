return {
  keyboard = {
    layout = 'br-abnt2';
    modkey = 'Mod4';
  };
  apps = {
    terminal = 'alacritty';
    editor = 'nvim';
  };
  desktop = {
    tags = { "main", "web", "dev", 'discord', 'telegram' },
    rules = {
      { 'Alacritty', 'main' },
      { 'Firefox', 'web' },
      { 'Discord', 'discord' },
      { 'telegram-desktop', 'telegram' }
    };
  };
  ui = {
    theme = 'solar';
    gtk = {
      icon_theme = 'Papirus-Dark';
    };
    gaps = 5;
  },
  system = {
    autostart = {
      'setxkbmap br',
      'picom -b',
      'flameshot',
    };
  }
};
