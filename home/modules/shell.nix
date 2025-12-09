{
  programs.zsh = {
    enable = true;

    shellAliases = {
      ll = "eza -lgh --icons";
      ls = "eza --icons";
      nixbuild = "sudo nixos-rebuild switch --flake /etc/nixos/#ccnixos";
      homebuild = "home-manager switch --flake ~/CCNIX#kurnias";

      # Git aliases
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

      export PATH=/home/kurnias/.local/bin:$PATH
      export PATH="/home/kurnias/.bun/bin:$PATH"
      export PNPM_HOME="/home/kurnias/.local/share/pnpm"
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
  };
}
