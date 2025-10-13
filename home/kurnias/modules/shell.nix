{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zsh-autosuggestions
    zsh-autocomplete
    zsh-completions
    asdf-vm
  ];

  programs.zsh = {
    enable = true;

    shellAliases = {
      ll = "eza -lgh --icons";
      ls = "eza --icons";
      nixupdate = "sudo nix flake update";
      nixbuild = "sudo nixos-rebuild switch --flake /etc/nixos/#ccnixos";
    };

    initContent = ''
      fastfetch

      autoload -Uz compinit && compinit
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "z" "asdf" ];
      
      extraConfig = ''
        setopt autocd
        setopt globdots
      '';
    };
  };

  programs.starship = {
    enable = true;
  };
}
