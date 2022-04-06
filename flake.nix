{
  description = "uwu";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixos-unstable;
    utils.url = github:gytis-ivaskevicius/flake-utils-plus;


    nur.url = github:nix-community/NUR;

    neovim = {
      url = github:neovim/neovim?dir=contrib;
    };

    home-manager = {
      url = github:nix-community/home-manager/release-21.05;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  outputs = inputs@{ self, nixpkgs, utils, home-manager, neovim, nur }:
    utils.lib.mkFlake {
      inherit self inputs;


      channelsConfig.allowUnfree = true;

      sharedOverlays = [
        nur.overlay
        self.overlay
        # Use `neovim.packages.${system}.neovim`, for reproducibility with neovim's flake
        (utils.lib.genPkgOverlay neovim "neovim")
      ];


      # Modules shared between all hosts
      hostDefaults.modules = [
        home-manager.nixosModules.home-manager
        ./modules/sharedConfigurationBetweenHosts.nix
      ];


      hosts.Spooky.modules = [
        ./hosts/Spooky/default.nix
      ];


      overlay = import ./overlays;

    };
}

