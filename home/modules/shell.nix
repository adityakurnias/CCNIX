{
  programs.zsh = {
    enable = true;

    shellAliases = {
      ll = "eza -lgh --icons";
      ls = "eza --icons";
      nixupdate = "sudo nix flake update";
      nixbuild = "sudo nixos-rebuild switch --flake /etc/nixos/#ccnixos";
      
      # Git aliases
      gs  = "git status";
      ga  = "git add";
      gaa = "git add .";
      gc  = "git commit";
      gcm = "git commit -m";
      gp  = "git push";
      gpl = "git pull";
      gco = "git checkout";
      gb  = "git branch";
      gl  = "git log --oneline --graph --decorate";
    };

    initContent = ''
      fastfetch

      export PATH=/home/kurnias/.local/bin:$PATH
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
