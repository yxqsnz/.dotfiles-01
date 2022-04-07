{ pkgs, ... }: {
   imports = [ ./hardware-configuration.nix ../base.nix ];
   zramSwap.enable = true;
   zramSwap.memoryPercent = 150;
   time.timeZone = "America/Sao_Paulo";
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
}
