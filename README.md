# ❄️ CCNIX — Idiomatic NixOS & Home Manager Configuration

Welcome to **CCNIX**! 
This repository serves as a meticulously engineered, 100% reproducible declarative NixOS configuration. It utilizes modern Flake inputs, API-first abstraction for all modules, and a clean separation of system hosts and user profiles.

This README is designed to cover every practical action a user might want to perform within this codebase.

---

## 📂 Project Structure Overview

Understanding the structure is the key to mastering this configuration:
- `flake.nix` / `flake.lock`: Entry points. Pins dependencies globally and declares the target machines.
- `hosts/`: Contains machine-specific entry points (like `ccnixos`). Features specifically bound to hardware go in `hardware-configuration.nix`.
- `profiles/core/`: The absolute central hub for activating system-level options (networking, audio, system apps, docker).
- `profiles/kurnias/`: Home Manager configurations and user-specific package toggles (themes, games, developer tools).
- `modules/nixos/`: Pure API definitions for NixOS features (e.g., `docker.nix`, `desktop.nix`). Defines variables but **doesn't activate them**.

---

## 🚀 1. The Basics: Building & Upgrading

This setup relies heavily on the `nh` (Nix Helper) CLI, which simplifies traditional `nixos-rebuild` commands and tracks flakes effortlessly.

### Rebuilding System Configurations
When you modify anything inside `hosts/`, `profiles/core/`, or `modules/nixos/`, rebuild the OS locally using your zsh alias:
```bash
nixbuild 
# (Which effectively runs: nh os switch ~/CCNIX)
```

### Rebuilding User Packages (Home Manager)
When you modify anything inside `profiles/kurnias/`, rebuild your user space via:
```bash
homebuild
# (Which effectively runs: nh home switch ~/CCNIX)
```

### Updating the Flake (Upgrading Packages)
If you want to pull the latest versions of your packages from the `nixos-unstable` channel to upgrade your entire system:
```bash
nix flake update
nixbuild
```

### Garbage Collection (Cleaning the Nix Store)
Recover disk space safely by clearing unused Nix store paths while preserving the last 3 generations:
```bash
nh clean all --keep 3
```

---

## ⚙️ 2. Intermediate: Modifying the System

You **never need to write heavy `.nix` logic to turn features on or off**. Everything has been wrapped using `lib.mkIf` and `lib.mkOption` toggles to create a clean API.

### Activating System Modules
To toggle core features on your environment, open `profiles/core/default.nix`. You will see a list of logical switches like this:

```nix
  ccnix.system.boot.enable = true;
  ccnix.virtualisation.docker.enable = true;
  ccnix.desktop.enable = true;
```
To turn something off globally across the entire OS, just change `true` to `false` and run `nixbuild`.

### Editing Networking Configurations
Networking logic is exposed through a safe API in `profiles/core/default.nix`:
```nix
  ccnix.networking = {
    enable = true;
    hostName = "my-new-machine";
    disableFirewall = false; # Set to true to drop the firewall natively via mkDefault overlays
  };
```

### Managing Personal Apps & DevTools
User-specific applications should be strictly categorized. Edit `profiles/kurnias/home.nix` to toggle your personal software bundles:
```nix
  ccnix.userProfile.packages.enableSystemUtilities = true; # wl-clipboard, cliphist, etc.
  ccnix.userProfile.packages.enableThemingTools = true;    # matugen, cava, sassc
  ccnix.userProfile.devTools.enable = true;                # vscode, nvim, nodejs, rust, go
  ccnix.userProfile.games.enable = true;                   # osu-lazer
  ccnix.userProfile.apps.internet.enable = true;           # vesktop, zen-browser, firefox
```

### Managing Docker & Arion (Containerization)
By ensuring `ccnix.virtualisation.docker.enable = true;` is active, your system automatically wires up Docker and Arion. Arion uses Nix modules to define `docker-compose` projects natively within the Nix store.

To construct or edit your running containers, review `modules/nixos/docker.nix`. An Arion PostgreSQL database is already scaffolded there:
```nix
virtualisation.arion = {
  backend = "docker";
  projects = {
    "db".settings.services."db".service = {
      restart = "unless-stopped";
      environment = { POSTGRES_PASSWORD = "password"; }; 
    };
  };
};
```

---

## 🧠 3. Advanced: Creating New Custom Modules

To ensure extreme reproducibility and prevent merge conflicts if you scale to multiple machines, **you must never hardcode `programs.<name>.enable = true` directly into a profile unless it is wrapped in an option.**

Let's assume you want to add an experimental **Video Editing** module.

1. **Create the API file (`modules/nixos/video.nix`)**
```nix
{ config, lib, pkgs, ... }:

let
  cfg = config.ccnix.multimedia.video;
in {
  # Define your custom option API
  options.ccnix.multimedia.video = {
    enable = lib.mkEnableOption "Enable Davinci Resolve and related video tools";
  };

  # Inject the exact logic ONLY if `enable` is checked.
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.davinci-resolve
      pkgs.ffmpeg
    ];
  };
}
```

2. **Register the API (`profiles/core/default.nix`)**
Make sure Nix is aware of your module by adding it to the `imports` list:
```diff
  imports = [
    # ...
+   ../../modules/nixos/video.nix
  ];
```

3. **Activate the API! (`profiles/core/default.nix`)**
Now, anyone parsing your flake can provision the entire video editing setup cleanly via:
```nix
  ccnix.multimedia.video.enable = true;
```

### Critical Rules
- **Prevent Scope Leaks:** When importing packages inside this repository, **do not use `with pkgs;`**. Always explicitly name the derivation constraint (e.g., `[ pkgs.firefox pkgs.git ]`) to ensure airtight builds that don't break as Nixpkgs evolves.
- **Avoid Hardcoding Default Rejections:** If your module wants to turn something off (like printing), use `lib.mkDefault false;` so that dependent endpoints can securely flip it back to `true` without fatal evaluation errors.
