{ pkgs, ... }: {
   imports = [ ./hardware-configuration.nix ];
   # --- migrate this to another file lol
   boot.loader.systemd-boot.enable = true;
   boot.loader.efi.canTouchEfiVariables = true;
   boot.kernelPackages = pkgs.linuxPackages_zen;
   networking.networkmanager.enable = true;
}
