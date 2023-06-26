{ config, pkgs, ... }:

{
  home.username = "netetra";
  home.homeDirectory = "/home/netetra";
  home.stateVersion = "23.05";

  

  programs.home-manager.enable = true;
}
