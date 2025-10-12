{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    eza
    bat
    fastfetch
    zsh-z
    zsh-autocomplete
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

      
    '';

    history = {
      size = 10000;
      share = true;
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
	"z"
        "git"
      ];
      extraConfig = ''
                # Required for autocomplete with box: https://unix.stackexchange.com/a/778868
                zstyle ':completion:*' completer _expand _complete _ignored _approximate _expand_alias
                zstyle ':autocomplete:*' default-context curcontext 
                zstyle ':autocomplete:*' min-input 0

                setopt HIST_FIND_NO_DUPS

                autoload -Uz compinit
                compinit

                setopt autocd  # cd without writing 'cd'
                setopt globdots # show dotfiles in autocomplete list
      '';
    };
  };

  programs.starship = {
    enable = true;
  };
}
