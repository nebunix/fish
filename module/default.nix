{ lib, systemInformation, ... }:

{
  home-manager.users."${systemInformation.userName}" = {
    programs.fish.enable = true;

    programs.lsd.enable = true;
    programs.fish.shellAbbrs.ls = "lsd";

    programs.zoxide.enable = true;
    programs.fish.shellAbbrs.cd = "z";

    programs.bat.enable = true;
    programs.fish.shellAbbrs.cat = "bat";

    programs.starship = {
      enable = true;
      settings = {
        format = lib.concatStrings [
          "$battery"
          "$directory"
          "$character"
        ];

        right_format = lib.concatStrings [
          "$git_branch"
          "$git_status"
        ];

        character = {
          success_symbol = "[~>](bold green)";
          error_symbol = "[~>](bold red)";
        };
      };
    };

    programs.fish.interactiveShellInit = ''
      zoxide init fish | source
      starship init fish | source
    '';
  };
}
