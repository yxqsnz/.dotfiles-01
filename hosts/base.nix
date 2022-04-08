{ pkgs, ... }: {
   boot.loader.systemd-boot.enable = false;
   boot.loader.grub = {
     enable = true;
     efiSupport = true; 
     device = "nodev";
   };
   boot.loader.efi.canTouchEfiVariables = true;
   boot.loader.efi.efiSysMountPoint = "/boot";
   boot.plymouth.enable = true;
   programs.dconf.enable = true;
   security.rtkit.enable = true;
   networking.useDHCP = false;
   networking.networkmanager.enable = true;
   hardware.opengl.enable = true;
   hardware.opengl.driSupport = true;
   hardware.opengl.driSupport32Bit = true;
   imports = [
     ../users/yxqsnz/default.nix
     ../users/root/default.nix
   ];
}
