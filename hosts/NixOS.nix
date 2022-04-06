{ suites, ... }:
{
  ### root password is empty by default ###
  imports = [
	suites.base
	./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
}
