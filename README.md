# ❄️ CCNIX — Idiomatic NixOS & Home Manager Configuration

Welcome to the **CCNIX** configuration repository! This codebase is built with extreme reproducibility, deep functional abstractions, and declarative APIs at its core. It is divided clearly between system-level definitions (`hosts`, `modules/nixos`, `profiles/core`) and user-specific dotfiles (`profiles/kurnias`).

---

## 📖 Basic Usage (Quick Start)

If you are just looking to deploy or rebuild the OS without worrying about how the modules work under the hood, this section is for you.

### 1. Rebuilding the System
This configuration utilizes `nh` (Nix Helper) for clean, colorful CLI outputs and strict flake integration.

Whenever you make a modification to the system variables you can rebuild the host OS via:
```bash
# This wrapper alias is loaded into your zsh automatically!
nixbuild
# (Which effectively runs: nh os switch ~/CCNIX)
```

To update your user-specific packages (Home Manager):
```bash
homebuild
# (Which effectively runs: nh home switch ~/CCNIX)
```

### 2. Updating Lock Files
To bump packages to their newest `nixos-unstable` version:
```bash
nix flake update
nh os switch
```

---

## 🛠️ Intermediate Usage (Configuring the System)

The greatest strength of this config is the **Toggleable API** pattern. You do not need to read through hundreds of lines of confusing `.nix` logic to turn features on or off.

All customizations are localized in:
1. `hosts/ccnixos/configuration.nix` (Host Entrypoint)
2. `profiles/core/default.nix` (System Services Profile)
3. `profiles/kurnias/home.nix` (User Profile)

### Turning Features On and Off
Assume you want to disable Docker or modify the system hostname. Open `profiles/core/default.nix` and modify the configuration blocks:

```nix
# Toggle Desktop UI
ccnix.desktop.enable = true;

# Toggle Docker Daemon & Arion
ccnix.virtualisation.docker.enable = false;

# Customize Networking
ccnix.networking = {
  enable = true;
  hostName = "new-ccnixos-hostname";
  disableFirewall = false; # Set to true to drop the nftables/firewall daemon natively.
};
```

### Toggling Home Manager Packages
To toggle bulk packages on or off without tracking down individual entries, edit `profiles/kurnias/home.nix`:
```nix
ccnix.userProfile.packages = {
  enableCliTools = true;      # Installs bat, eza, zoxide, btop
  enableThemingTools = true;  # Installs cava, matugen, sassc
};
```

---

## 🧠 Advanced Usage (Writing Idiomatic Nix Modules)

If you intend to extend this Flake to add entirely new workflows (like a dedicated gaming profile, or a server infrastructure definition), follow the strict abstraction guidelines defined in this codebase.

### 1. Directory Strictness
- **`modules/nixos/`**: Contains pure API definitions. **Do not put active configurations here**. Use `lib.mkEnableOption`, `lib.mkOption`, and `lib.mkIf`.
- **`profiles/`**: These files pull in the `modules/nixos/` APIs and evaluate the variables to build distinct flavors.
- **`hosts/`**: Contains ONLY the hardware generation (`hardware-configuration.nix`) and the master imports list.

### 2. Creating a New Idiomatic Module
When adding a new feature (e.g., `modules/nixos/gaming.nix`), do not do this:
```nix
# BAD PATTERN (Hardcoded & Uncomposable)
{ pkgs, ... }: {
  programs.steam.enable = true;
  environment.systemPackages = [ pkgs.mangohud ];
}
```

Instead, use the `ccnix` scope strictly defined by `mkDefault` overlays:
```nix
# GOOD PATTERN (Inside modules/nixos/gaming.nix)
{ config, lib, pkgs, ... }:
let
  cfg = config.ccnix.gaming;
in {
  options.ccnix.gaming = {
    enable = lib.mkEnableOption "CCNIX gaming optimizations";
  };

  config = lib.mkIf cfg.enable {
    programs.steam.enable = lib.mkDefault true;
    environment.systemPackages = [ pkgs.mangohud ];
  };
}
```

By ensuring every option is guarded behind an `options` declaration, adding new features will never crash independent profiles unless explicitly called.

### 3. Avoiding Scope Leaks
Do not use `with pkgs; [ wget git ];`. While tutorials show this, it obscures the environment closure. Always define explicitly: `[ pkgs.wget pkgs.git ];`.
