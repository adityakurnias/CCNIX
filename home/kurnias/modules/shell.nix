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

      # ── ASDF COMPLETION ──────────────────────
      mkdir -p "$ASDF_DATA_DIR/completions"
      asdf completion zsh > "$ASDF_DATA_DIR/completions/_asdf" 2>/dev/null
      fpath=("$ASDF_DATA_DIR/completions" $fpath)
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
