# A triple-function. (system, user, darwin) -> (name) -> (nix-homebrew, nixpkgs, inputs)
{ nix-homebrew, nixpkgs, inputs, ... }:

name: 
{
    system,
    user,
    darwin ? { setupHomebrew = false; }, # If setupHomebrew is false it will still download
    # casks and brews. setupHomebrew only installs homebrew with nix-homebrew and setups
    # declarative taps.
}:

let
    isDarwin = darwin != false;

    machineConfig = ../machines/${name}.nix;
    userOSConfig = ../users/${user}/${if isDarwin then "darwin" else "nixos"}.nix;
    userHMConfig = ../users/${user}/home-manager.nix;

    systemFunc = if isDarwin then inputs.nix-darwin.lib.darwinSystem else nixpkgs.lib.nixosSystem;
    home-manager = if isDarwin then inputs.home-manager.darwinModules else inputs.home-manager.nixosModules;
in systemFunc rec {
    inherit system;

    modules = [

        { nixpkgs.config.allowUnfree = true; }

        machineConfig
        userOSConfig
        home-manager.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${user} = import userHMConfig {
                inputs = inputs;
            };
        }

        {
            config._module.args = {
                currentSystem = system;
                currentSystemName = name;
                currentSystemUser = user;
                isWSL = false;
                inputs = inputs;
            };
        }
    ] ++ (if darwin.setupHomebrew then [
        nix-homebrew.darwinModules.nix-homebrew {
            nix-homebrew = {
                enable = true;
                enableRosetta = true;
                user = user;
                taps = {
                    "homebrew/homebrew-core" = inputs.homebrew-core;
                    "homebrew/homebrew-cask" = inputs.homebrew-cask;
                };
            };
        }
    ] else []);
}
