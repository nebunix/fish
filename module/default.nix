{ systemInformation, ... }:
{
  home-manager.users."${systemInformation.userName}" = {
    programs.fish.enable = true;

    programs.lsd.enable = true;
    programs.fish.shellAbbrs.ls = "lsd";

    programs.zoxide.enable = true;
    programs.fish = {
      interactiveShellInit = "zoxide init fish | source";
      shellAbbrs.cd = "z";
    };

    programs.bat.enable = true;
    programs.fish.shellAbbrs.cat = "bat";

    programs.kitty.settings.shell = "fish";
  };
}
