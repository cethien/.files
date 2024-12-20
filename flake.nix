{
  description = "cethien's dotfiles";

  outputs = inputs:
    let
      lib = inputs.snowfall-lib.mkLib {
        inherit inputs;
        src = ./.;
      };
    in
    lib.mkFlake
      {
        inherit inputs;
        src = ./.;

        channels-config = {
          allowUnfree = true;
          permittedInsecurePackages = [ ];
        };

        overlays = with inputs; [
          nur.overlays.default
        ];

        systems.modules.nixos = with inputs; [
          home-manager.nixosModules.home-manager
          catppuccin.nixosModules.catppuccin
        ];

        systems.hosts.surface.modules = with inputs; [
          nixos-hardware.nixosModules.microsoft-surface-pro-intel
        ];

        homes.modules = with inputs; [
          nur.modules.homeManager.default
          catppuccin.homeManagerModules.catppuccin
          spicetify-nix.homeManagerModules.default
        ];

      } // {
      devShells.x86_64-linux.default =
        let
          system = "x86_64-linux";
          pkgs = import inputs.nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
        in
        pkgs.mkShell {
          buildInputs = with pkgs; [
            git
            just
            nil
            nixpkgs-fmt
          ];

          shellHook = ''
            if [ ! -f .envrc ]; then
              echo "use flake" > .envrc && direnv allow
            fi
          '';
        };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    snowfall-lib.url = "github:snowfallorg/lib";
    snowfall-lib.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:nixos/nixos-hardware";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    catppuccin.url = "github:catppuccin/nix";

    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";
  };
}
