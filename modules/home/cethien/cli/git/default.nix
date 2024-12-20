{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) types mkIf;
  inherit (lib.${namespace}) mkBoolOpt mkOpt;
  cfg = config.${namespace}.cli.git;
  user = config.${namespace}.user;
in
{
  options.${namespace}.cli.git = {
    enable = mkBoolOpt false "Enable git";
    userName = mkOpt types.str user.name "The name to configure git with.";
    userEmail = mkOpt types.str user.email "The email to configure git with.";
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      inherit (cfg) userName userEmail;
      lfs.enable = true;

      aliases = {
        ignore = "!gi() { curl -fsSL https://www.toptal.com/developers/gitignore/api/$@ ;}; gi";
      };

      extraConfig = {
        core = {
          eol = "lf";
          autocrlf = "input";
        };
        init.defaultBranch = "main";
        pull.rebase = true;
        push.autoSetupRemote = true;
        advice.addIgnoredFile = false;
        url = {
          "ssh://git@github.com".insteadOf = "https://github.com";
          "ssh://git@gitlab.com".insteadOf = "https://gitlab.com";
        };
      };

      diff-so-fancy.enable = true;
    };

    home.shellAliases = {
      gs = "git status";
      gd = "git diff";
      ga = "git add";
      gaa = "git add .";
      gaf = "git add -f";

      gc = "git commit";
      gcm = "git commit -m";
      gcam = "git commit -am";

      gco = "git checkout";
      gcob = "git checkout -b";

      gcl = "git clone";
      gclb = "git clone --bare";

      gf = "git fetch";

      gpl = "git pull";

      gps = "git push";

      glg = "git log --graph --oneline --decorate";

      gwa = "git worktree add";
      gwl = "git worktree list";
      gwt = "git worktree prune";

      gss = "git stash";
      gsp = "git stash pop";
    };
  };
}
