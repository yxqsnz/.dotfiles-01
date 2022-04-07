{ ... }:
{
  users.users.yxqsnz = {
    password = "nixos";
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
  };
}
