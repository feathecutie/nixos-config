# NOTE: This is a **very** outdated version of my flake, the current version exists at https://codeberg.org/feathecutie/flake/

# Fea's NixOS Configuration Flake

This is the flake I use for configuring my main NixOS system on my laptop and hopefully soon my server as well.

## Usage

This flake currently only exposes the NixOS configuration `laptop`.

In order to rebuild your existing NixOS system using this configuration, run
```sh
sudo nixos-rebuild switch --flake "github:feathecutie/nixos-config#laptop"
```
or an equivalent command.

### Assumptions

This configuration currently assumes several things about the system it's used on:
* 64bit x86 CPU
* EFI-based boot
* `FAT32` EFI partition with the partlabel `EFI system partition` (yeah still dualbooting Windows and afraid to brick Windows if I change that partlabel)
* `btrfs` partition with the partlabel `nixos` and the subvolumes `nix` (for mounting `/nix`) and `root` (for mounting `/`)

The configuration also currently sets passwords for the existing users that I won't be exposing here. I'll try to figure out a way to use this configuration without having to know preexisting passwords.

## Repository structure

| File/Directory | Explanation|
| --- | --- |
| `flake.nix` | Describes dependencies on other flakes ("inputs") and exposes structered configuration ("outputs"); this is essentially what makes this repository a "flake" |
| `flake.lock` | Lock file enforcing specific versions/commits of all flake inputs |
| `lib/` | Collection of nix functions interally used in this crate; exposed via the `lib` flake output |
| `hosts/` | Host-specific collections of nix files that get parsed into a single NixOS module per host by the `customModule` function in `lib/customModule.nix` |
| `README.md` | ..self explanatory |

## Custom module structure

`hosts/` contains top-level directories representing the different hosts this flake is designed to be used on.

Currently, `hosts/laptop/` generates a NixOS module for the `laptop` nixosConfiguration and `hosts/server/` generates a NixOS module for the `server` nixosConfiguration.

`hosts/shared/` contains modules applying to both configurations, and is imported by both.

Each of these directories contains arbitrarily nested nix files where each nix file contains an attribute set with any of the following attributes:

| Attribute | Explanation |
| --- | --- |
| `system` | If present, this attribute has to contain a valid NixOS module that will be incorporated into the system configuration. See [here](https://nixos.wiki/wiki/NixOS_modules) for reference and [here](https://search.nixos.org/options) for possible configuration values. |
| `users` | If present, this attribute has to contain an attribute set where each attribute name is equal to an existing user and the corresponding value has to contain a valid Home Manager module that will be incoporated into the user's Home Manager configuration. See [here](https://nix-community.github.io/home-manager) for reference and [here](https://nix-community.github.io/home-manager/options.html) for possible configuration values. Not every `users` set has to define modules for all existing users. |
