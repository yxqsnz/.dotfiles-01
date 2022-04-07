{ pkgs, ... }: {
   boot.loader.systemd-boot.enable = true;
   boot.loader.efi.canTouchEfiVariables = true;
   boot.plymouth.enable = true;
   boot.kernelPackages = pkgs.linuxPackages_xanmod;
   networking.networkmanager.enable = true;
   imports = [
     ../users/yxqsnz/default.nix
     ../users/root/default.nix
   ];
}
