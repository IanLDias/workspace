# Nix-Darwin Environment Setup

This repository contains the configuration for a reproducible computer environment using nix-darwin for macOS nix modules. For more information, visit the [nix-darwin GitHub repository](https://github.com/LnL7/nix-darwin).

## Setup for a New Computer

1. [Install Nix](https://nixos.org/download/)

1. Replace the location of the flake:

   ```bash
   sed -i '' "s/simple/$(scutil --get LocalHostName)/" flake.nix
   ```

1. Determine the correct `hostPlatform` for Mac architecture in `flake.nix`:
   - For Intel Macs: `nixpkgs.hostPlatform = "x86_64-darwin";`
   - For Apple Silicon Macs: `nixpkgs.hostPlatform = "aarch64-darwin";`

## Installing a Package

1. To search for packages, use [https://search.nixos.org/packages](https://search.nixos.org/packages)
2. Add the package to `flake.nix` in the `environment.systemPackages` list
3. Run the following command:
   ```
   darwin-rebuild switch --flake .#MacBook-Pro-Work
   ```

## Updating a Package

To update packages, run the following commands:

```bash
nix flake update
darwin-rebuild switch --flake .#MacBook-Pro-Work
```

## Updating nix-darwin

To update nix-darwin itself, use these commands:

```bash
nix-channel --update darwin
darwin-rebuild changelog
```

## Note

This setup doesn't use [nix-homebrew](https://github.com/zhaofengli/nix-homebrew), as it's still an early project.

## Home Manager

https://nix-community.github.io/home-manager/#sec-install-nix-darwin-module
