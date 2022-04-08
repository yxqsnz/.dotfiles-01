{ pkgs, ... }: {
   imports = [ ./hardware-configuration.nix ../base.nix ];
   zramSwap.enable = true;
   zramSwap.memoryPercent = 150;
   time.timeZone = "America/Sao_Paulo";
   i18n.defaultLocale = "en_US.UTF-8"; 
   virtualisation.docker.enable = true;
   nix.settings.auto-optimise-store = true;
   nix.gc = {
     automatic = true;
     dates = "weekly";
     options = "--delete-older-than 30d";
   };
   services.dbus.packages = [ pkgs.gcr ];
   console = {
      keyMap = "br-abnt2";
      font = "Lat2-Terminus16";
   };
   fonts = {
      fontDir = {
	      enable = true;
      };
      fonts = with pkgs; [
         corefonts
      ];
   };
   services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
  };
  
   boot.kernelPackages = pkgs.linuxPackages_xanmod;
}
