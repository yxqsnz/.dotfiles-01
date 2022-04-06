{ hmUsers, ... }:
{
  home-manager.users = { inherit (hmUsers) yxqsnz; };

  users.users.yxqsnz = {
    password = "yxqsnz";
    description = "default";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
