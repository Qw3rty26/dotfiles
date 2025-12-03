{ config, pkgs, ... }:

{
	services.xserver.enable = true;
	services.xserver.xkb.layout = "it";
	#servics.xserver.xkbOptions = "grp:

	services.xserver.displayManager.lightdm.enable = true;

	services.xserver.windowManager.i3.enable = true;
	services.xserver.excludePackages = [ pkgs.xterm ];
}
