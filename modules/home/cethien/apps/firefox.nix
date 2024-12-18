{ lib, config, user, pkgs, ... }:

{
  options.user.apps.firefox.enable = lib.mkEnableOption "Enable Firefox";

  config = lib.mkIf config.user.apps.firefox.enable {
    programs.firefox = {
      enable = true;

      profiles.${user.username} = {
        id = 0;
        name = user.username;

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
          gsconnect

          multi-account-containers
          side-view

          firefox-color
          stylus

          ublock-origin
          unpaywall
          i-dont-care-about-cookies
          cookie-autodelete

          sponsorblock
          untrap-for-youtube

          bitwarden
        ];
      };
    };
  };
}
