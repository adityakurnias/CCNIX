{
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

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "z"
      ];

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
