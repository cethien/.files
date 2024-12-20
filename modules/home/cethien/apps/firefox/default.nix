{ lib
, pkgs
, config
, namespace
, ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;
  cfg = config.${namespace}.apps.firefox;
in
{
  options.${namespace}.apps.firefox = {
    enable = mkBoolOpt false "Enable Firefox";
  };

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;

      profiles.${config.${namespace}.user.name} = {
        id = 0;
        name = config.${namespace}.user.name;

        search.default = "DuckDuckGo";

        settings = {
          "browser.aboutwelcome.enabled" = false;
          "browser.crashReports.unsubmittedCheck.autoSubmit2" = true;
          "browser.discovery.enabled" = false;
          "browser.laterrun.enabled" = true;
          "browser.warnOnQuitShortcut" = false;
          "browser.tabs.loadBookmarksInTabs" = true;
          "browser.search.openintab" = true;
          "toolkit.telemetry.reportingpolicy.firstRun" = false;
          "trailhead.firstrun.didSeeAboutWelcome" = true;
          "signon.management.page.breach-alerts.enabled" = false;
          "extensions.formautofill.addresses.enabled" = false;
          "extensions.formautofill.creditCards.enabled" = false;
          "privacy.donottrackheader.enabled" = true;
          "privacy.globalprivacycontrol.enabled" = true;
          "browser.urlbar.suggest.quicksuggest.sponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.aboutConfig.showWarning" = false;
          "browser.ssb.enabled" = true;
        };

        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          bitwarden
        ];
      };
    };

    home.sessionVariables.BROWSER = "firefox";
  };
}
