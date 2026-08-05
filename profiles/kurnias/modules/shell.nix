{
  programs.zsh = {
    enable = true;

    sessionVariables = {
      FLAKE = "$HOME/CCNIX";
    };

    shellAliases = {
      ll = "eza -lgh --icons auto";
      ls = "eza --icons auto";

      nixbuild = "nixos-rebuild switch --flake ~/CCNIX#ccnixos";
      homebuild = "nh home switch";
      nhbuild = "nh os switch"; 

      # Git
      gs = "git status";
      ga = "git add";
      gaa = "git add .";
      gc = "git commit";
      gcm = "git commit -m";
      gp = "git push";
      gpl = "git pull";
      gco = "git checkout";
      gb = "git branch";
      gl = "git log --oneline --graph --decorate";
    };
    
    initContent = ''
      fastfetch

      if [ -f $HOME/.zshrc.local ]; then
        source $HOME/.zshrc.local
      fi
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
    enableZshIntegration = true;
  };
}
