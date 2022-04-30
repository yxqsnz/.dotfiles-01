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
    tags = { "main", "web", "dev", "term", 'discord', 'telegram' },
    rules = {
      { 'alacritty', 'term' },
      { 'firefox', 'web' },
      { 'Discord', 'discord' },
      { 'telegram', 'telegram' }
    };
  };
  ui = {
    theme = 'solar';
    gtk = {
      icon_theme = 'Papirus-Dark';
    };
    gaps = {
      inter = 10;
      outer = 10;
    };
  },
  system = {
    autostart = {
      'pipewire',
      'pipewire-pulse',
      'alacritty',
      'picom -b',
      'firefox',
      'discord',
      'telegram-desktop'
    };
  }
};
