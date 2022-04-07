{ 
  shell = {
    package = ../shell/zsh.nix;
    name = "zsh";
  };
  theme = import ../assets/themes/darkblueice.nix;
  autoStart = []; 
}
