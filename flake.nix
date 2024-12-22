{
  description = "cethien's dotfiles";

  outputs = inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ inputs.nur.overlays.default ];
      };
    in
    {
      devShells.x86_64-linux.default = pkgs.mkShell {
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
    }
    // {
      homeConfigurations."cethien@LPT-SOTNIKOW" = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
          meta = {
            hostname = "LPT-SOTNIKOW";
            nixos-config = "";
            home-manager-config = "cethien@LPT-SOTNIKOW";
            isNixOS = false;
            isWSL = true;
          };
        };
        modules = [
          ./homes/cethien_LPT-SOTNIKOW
        ];
      };

      homeConfigurations."cethien@tower-of-power" = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
          meta = {
            hostname = "tower-of-power";
            nixos-config = "tower-of-power";
            home-manager-config = "cethien@tower-of-power";
            isNixOS = true;
            isWSL = false;
          };
        };
        modules = [
          ./homes/cethien_tower-of-power
        ];
      };
    }
    // {
      nixosConfigurations."tower-of-power" = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          meta = {
            hostname = "tower-of-power";
          };
        };
        modules = [
          ./hosts/tower-of-power
        ];
      };
    };


  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    catppuccin.url = "github:catppuccin/nix";

    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:nixos/nixos-hardware";
  };
}
