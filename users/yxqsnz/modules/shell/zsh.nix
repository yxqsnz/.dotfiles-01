{ pkgs, ... }:
{
 programs.zsh = {
    enable = true;
    enableCompletion = true;
    plugins = [
    ];
    initExtra = ''
      bindkey "^[[H" beginning-of-line
      bindkey "^[[6~" end-of-line
      export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin"
      export GPG_TTY=$(tty)
      eval $(starship init zsh)
    '';
    shellAliases = {
      ll = "ls -l";
      system-update = "sudo nixos-rebuild switch";
      update = "home-manager switch";
      pls = "sudo";
      ls = "exa --icons";
      tree = "exa --tree --icons";
      "with" = "nix-shell -p";
    };
    history = {
      size = 10000;
      path = ".zsh_history";
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zdharma-continuum/fast-syntax-highlighting"; }
      ];
    };
  };
}
