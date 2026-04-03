{
  programs.zsh = {
    enable = true;

    sessionVariables = {
      FLAKE = "$HOME/CCNIX";
    };

    shellAliases = {
      ll = "eza -lgh --icons";
      ls = "eza --icons";

      nixbuild = "nh os switch";
      homebuild = "nh home switch";
      nhbuild = "nh os switch"; # keeping nhbuild for retro-compatibility

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

      export PATH="$HOME/.local/bin:$PATH"
      export PATH="$HOME/.bun/bin:$PATH"

      export PNPM_HOME="$HOME/.local/share/pnpm"
      case ":$PATH:" in
        *":$PNPM_HOME:"*) ;;
        *) export PATH="$PNPM_HOME:$PATH" ;;
      esac
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
